/*
  Copyright (C) 2022  Selwin van Dijk

  This file is part of signalbackup-tools.

  signalbackup-tools is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  signalbackup-tools is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with signalbackup-tools.  If not, see <https://www.gnu.org/licenses/>.
*/

#include "signalbackup.ih"

#include "../sqlcipherdecryptor/sqlcipherdecryptor.h"
#include "../msgtypes/msgtypes.h"

/*
  Known missing things:
   - message types other than 'incoming' and 'outgoing'
     - 'group-v2-change' (group member add/remove/change group name/picture
   - inserting into group-v1-type groups
   - all received/read receipts
   - quotes can contain mentions
   -
   - more...
 */

bool SignalBackup::importFromDesktop(std::string configdir, std::string databasedir, bool ignorewal)
{
  if (configdir.empty() || databasedir.empty())
  {
    // try to set dir automatically
    auto [cd, dd] = getDesktopDir();
    configdir = cd;
    databasedir = dd;
  }

  // check if a wal (Write-Ahead Logging) file is present in path, and warn user to (cleanly) shut Signal Desktop down
  if (!ignorewal &&
      bepaald::fileOrDirExists(databasedir + "/db.sqlite-wal"))
  {
    // warn
    return false;
  }

  SqlCipherDecryptor sqlcipherdecryptor(configdir, databasedir);
  if (!sqlcipherdecryptor.ok())
  {
    std::cout << bepaald::bold_on << "Error" << bepaald::bold_off << " : Failed to open database" << std::endl;
    return false;
  }

  auto [data, size] = sqlcipherdecryptor.data(); // unsigned char *, uint64_t

  // disable WAL (Write-Ahead Logging) on database, reading from memory otherwise will not work
  // see https://www.sqlite.org/fileformat.html
  if (data[0x12] == 2)
    data[0x12] = 1;
  if (data[0x13] == 2)
    data[0x13] = 1;

  std::pair<unsigned char *, uint64_t> desktopdata = {data, size};
  SqliteDB ddb(&desktopdata);
  if (!ddb.ok())
  {
    std::cout << bepaald::bold_on << "Error" << bepaald::bold_off << " : Failed to open database" << std::endl;
    return false;
  }

  // get all conversations (conversationpartners) from ddb
  SqliteDB::QueryResults results;
  if (!ddb.exec("SELECT id,type,uuid,groupId FROM conversations WHERE json_extract(json, '$.messageCount') > 0", &results))
    return false;

  std::cout << "Conversations in desktop:" << std::endl;
  results.prettyPrint();

  // for each conversation
  for (uint i = 0; i < results.rows(); ++i)
  {

    std::cout << "Trying to match conversation (" << i + 1 << "/" << results.rows() << ")" << std::endl;

    // get the actual id
    bool isgroupconversation = false;
    std::string person_or_group_id;
    if (results.valueAsString(i, "type") == "group")
    {
      auto [groupid_data, groupid_data_length] = Base64::base64StringToBytes(results.valueAsString(i, "groupId"));
      if (groupid_data && groupid_data_length != 0)
      {
        //std::cout << bepaald::bytesToHexString(groupid_data, groupid_data_length, true) << std::endl;
        person_or_group_id = "__signal_group__v2__!" + bepaald::bytesToHexString(groupid_data, groupid_data_length, true);
        isgroupconversation = true;
        bepaald::destroyPtr(&groupid_data, &groupid_data_length);
      }
    }
    else
      person_or_group_id = results.valueAsString(i, "uuid"); // single person id, if group, this is empty

    if (person_or_group_id.empty())
    {
      //std::cout << bepaald::bold_on << "Warning" << bepaald::bold_off << "Useful error message" << std::endl;
      continue;
    }

    // get matching thread id from android database
    SqliteDB::QueryResults results2;
    if (!d_database.exec("SELECT _id FROM thread WHERE " + d_thread_recipient_id + " IS (SELECT _id FROM recipient WHERE (uuid = ? OR group_id = ?))",
                         {person_or_group_id, person_or_group_id}, &results2) ||
        results2.rows() != 1)
    {
      std::cout << bepaald::bold_on << "Warning" << bepaald::bold_off << " : Failed to find matching thread for conversation, skipping. (id: " << person_or_group_id << ")" << std::endl;
      continue;
    }

    std::cout << "Match for " << person_or_group_id << std::endl;
    results2.prettyPrint();

    long long int ttid = results2.getValueAs<long long int>(0, "_id"); // ttid : target thread id
    std::cout << "ID of thread in Android database that matches the conversation in desktopdb: " << ttid << std::endl;

    // now lets get all messages for this conversation
    SqliteDB::QueryResults results_all_messages_from_conversation;
    if (!ddb.exec("SELECT "
                  "rowid,"
                  "json_extract(json, '$.quote') AS quote,"
                  // "json_extract(json, '$.quote.id') AS quote_id,"
                  // "json_extract(json, '$.quote.authorUuid') AS quote_author_uuid,"
                  // "json_extract(json, '$.quote.text') AS quote_text,"
                  // "json_extract(json, '$.quote.attachments') AS quote_attachments,"
                  // "json_extract(json, '$.quote.bodyRanges') AS quote_bodyranges,"
                  // "json_extract(json, '$.quote.type') AS quote_type,"
                  // "json_extract(json, '$.quote.referencedMessageNotFound') AS quote_referencedmessagenotfound,"
                  // "json_extract(json, '$.quote.isGiftBadge') AS quote_isgiftbadge,"
                  // "json_extract(json, '$.quote.isViewOnce') AS quote_isviewonce,"
                  "IFNULL(json_array_length(json, '$.attachments'), 0) AS numattachments,"
                  "IFNULL(json_array_length(json, '$.reactions'), 0) AS numreactions,"
                  "IFNULL(json_array_length(json, '$.bodyRanges'), 0) AS nummentions,"
                  "body,"
                  "type,"
                  "sent_at,"
                  //"received_at,"
                  "hasAttachments,"      // any attachment
                  "hasFileAttachments,"  // non-media files? (any attachment that does not get a preview?)
                  "hasVisualMediaAttachments," // ???
                  "isErased,"
                  "serverGuid,"
                  "sourceUuid,"
                  "seenStatus,"
                  "isStory"
                  //","
                  " FROM messages WHERE conversationId = ?",
                  results.value(i, "id"), &results_all_messages_from_conversation))
      return false;
    results_all_messages_from_conversation.prettyPrint();

    // this map will map desktop-recipient-uuid's to android recipient._id's
    std::map<std::string, long long int> recipientmap;

    for (uint j = 0; j < results_all_messages_from_conversation.rows(); ++j)
    {
      std::cout << "Message " << j + 1 << "/" << results_all_messages_from_conversation.rows() << ":" << std::endl;

      long long int rowid = results_all_messages_from_conversation.getValueAs<long long int>(j, "rowid");
      //bool hasattachments = (results_all_messages_from_conversation.getValueAs<long long int>(j, "hasAttachments") == 1);
      bool outgoing = results_all_messages_from_conversation.valueAsString(j, "type") == "outgoing";
      bool incoming = results_all_messages_from_conversation.valueAsString(j, "type") == "incoming";
      long long int numattachments = results_all_messages_from_conversation.getValueAs<long long int>(j, "numattachments");
      long long int numreactions = results_all_messages_from_conversation.getValueAs<long long int>(j, "numreactions");
      long long int nummentions = results_all_messages_from_conversation.getValueAs<long long int>(j, "nummentions");
      bool hasquote = !results_all_messages_from_conversation.isNull(j, "quote");

      if (!outgoing && !incoming)
      {
        std::cout << bepaald::bold_on << "Warning" << bepaald::bold_off << ": Unsupported messagetype '"
                  << results_all_messages_from_conversation.valueAsString(j, "type") << "'. Skipping message." << std::endl;
        continue;
      }

      // get emoji reactions
      std::vector<std::vector<std::string>> reactions;
      SqliteDB::QueryResults results_emoji_reactions;
      std::cout << "  " << numreactions << " reactions." << std::endl;
      for (uint k = 0; k < numreactions; ++k)
      {
        if (!ddb.exec("SELECT "
                      "json_extract(json, '$.reactions[" + bepaald::toString(k) + "].emoji') AS emoji,"
                      //"json_extract(json, '$.reactions[" + bepaald::toString(k) + "].remove') AS remove," // not present in android database
                      //"json_extract(json, '$.reactions[" + bepaald::toString(k) + "].targetAuthorUuid') AS target_author_uuid,"
                      //"json_extract(json, '$.reactions[" + bepaald::toString(k) + "].targetTimestamp') AS target_timestamp," //timestamp of message that reaction belongs to, dont know why this exists
                      "json_extract(json, '$.reactions[" + bepaald::toString(k) + "].timestamp') AS timestamp,"
                      "json_extract(json, '$.reactions[" + bepaald::toString(k) + "].fromId') AS from_id"
                      //"json_extract(json, '$.reactions[" + bepaald::toString(k) + "].source') AS source" // ???
                      " FROM messages WHERE rowid = ?", rowid, &results_emoji_reactions))
        {
          std::cout << "Useful error 42" << std::endl;
          continue;
        }
        std::cout << "  Reaction " << k + 1 << "/" << numreactions << ": " << std::flush;
        results_emoji_reactions.print(false);

        reactions.emplace_back(std::vector{results_emoji_reactions.valueAsString(0, "emoji"),
                                           results_emoji_reactions.valueAsString(0, "timestamp"),
                                           results_emoji_reactions.valueAsString(0, "from_id")});
      }

      // get address (needed in both mms and sms databases)
      // for 1-on-1 messages, address is conversation partner (with uuid 'person_or_group_id')
      // for group messages, incoming: address is person originating the message (sourceUuid)
      //                     outgoing: address is id of group (with group_id 'person_or_group_id')
      long long int address = -1;
      if (isgroupconversation && incoming)
      {
        // incoming group messages have 'address' set to the group member who sent the message
        std::string source_uuid = results_all_messages_from_conversation.valueAsString(j, "sourceUuid");
        if (recipientmap.find(source_uuid) == recipientmap.end())
        {
          address = getRecipientIdFromUuid(source_uuid);
          if (address != -1)
            recipientmap[source_uuid] = address;
        }
        else
          address = recipientmap[source_uuid];
      }
      else
      {
        std::cout << "Trying to get recipient._id for person or group with uuid: " << person_or_group_id << std::endl;
        // address is conversation partner
        if (recipientmap.find(person_or_group_id) == recipientmap.end())
        {
          address = getRecipientIdFromUuid(person_or_group_id);
          if (address != -1)
            recipientmap[person_or_group_id] = address;
        }
        else
          address = recipientmap[person_or_group_id];
      }
      if (address == -1)
      {
        std::cout << bepaald::bold_on << "Warning" << bepaald::bold_off << " failed to get recipient id for message partner. Skipping message." << std::endl;
        continue;
      }


      // insert the collected data in the correct tables
      if (numattachments > 0 || nummentions > 0 || hasquote || (isgroupconversation && outgoing))
      {
        // get quote stuff
        // if message has quote attachments, find the original message (the quote json does not contain all info)
        long long int mmsquote_id = 0;
        long long int mmsquote_author = -1;
        std::any mmsquote_body;
        long long int mmsquote_attachment = -1; // always -1???
        long long int mmsquote_missing = 0;
        std::pair<std::shared_ptr<unsigned char []>, unsigned int> mmsquote_mentions{nullptr, 0};
        long long int mmsquote_type = 0; // 0 == NORMAL, 1 == GIFT_BADGE (src/main/java/org/thoughtcrime/securesms/mms/QuoteModel.java)
        if (hasquote)
        {
          std::cout << "Message has quote!" << std::endl;
          SqliteDB::QueryResults quote_results;
          if (!ddb.exec("SELECT "
                        "json_extract(json, '$.quote.id') AS quote_id,"
                        "json_extract(json, '$.quote.authorUuid') AS quote_author_uuid,"
                        "json_extract(json, '$.quote.text') AS quote_text,"
                        "IFNULL(json_array_length(json, '$.quote.attachments'), 0) AS num_quote_attachments,"
                        "IFNULL(json_array_length(json, '$.quote.bodyRanges'), 0) AS num_quote_bodyranges,"
                        "json_extract(json, '$.quote.type') AS quote_type,"
                        "json_extract(json, '$.quote.referencedMessageNotFound') AS quote_referencedmessagenotfound,"
                        "json_extract(json, '$.quote.isGiftBadge') AS quote_isgiftbadge,"
                        "json_extract(json, '$.quote.isViewOnce') AS quote_isviewonce"
                        " FROM messages WHERE rowid = ?", rowid, &quote_results))
          {
            std::cout << "Quote error msg" << std::endl;
          }

          if (recipientmap.find(quote_results.valueAsString(0, "quote_author_uuid")) != recipientmap.end())
            mmsquote_author = recipientmap[quote_results.valueAsString(0, "quote_author_uuid")];
          else
          {
            mmsquote_author = getRecipientIdFromUuid(quote_results.valueAsString(0, "quote_author_uuid"));
            if (mmsquote_author != -1)
              recipientmap[quote_results.valueAsString(0, "quote_author_uuid")] = mmsquote_author;
          }
          if (mmsquote_author == -1)
          {
            std::cout << "Failed to find quote author. skipping" << std::endl;
            hasquote = false;
          }

          mmsquote_body = quote_results.valueAsString(0, "body"); // check if this can be null (if quote exists, dont think so)
          mmsquote_missing = (quote_results.getValueAs<long long int>(0, "quote_referencedmessagenotfound") == false ? 0 : 1);
          mmsquote_type = (quote_results.getValueAs<long long int>(0, "quote_isgiftbadge") == false ? 0 : 1);
          mmsquote_id = quote_results.getValueAs<long long int>(0, "quote_id"); // this is the messages.json.$timestamp or messages.sent_at. In the android db,
                                                                                // it should be mms.date, but this should be set by this import anyway

          if (quote_results.getValueAs<long long int>(0, "num_quote_bodyranges") > 0)
          {
            // HEX(quote_mentions) = 0A2A080A10011A2439333732323237332D373865332D343133362D383634302D633832363139363937313463
            // PROTOBUF
            // Field #1: 0A String Length = 42, Hex = 2A, UTF8 = " $93722273-7 ..." (total 42 chars)
            // As sub-object :
            // Field #1: 08 Varint Value = 10, Hex = 0A
            // Field #2: 10 Varint Value = 1, Hex = 01
            // Field #3: 1A String Length = 36, Hex = 24, UTF8 = "93722273-78e3-41 ..." (total 36 chars)
            //
            // (actual mention)
            //         _id = 3
            //    thread_id = 39
            //   message_id = 4584
            // recipient_id = 71  (= 93722273-78e3-4136-8640-c8261969714c)
            //  range_start = 10
            // range_length = 1
            //
            // protospec (app/src/main/proto/Database.proto):
            // message BodyRangeList {
            //     message BodyRange {
            //         enum Style {
            //             BOLD   = 0;
            //             ITALIC = 1;
            //         }
            //
            //         message Button {
            //             string label  = 1;
            //             string action = 2;
            //         }
            //
            //         int32 start  = 1;
            //         int32 length = 2;
            //
            //         oneof associatedValue {
            //             string mentionUuid = 3;
            //             Style  style       = 4;
            //             string link        = 5;
            //             Button button      = 6;
            //         }
            //     }
            //     repeated BodyRange ranges = 1;
            // }

            ProtoBufParser<std::vector<ProtoBufParser<protobuffer::optional::INT32, // int32 start
                                                      protobuffer::optional::INT32, // int32 length
                                                      protobuffer::optional::STRING // in place of the oneof?
                                                      >>> bodyrangelist;
            for (uint qbr = 0; qbr < quote_results.getValueAs<long long int>(0, "num_quote_bodyranges"); ++qbr)
            {
              SqliteDB::QueryResults qbrres;
              if (!ddb.exec("SELECT "
                            "json_extract(json, '$.quote.bodyRanges[" + bepaald::toString(qbr) + "].start') AS qbr_start,"
                            "json_extract(json, '$.quote.bodyRanges[" + bepaald::toString(qbr) + "].length') AS qbr_length,"
                            "json_extract(json, '$.quote.bodyRanges[" + bepaald::toString(qbr) + "].mentionUuid') AS qbr_uuid"
                            " FROM messages WHERE rowid = ?", rowid, &qbrres))
              {
                std::cout << "error" << std::endl;
              }
              qbrres.prettyPrint();


              ProtoBufParser<protobuffer::optional::INT32, // int32 start
                             protobuffer::optional::INT32, // int32 length
                             protobuffer::optional::STRING // in place of the oneof?
                             > bodyrange;
              bodyrange.addField<1>(qbrres.getValueAs<long long int>(0, "qbr_start"));
              bodyrange.addField<2>(qbrres.getValueAs<long long int>(0, "qbr_length"));
              bodyrange.addField<3>(qbrres.valueAsString(0, "qbr_uuid"));
              bodyrangelist.addField<1>(bodyrange);
            }
            mmsquote_mentions.first = std::make_shared<unsigned char []>(bodyrangelist.size());
            mmsquote_mentions.second = bodyrangelist.size();
            std::memcpy(mmsquote_mentions.first.get(), bodyrangelist.data(), bodyrangelist.size());
          }

          //"mms.quote_attachment,"// = -1 Always -1??
          // collect attachments from original message (they are doubled in android backup, not in desktop
          if (!mmsquote_missing)
          {
            // find message, get attachments and add...
          }


          quote_results.prettyPrint();
        }

        // insert into mms
        SqliteDB::QueryResults new_message_id;
        if (!d_database.exec("INSERT INTO mms ("
                             //"_id,"// AUTO VALUE
                             "thread_id,"
                             "date,"// =  = 1474184079794
                             "date_received,"// =  = 1474184079855
                             "date_server,"// =  = -1
                             "msg_box,"// =  = 10485783
                             //"read,"// =  = 1
                             "body,"//
                             //"part_count,"// don't know what this is... not number of attachments
                             //"ct_l,"// =  =
                             "address,"// =  = 53
                             //"address_device_id,"// =  =
                             //"exp,"// =  =
                             //"m_type,"// =  = 128
                             //"m_size,"// =  =
                             //"st,"// =  =
                             //"tr_id,"// =  =
                             //"delivery_receipt_count,"// =  = 2
                             //"mismatched_identities,"// =  =
                             //"network_failures,"// =  =
                             //"subscription_id,"// =  = -1
                             //"expires_in,"// =  = 0
                             //"expire_started = 0
                             //"notified,"// =  = 0
                             //"read_receipt_count,"// =  = 0
                             //"quote_id,"//  corresponds to 'messages.date' of quoted message
                             //"quote_author,"// =  =
                             //"quote_body,"// =  =
                             //"quote_attachment,"// =  = -1
                             //"quote_missing,"// =  = 0
                             //"quote_mentions,"// =  =
                             //"shared_contacts,"// =  =
                             //"unidentified,"// =  = 0
                             //"previews,"// =  =
                             //"reveal_duration,"// =  = 0
                             //"reactions,"// =  =
                             //"reactions_unread,"// =  = 0
                             //"reactions_last_seen,"// =  = -1
                             "remote_deleted"// =  = 0
                             //"mentions_self,"// =  = 0
                             //"notified_timestamp,"// =  = 0
                             //"viewed_receipt_count,"// =  = 0
                             //"server_guid,"// =
                             //"receipt_timestamp,"// =  = -1
                             //"ranges,"// =  =
                             //"is_story,"// =  = 0
                             //"parent_story_id,"// =  = 0
                             //"quote_type"// =  = 0
                             ") VALUES (?, ?, ?, ?, ? ,? ,? , ?) "
                             "RETURNING _id", {
                               ttid, // thread_id
                               results_all_messages_from_conversation.getValueAs<long long int>(j, "sent_at"), // date
                               results_all_messages_from_conversation.getValueAs<long long int>(j, "sent_at"), // date_received
                               results_all_messages_from_conversation.getValueAs<long long int>(j, "sent_at"), // date_server
                               Types::SECURE_MESSAGE_BIT | (incoming ? Types::BASE_INBOX_TYPE : Types::BASE_SENT_TYPE), // msg_box
                               results_all_messages_from_conversation.value(j, "body"), // body
                               address, // address
                               hasquote ? mmsquote_id : 0, // quote_id
                               hasquote ? std::any(mmsquote_author) : std::any(nullptr), // quote_author
                               hasquote ? mmsquote_body : nullptr, // quote_body
                               hasquote ? mmsquote_attachment : -1, // quote_attachment
                               hasquote ? mmsquote_missing : 0, // quote_missing
                               hasquote ? std::any(mmsquote_mentions) : std::any(nullptr), // quote_mentions
                               results_all_messages_from_conversation.value(j, "isErased"), // remote_deleted
                               hasquote ? mmsquote_type : 0 // quote_type
                             }, &new_message_id))
        {
          std::cout << "mms error" << std::endl;
        }
        long long int new_mms_id = new_message_id.getValueAs<long long int>(0, "_id");
        std::cout << "Inserted message, new id: " << new_mms_id << std::endl;

        std::cout << "  " << numattachments << " attachments." << std::endl;
        SqliteDB::QueryResults results_attachment_data;
        for (uint k = 0; k < numattachments; ++k)
        {
          std::cout << "  Attachment " << k + 1 << "/" << numattachments << ": " << std::flush;

          if (!ddb.exec("SELECT "
                        "json_extract(json, '$.attachments[" + bepaald::toString(k) + "].contentType') AS content_type,"
                        "json_extract(json, '$.attachments[" + bepaald::toString(k) + "].fileName') AS file_name,"
                        "json_extract(json, '$.attachments[" + bepaald::toString(k) + "].size') AS size,"
                        "IFNULL(json_extract(json, '$.attachments[" + bepaald::toString(k) + "].cdnNumber'), 0) AS cdn_number,"
                        //"json_extract(json, '$.attachments[" + bepaald::toString(k) + "].cdnKey') AS cdn_key,"
                        "IFNULL(json_extract(json, '$.attachments[" + bepaald::toString(k) + "].uploadTimestamp'), 0) AS upload_timestamp,"
                        "json_extract(json, '$.attachments[" + bepaald::toString(k) + "].path') AS path"
                        " FROM messages WHERE rowid = ?", rowid, &results_attachment_data))
          {
            std::cout << "Another useful error" << std::endl;
            continue;
          }

          AttachmentMetadata amd = getAttachmentMetaData(databasedir + "/attachments.noindex/" + results_attachment_data.valueAsString(0, "path"));
          // PROBABLY JUST NOT AN IMAGE
          // if (!amd)
          // {
          //   std::cout << "Failed to get metadata on new attachment: "
          //             << databasedir << "/attachments.noindex/" << results_attachment_data.valueAsString(0, "path") << std::endl;
          // }

          // uploadTimestamp from attachment json can be NULL, dont use it!
          long long int unique_id = 0;
          if (!results_attachment_data.isNull(0, "upload_timestamp"))
            unique_id = results_attachment_data.getValueAs<long long int>(0, "upload_timestamp");
          else
            unique_id = results_all_messages_from_conversation.getValueAs<long long int>(j, "sent_at");

          // attachmentdata.emplace_back(getAttachmentMetaData(configdir + "/attachments.noindex/" + results_attachment_data.valueAsString(0, "path")));
          // if (!results_attachment_data.isNull(0, "file_name"))
          //   attachmentdata.back().filename = results_attachment_data.valueAsString(0, "file_name");
          //insert into part
          SqliteDB::QueryResults new_attachment_id;
          if (!d_database.exec("INSERT INTO part ("
                               //"_id," // = AUTO VALUE
                               "mid," // = 5500
                               //"seq," // = 0
                               "ct," // = image/jpeg
                               //"name," // =
                               //"chset," // =
                               //"cd," // = A1sAd5JPAdm5SxZ9q2Bn/2X7BQw/vJfmaWk1zet2cFgb9D+2xpSRyMjuOcUZP7Lic3AEp38BIxKg/LCLMr2v5w==
                               //"fn," // =
                               //"cid," // =
                               //"cl," // = DlImHS8vRhF5VM5ueDVh
                               //"ctt_s," // =
                               //"ctt_t," // =
                               //"encrypted," // =
                               //"pending_push," // = 0
                               //"_data," // = /data/user/0/org.thoughtcrime.securesms/app_parts/part7685241378172293912.mms
                               "data_size," // = 421
                               "file_name," // =
                               //"thumbnail," // =
                               //"aspect_ratio," // =
                               "unique_id," // = 1630950584787
                               //"digest," // = (binary)
                               //"fast_preflight_id," // =
                               //"voice_note," // = 0
                               //"data_random," // = (binary)
                               //"thumbnail_random," // =
                               "width," // = 16
                               "height," // = 16
                               "quote," // = 0
                               //"caption," // =
                               //"sticker_pack_id," // =
                               //"sticker_pack_key," // =
                               //"sticker_id," // = -1
                               "data_hash," // = Msx++MxFQPNuuCPnsO5Q9H2twoNFPMOKpH521FDVn+U=
                               //"blur_hash," // = LN7nwD_M_M_M_M_M_M_M_M_M_M_M
                               //"transform_properties," // = {"skipTransform":true,"videoTrim":false,"videoTrimStartTimeUs":0,"videoTrimEndTimeUs":0,"sentMediaQuality":0,"videoEdited":false}
                               //"transfer_file," // =
                               //"display_order," // = 0
                               //"upload_timestamp," // = 1630950581728
                               "cdn_number" // = 2
                               //"borderless," // = 0
                               //"sticker_emoji," // =
                               //"video_gif" // = 0
                               ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?) "
                               "RETURNING _id", {
                                 new_mms_id, // mid
                                 results_attachment_data.value(0, "content_type"), // ct
                                 results_attachment_data.value(0, "data_size"), // data_size
                                 results_attachment_data.value(0, "file_name"), // file_name
                                 unique_id, // unique_id
                                 amd.width == -1 ? 0 : amd.width, // width
                                 amd.height == -1 ? 0 : amd.height, // height
                                 0, // quote
                                 amd.hash, // data_hash
                                 results_attachment_data.value(0, "cdn_number") // cdn_number
                               }, &new_attachment_id))
          {
            std::cout << "part error" << std::endl;
          }
          long long int new_part_id = new_attachment_id.getValueAs<long long int>(0, "_id");
          std::cout << "Inserted part, new id: " << new_part_id << std::endl;

          std::unique_ptr<AttachmentFrame> new_attachment_frame;
          if (setFrameFromStrings(&new_attachment_frame, std::vector<std::string>{"ROWID:uint64:" + bepaald::toString(new_part_id),
                                                                                  "ATTACHMENTID:uint64:" + bepaald::toString(unique_id),
                                                                                  "LENGTH:uint32:" + bepaald::toString(amd.filesize)}))
            d_attachments.emplace(std::make_pair(new_part_id, unique_id), new_attachment_frame.release());
          else
            std::cout << "Failed to create AttachmentFrame for data" << std::endl;
        }

        if (isgroupconversation)
        {
          //insert into group_reciepts?
        }

        // insert into reactions
        for (auto const &r : reactions)
        {
          /*
          // android reaction entry
          //           _id = 80
          //    message_id = 66869
          //        is_mms = 0
          //     author_id = 7
          //         emoji = 👍
          //     date_sent = 1662929051259
          // date_received = 1662929052309
          */
          long long int author = -1;
          if (recipientmap.find(r[2]) == recipientmap.end())
          {
            author = getRecipientIdFromUuid(r[2]);
            if (author != -1)
              recipientmap[r[2]] = author;
          }
          author = recipientmap[r[2]];
          if (author == -1)
          {
            std::cout << "warning" << std::endl;
            continue;
          }

          if (!d_database.exec("INSERT INTO reaction ("
                               "message_id, is_mms, author_id, emoji, date_sent, date_received) VALUES (?, ?, ?, ?, ?, ?)",
                               {new_mms_id, 1,      author,    r[0],  r[1],      r[1]}))
          {
            std::cout << "Error message" << std::endl;
          }
          else
            std::cout << "INSERTED REACTION" << std::endl;
        }

        // insert into mentions
        for (uint k = 0; k < nummentions; ++k)
        {
          SqliteDB::QueryResults results_mentions;
          if (!ddb.exec("SELECT "
                        "json_extract(json, '$.bodyRanges[" + bepaald::toString(k) + "].start') AS start,"
                        "json_extract(json, '$.bodyRanges[" + bepaald::toString(k) + "].length') AS length,"
                        "json_extract(json, '$.bodyRanges[" + bepaald::toString(k) + "].mentionUuid') AS mention_uuid"
                        " FROM messages WHERE rowid = ?", rowid, &results_mentions))
          {
            std::cout << "Useful error 42" << std::endl;
            continue;
          }
          std::cout << "  Mention " << k + 1 << "/" << nummentions << ": " << std::endl;

          long long int rec_id = -1;
          if (recipientmap.find(results_mentions.valueAsString(0, "mention_uuid")) == recipientmap.end())
          {
            rec_id = getRecipientIdFromUuid(results_mentions.valueAsString(0, "mention_uuid"));
            if (rec_id != -1)
              recipientmap[results_mentions.valueAsString(0, "mention_uuid")] = rec_id;
          }
          else
            rec_id = recipientmap[results_mentions.valueAsString(0, "mention_uuid")];
          if (rec_id == -1)
          {
            std::cout << bepaald::bold_on << "WARNING" << bepaald::bold_off << " Failed to find recipient for mention. Skipping." << std::endl;
            continue;
          }

          if (!d_database.exec("INSERT INTO mention ("
                               "thread_id, message_id, recipient_id, range_start, range_length) VALUES (?, ?, ?, ?, ?)",
                               {ttid,      new_mms_id, rec_id,       results_mentions.getValueAs<long long int>(0, "start"), results_mentions.getValueAs<long long int>(0, "length")}))
          {
            std::cout << "Yet another informative error or warning" << std::endl;
          }
          else
            std::cout << "Inserted mention" << std::endl;
          // maybe if mentions include self, set mentions_self = 1 on message?
          /*
          // mention entry in android db
          //          _id = 10
          //    thread_id = 43
          //   message_id = 5910
          // recipient_id = 71
          //  range_start = 40
          // range_length = 1
          */
        }

      }
      else
      {
        // insert into sms
        SqliteDB::QueryResults new_message_id;
        if (!d_database.exec("INSERT INTO sms ("
                             //_id // this is an AUTO value
                             "thread_id,"
                             "address,"
                             //"address_device_id,"
                             //"person,"// =
                             "date,"// = 1663067790169
                             "date_sent,"// = 1663067792779
                             "date_server,"// = 1663067790149
                             //"protocol,"// always 31337? maybe not necessary?
                             //"read,"
                             //"status,"
                             "type," // = incoming/outgoing + secure
                             //"reply_path_preseny,"// = 1
                             //"delivery_receipt_count,"// = 0
                             //"subject,"// =
                             "body,"// = Gefeliciteerd Nelleke!
                             //"mismatched_identities,"// =
                             //"service_center,"// = GCM
                             //"subscription_id,"// = -1
                             //"expires_in,"// = 0
                             //"expire_started,"// = 0
                             //"notified,"// = 0
                             //"read_receipt_count,"// = 0
                             //"unidentified,"// = 1
                             //"reactions,"// DOES NOT EXIST IN NEWER DATABASES
                             //"reactions_unread,"// = 0
                             //"reactions_last_seen,"// = 1663078811832
                             "remote_deleted,"// = 0
                             //"notified_timestamp,"// = 1663072365960
                             "server_guid"// = 0bb19070-e1a2-4c52-b637-00e905583bc1
                             //"receipt_timestamp"// = -1 // is -1 default?
                             ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?) "
                             "RETURNING _id", {
                               ttid, // thread_id
                               address, // address
                               results_all_messages_from_conversation.getValueAs<long long int>(j, "sent_at"), // date
                               results_all_messages_from_conversation.getValueAs<long long int>(j, "sent_at"), // date_sent
                               results_all_messages_from_conversation.getValueAs<long long int>(j, "sent_at"), // date_server
                               Types::SECURE_MESSAGE_BIT | (incoming ? Types::BASE_INBOX_TYPE : Types::BASE_SENT_TYPE), // type
                               results_all_messages_from_conversation.value(j, "body"), // body
                               results_all_messages_from_conversation.value(j, "isErased"), // remote_deleted
                               results_all_messages_from_conversation.value(j, "serverGuid")  // server_guid
                             }, &new_message_id))
          {
            std::cout << "sms error" << std::endl;
          }
        long long int new_sms_id = new_message_id.getValueAs<long long int>(0, "_id");
        std::cout << "Inserted message, new id: " << new_sms_id << std::endl;

        // insert into reactions
        for (auto const &r : reactions)
        {
          /*
          // android reaction entry
          //           _id = 80
          //    message_id = 66869
          //        is_mms = 0
          //     author_id = 7
          //         emoji = 👍
          //     date_sent = 1662929051259
          // date_received = 1662929052309
          */
          long long int author = -1;
          if (recipientmap.find(r[2]) == recipientmap.end())
          {
            author = getRecipientIdFromUuid(r[2]);
            if (author != -1)
              recipientmap[r[2]] = author;
          }
          author = recipientmap[r[2]];
          if (author == -1)
          {
            std::cout << "warning" << std::endl;
            continue;
          }

          if (!d_database.exec("INSERT INTO reaction ("
                               "message_id, is_mms, author_id, emoji, date_sent, date_received) VALUES (?, ?, ?, ?, ?, ?)",
                               {new_sms_id, 0,      author,    r[0],  r[1],      r[1]}))
          {
            std::cout << "Error message" << std::endl;
          }
          else
            std::cout << "INSERTED REACTION" << std::endl;
        }

      }

    }

    // get relevant data

    // field    -> eq in android
    // body     -> body
    // type     -> type(sms) / msg_box(mms)
    // sent_at  -> date_sent(sms)??? / date(mms)  - FOR OUTGOING?
    // received_at -> ? (skip?)
    // hasAttachments
    // hasFileAttachments
    // json(contentType) -> part.ct
    // json(fileName) -> part.filename???
    // json(size)
    // path (get data)
    // isStory?
    //

    // insert into thread ttid
  }
  return false;
}

  /*
      EXAMPLE

      DESKTOP DB:
                     rowid = 56
                        id = 845bff95-[...]-4b53efcba27b
                      json = {"timestamp":1643874290360,
                              "attachments":[{"contentType":"application/pdf","fileName":"qrcode.pdf","path":"21/21561db325667446c84702bc2af2cb779aaaeb32c6b3d190d41f86d12e8bf5f0","size":38749,"pending":false,"url":"/home/svandijk/.config/Signal/drafts.noindex/4b/4bb11cd1be7c718ae8ed57dc28f34d57a1032d4ab0595128527466e876ddde9d"}],
                              "type":"outgoing",
                              "body":"qrcode",
                              "conversationId":"d6b93b26-[...]-b949d4de0aba",
                              "preview":[],
                              "sent_at":1643874290360,
                              "received_at":1623335267006,
                              "received_at_ms":1643874290360,
                              "recipients":["93722273-[...]-c8261969714c"],
                              "bodyRanges":[],
                              "sendHQImages":false,
                              "sendStateByConversationId":{"d6b93b26-[...]-b949d4de0aba":{"status":"Delivered","updatedAt":1643874294845},
                                                           "87e8067b-[...]-011b5c5ee23a":{"status":"Sent","updatedAt":1643874291830}},
                              "schemaVersion":10,
                              "hasAttachments":1,
                              "hasFileAttachments":1,
                              "contact":[],
                              "destination":"93722273-[...]-c8261969714c",
                              "id":"845bff95-[...]-4b53efcba27b",
                              "readStatus":0,
                              "expirationStartTimestamp":1643874291546,
                              "unidentifiedDeliveries":["93722273-[...]-c8261969714c"],
                              "errors":[],
                              "synced":true}
                readStatus = 0
                expires_at =
                   sent_at = 1643874290360
             schemaVersion = 10
            conversationId = d6b93b26-[...]-b949d4de0aba
               received_at = 1623335267006
                    source =
    deprecatedSourceDevice =
            hasAttachments = 1
        hasFileAttachments = 1
 hasVisualMediaAttachments = 0
               expireTimer =
  expirationStartTimestamp = 1643874291546
                      type = outgoing
                      body = qrcode
              messageTimer =
         messageTimerStart =
     messageTimerExpiresAt =
                  isErased = 0
                isViewOnce = 0
                sourceUuid =
                serverGuid =
                 expiresAt =
              sourceDevice =
                   storyId =
                   isStory = 0
       isChangeCreatedByUs = 0
      shouldAffectActivity = 1
       shouldAffectPreview = 1
    isUserInitiatedMessage = 1
     isTimerChangeFromSync = 0
         isGroupLeaveEvent = 0
isGroupLeaveEventFromOther = 0


     ANDROID DB:
                        _id = 631
             thread_id = 1
                  date = 1643874290360
         date_received = 1643874294496
           date_server = -1
               msg_box = 10485783
                  read = 1
                  body = qrcode
            part_count = 1
                  ct_l =
               address = 2
     address_device_id =
                   exp =
                m_type = 128
                m_size =
                    st =
                 tr_id =
delivery_receipt_count = 1
 mismatched_identities =
      network_failures =
       subscription_id = -1
            expires_in = 0
        expire_started = 0
              notified = 0
    read_receipt_count = 0
              quote_id = 0
          quote_author =
            quote_body =
      quote_attachment = -1
         quote_missing = 0
        quote_mentions =
       shared_contacts =
          unidentified = 1
              previews =
       reveal_duration = 0
             reactions =
      reactions_unread = 0
   reactions_last_seen = -1
        remote_deleted = 0
         mentions_self = 0
    notified_timestamp = 0
  viewed_receipt_count = 0
           server_guid =
     receipt_timestamp = 1643874295302
                ranges =
              is_story = 0
       parent_story_id = 0
     */
