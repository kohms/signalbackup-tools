#!/bin/sh

### This script is auto-generated

NUMCPU=1
CONFIG="default"
EXTRAOPTIONS=""
EXTRALINKOPTIONS=""

while [ $# -gt 0 ] ; do
    if [ "$1" = "--config" ] && [ $# -gt 1 ] ; then
        CONFIG="$2"
        shift
    else
        if [ -z "$EXTRAOPTIONS" ] ; then
            EXTRAOPTIONS="${EXTRAOPTIONS}$1"
        else
            EXTRAOPTIONS="${EXTRAOPTIONS} $1"
        fi
    fi
    shift
done

if [ "$CONFIG" = "default" ] ; then
    COMPILER=$(which g++)
    if [ -z "$COMPILER" ] ; then echo "Failed to find g++ binary" && exit 1 ; fi

    echo "BUILDING (1/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"cryptbase/o/cryptbase.o\" \"cryptbase/cryptbase.cc\""
    if [ ! -d "cryptbase/o" ] ; then mkdir "cryptbase/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "cryptbase/o/cryptbase.o" "cryptbase/cryptbase.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (2/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"cryptbase/o/getbackupkey.o\" \"cryptbase/getbackupkey.cc\""
    if [ ! -d "cryptbase/o" ] ; then mkdir "cryptbase/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "cryptbase/o/getbackupkey.o" "cryptbase/getbackupkey.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (3/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"cryptbase/o/getcipherandmac.o\" \"cryptbase/getcipherandmac.cc\""
    if [ ! -d "cryptbase/o" ] ; then mkdir "cryptbase/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "cryptbase/o/getcipherandmac.o" "cryptbase/getcipherandmac.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (4/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"memfiledb/o/statics.o\" \"memfiledb/statics.cc\""
    if [ ! -d "memfiledb/o" ] ; then mkdir "memfiledb/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "memfiledb/o/statics.o" "memfiledb/statics.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (5/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"endframe/o/statics.o\" \"endframe/statics.cc\""
    if [ ! -d "endframe/o" ] ; then mkdir "endframe/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "endframe/o/statics.o" "endframe/statics.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (6/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"reactionlist/o/setauthor.o\" \"reactionlist/setauthor.cc\""
    if [ ! -d "reactionlist/o" ] ; then mkdir "reactionlist/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "reactionlist/o/setauthor.o" "reactionlist/setauthor.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (7/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"filedecryptor/o/getframebrute.o\" \"filedecryptor/getframebrute.cc\""
    if [ ! -d "filedecryptor/o" ] ; then mkdir "filedecryptor/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "filedecryptor/o/getframebrute.o" "filedecryptor/getframebrute.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (8/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"filedecryptor/o/getframe.o\" \"filedecryptor/getframe.cc\""
    if [ ! -d "filedecryptor/o" ] ; then mkdir "filedecryptor/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "filedecryptor/o/getframe.o" "filedecryptor/getframe.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (9/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"filedecryptor/o/initbackupframe.o\" \"filedecryptor/initbackupframe.cc\""
    if [ ! -d "filedecryptor/o" ] ; then mkdir "filedecryptor/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "filedecryptor/o/initbackupframe.o" "filedecryptor/initbackupframe.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (10/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"filedecryptor/o/customs.o\" \"filedecryptor/customs.cc\""
    if [ ! -d "filedecryptor/o" ] ; then mkdir "filedecryptor/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "filedecryptor/o/customs.o" "filedecryptor/customs.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (11/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"filedecryptor/o/filedecryptor.o\" \"filedecryptor/filedecryptor.cc\""
    if [ ! -d "filedecryptor/o" ] ; then mkdir "filedecryptor/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "filedecryptor/o/filedecryptor.o" "filedecryptor/filedecryptor.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (12/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"csvreader/o/readrow.o\" \"csvreader/readrow.cc\""
    if [ ! -d "csvreader/o" ] ; then mkdir "csvreader/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "csvreader/o/readrow.o" "csvreader/readrow.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (13/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"csvreader/o/read.o\" \"csvreader/read.cc\""
    if [ ! -d "csvreader/o" ] ; then mkdir "csvreader/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "csvreader/o/read.o" "csvreader/read.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (14/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"arg/o/usage.o\" \"arg/usage.cc\""
    if [ ! -d "arg/o" ] ; then mkdir "arg/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "arg/o/usage.o" "arg/usage.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (15/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"arg/o/arg.o\" \"arg/arg.cc\""
    if [ ! -d "arg/o" ] ; then mkdir "arg/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "arg/o/arg.o" "arg/arg.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (16/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"sharedprefframe/o/statics.o\" \"sharedprefframe/statics.cc\""
    if [ ! -d "sharedprefframe/o" ] ; then mkdir "sharedprefframe/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "sharedprefframe/o/statics.o" "sharedprefframe/statics.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (17/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"avatarframe/o/statics.o\" \"avatarframe/statics.cc\""
    if [ ! -d "avatarframe/o" ] ; then mkdir "avatarframe/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "avatarframe/o/statics.o" "avatarframe/statics.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (18/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"attachmentframe/o/statics.o\" \"attachmentframe/statics.cc\""
    if [ ! -d "attachmentframe/o" ] ; then mkdir "attachmentframe/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "attachmentframe/o/statics.o" "attachmentframe/statics.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (19/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"fileencryptor/o/encryptattachment.o\" \"fileencryptor/encryptattachment.cc\""
    if [ ! -d "fileencryptor/o" ] ; then mkdir "fileencryptor/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "fileencryptor/o/encryptattachment.o" "fileencryptor/encryptattachment.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (20/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"fileencryptor/o/init.o\" \"fileencryptor/init.cc\""
    if [ ! -d "fileencryptor/o" ] ; then mkdir "fileencryptor/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "fileencryptor/o/init.o" "fileencryptor/init.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (21/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"fileencryptor/o/encryptframe.o\" \"fileencryptor/encryptframe.cc\""
    if [ ! -d "fileencryptor/o" ] ; then mkdir "fileencryptor/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "fileencryptor/o/encryptframe.o" "fileencryptor/encryptframe.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (22/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"fileencryptor/o/fileencryptor.o\" \"fileencryptor/fileencryptor.cc\""
    if [ ! -d "fileencryptor/o" ] ; then mkdir "fileencryptor/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "fileencryptor/o/fileencryptor.o" "fileencryptor/fileencryptor.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (23/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"sqlstatementframe/o/statics.o\" \"sqlstatementframe/statics.cc\""
    if [ ! -d "sqlstatementframe/o" ] ; then mkdir "sqlstatementframe/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "sqlstatementframe/o/statics.o" "sqlstatementframe/statics.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (24/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"sqlstatementframe/o/buildstatement.o\" \"sqlstatementframe/buildstatement.cc\""
    if [ ! -d "sqlstatementframe/o" ] ; then mkdir "sqlstatementframe/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "sqlstatementframe/o/buildstatement.o" "sqlstatementframe/buildstatement.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (25/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/setcolumnnames.o\" \"signalbackup/setcolumnnames.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/setcolumnnames.o" "signalbackup/setcolumnnames.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (26/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/fillthreadtablefrommessages.o\" \"signalbackup/fillthreadtablefrommessages.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/fillthreadtablefrommessages.o" "signalbackup/fillthreadtablefrommessages.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (27/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/insertrow.o\" \"signalbackup/insertrow.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/insertrow.o" "signalbackup/insertrow.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (28/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/updategv1migrationmessage.o\" \"signalbackup/updategv1migrationmessage.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/updategv1migrationmessage.o" "signalbackup/updategv1migrationmessage.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (29/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/scramble.o\" \"signalbackup/scramble.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/scramble.o" "signalbackup/scramble.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (30/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/getdesktopdir.o\" \"signalbackup/getdesktopdir.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/getdesktopdir.o" "signalbackup/getdesktopdir.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (31/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/writeencryptedframe.o\" \"signalbackup/writeencryptedframe.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/writeencryptedframe.o" "signalbackup/writeencryptedframe.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (32/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/reordermmssmsids.o\" \"signalbackup/reordermmssmsids.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/reordermmssmsids.o" "signalbackup/reordermmssmsids.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (33/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/handlewamessage.o\" \"signalbackup/handlewamessage.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/handlewamessage.o" "signalbackup/handlewamessage.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (34/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/exportcsv.o\" \"signalbackup/exportcsv.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/exportcsv.o" "signalbackup/exportcsv.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (35/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/exporttofile.o\" \"signalbackup/exporttofile.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/exporttofile.o" "signalbackup/exporttofile.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (36/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/importthread.o\" \"signalbackup/importthread.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/importthread.o" "signalbackup/importthread.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (37/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/buildsqlstatementframe.o\" \"signalbackup/buildsqlstatementframe.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/buildsqlstatementframe.o" "signalbackup/buildsqlstatementframe.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (38/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/exportxml.o\" \"signalbackup/exportxml.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/exportxml.o" "signalbackup/exportxml.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (39/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/getdtreactions.o\" \"signalbackup/getdtreactions.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/getdtreactions.o" "signalbackup/getdtreactions.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (40/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/getthreadidfromrecipient.o\" \"signalbackup/getthreadidfromrecipient.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/getthreadidfromrecipient.o" "signalbackup/getthreadidfromrecipient.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (41/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/updaterecipientid.o\" \"signalbackup/updaterecipientid.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/updaterecipientid.o" "signalbackup/updaterecipientid.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (42/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/dumpmedia.o\" \"signalbackup/dumpmedia.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/dumpmedia.o" "signalbackup/dumpmedia.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (43/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/dropbadframes.o\" \"signalbackup/dropbadframes.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/dropbadframes.o" "signalbackup/dropbadframes.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (44/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/checkdbintegrity.o\" \"signalbackup/checkdbintegrity.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/checkdbintegrity.o" "signalbackup/checkdbintegrity.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (45/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/remaprecipients.o\" \"signalbackup/remaprecipients.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/remaprecipients.o" "signalbackup/remaprecipients.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (46/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/sanitizefilename.o\" \"signalbackup/sanitizefilename.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/sanitizefilename.o" "signalbackup/sanitizefilename.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (47/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/handledtcalltypemessage.o\" \"signalbackup/handledtcalltypemessage.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/handledtcalltypemessage.o" "signalbackup/handledtcalltypemessage.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (48/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/exporttodir.o\" \"signalbackup/exporttodir.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/exporttodir.o" "signalbackup/exporttodir.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (49/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/removedoubles.o\" \"signalbackup/removedoubles.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/removedoubles.o" "signalbackup/removedoubles.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (50/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/croptothread.o\" \"signalbackup/croptothread.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/croptothread.o" "signalbackup/croptothread.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (51/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/deleteattachments.o\" \"signalbackup/deleteattachments.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/deleteattachments.o" "signalbackup/deleteattachments.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (52/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/insertattachments.o\" \"signalbackup/insertattachments.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/insertattachments.o" "signalbackup/insertattachments.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (53/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/getminmaxusedid.o\" \"signalbackup/getminmaxusedid.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/getminmaxusedid.o" "signalbackup/getminmaxusedid.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (54/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/statics.o\" \"signalbackup/statics.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/statics.o" "signalbackup/statics.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (55/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/initfromdir.o\" \"signalbackup/initfromdir.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/initfromdir.o" "signalbackup/initfromdir.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (56/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/setfiletimestamp.o\" \"signalbackup/setfiletimestamp.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/setfiletimestamp.o" "signalbackup/setfiletimestamp.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (57/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/croptodates.o\" \"signalbackup/croptodates.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/croptodates.o" "signalbackup/croptodates.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (58/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/makeidsunique.o\" \"signalbackup/makeidsunique.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/makeidsunique.o" "signalbackup/makeidsunique.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (59/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/cleandatabasebymessages.o\" \"signalbackup/cleandatabasebymessages.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/cleandatabasebymessages.o" "signalbackup/cleandatabasebymessages.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (60/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/cleanattachments.o\" \"signalbackup/cleanattachments.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/cleanattachments.o" "signalbackup/cleanattachments.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (61/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/updategroupmembers.o\" \"signalbackup/updategroupmembers.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/updategroupmembers.o" "signalbackup/updategroupmembers.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (62/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/insertreactions.o\" \"signalbackup/insertreactions.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/insertreactions.o" "signalbackup/insertreactions.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (63/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/importwachat.o\" \"signalbackup/importwachat.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/importwachat.o" "signalbackup/importwachat.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (64/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/customs.o\" \"signalbackup/customs.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/customs.o" "signalbackup/customs.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (65/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/escapexmlstring.o\" \"signalbackup/escapexmlstring.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/escapexmlstring.o" "signalbackup/escapexmlstring.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (66/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/summarize.o\" \"signalbackup/summarize.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/summarize.o" "signalbackup/summarize.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (67/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/dumpinfoonbadframe.o\" \"signalbackup/dumpinfoonbadframe.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/dumpinfoonbadframe.o" "signalbackup/dumpinfoonbadframe.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (68/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/getattachmentmetadata.o\" \"signalbackup/getattachmentmetadata.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/getattachmentmetadata.o" "signalbackup/getattachmentmetadata.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (69/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/datetomsecssinceepoch.o\" \"signalbackup/datetomsecssinceepoch.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/datetomsecssinceepoch.o" "signalbackup/datetomsecssinceepoch.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (70/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/mergerecipients.o\" \"signalbackup/mergerecipients.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/mergerecipients.o" "signalbackup/mergerecipients.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (71/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/scanself.o\" \"signalbackup/scanself.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/scanself.o" "signalbackup/scanself.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (72/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/mergegroups.o\" \"signalbackup/mergegroups.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/mergegroups.o" "signalbackup/mergegroups.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (73/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/getrecipientidfromuuid.o\" \"signalbackup/getrecipientidfromuuid.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/getrecipientidfromuuid.o" "signalbackup/getrecipientidfromuuid.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (74/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/addsmsmessage.o\" \"signalbackup/addsmsmessage.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/addsmsmessage.o" "signalbackup/addsmsmessage.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (75/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/getgroupmembers.o\" \"signalbackup/getgroupmembers.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/getgroupmembers.o" "signalbackup/getgroupmembers.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (76/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/getgroupupdaterecipients.o\" \"signalbackup/getgroupupdaterecipients.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/getgroupupdaterecipients.o" "signalbackup/getgroupupdaterecipients.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (77/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/updatethreadsentries.o\" \"signalbackup/updatethreadsentries.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/updatethreadsentries.o" "signalbackup/updatethreadsentries.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (78/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/handledtgroupchangemessage.o\" \"signalbackup/handledtgroupchangemessage.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/handledtgroupchangemessage.o" "signalbackup/handledtgroupchangemessage.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (79/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/compactids.o\" \"signalbackup/compactids.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/compactids.o" "signalbackup/compactids.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (80/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/dumpavatars.o\" \"signalbackup/dumpavatars.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/dumpavatars.o" "signalbackup/dumpavatars.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (81/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/updatereactionauthors.o\" \"signalbackup/updatereactionauthors.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/updatereactionauthors.o" "signalbackup/updatereactionauthors.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (82/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/initfromfile.o\" \"signalbackup/initfromfile.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/initfromfile.o" "signalbackup/initfromfile.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (83/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/missingattachmentexpected.o\" \"signalbackup/missingattachmentexpected.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/missingattachmentexpected.o" "signalbackup/missingattachmentexpected.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (84/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/setminimumid.o\" \"signalbackup/setminimumid.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/setminimumid.o" "signalbackup/setminimumid.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (85/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/importfromdesktop.o\" \"signalbackup/importfromdesktop.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/importfromdesktop.o" "signalbackup/importfromdesktop.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (86/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/importcsv.o\" \"signalbackup/importcsv.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/importcsv.o" "signalbackup/importcsv.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (87/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"signalbackup/o/decodestatusmessage.o\" \"signalbackup/decodestatusmessage.cc\""
    if [ ! -d "signalbackup/o" ] ; then mkdir "signalbackup/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "signalbackup/o/decodestatusmessage.o" "signalbackup/decodestatusmessage.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (88/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"o/main.o\" \"main.cc\""
    if [ ! -d "o" ] ; then mkdir "o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "o/main.o" "main.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (89/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"backupframe/o/init.o\" \"backupframe/init.cc\""
    if [ ! -d "backupframe/o" ] ; then mkdir "backupframe/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "backupframe/o/init.o" "backupframe/init.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (90/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"sqlcipherdecryptor/o/destructor.o\" \"sqlcipherdecryptor/destructor.cc\""
    if [ ! -d "sqlcipherdecryptor/o" ] ; then mkdir "sqlcipherdecryptor/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "sqlcipherdecryptor/o/destructor.o" "sqlcipherdecryptor/destructor.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (91/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"sqlcipherdecryptor/o/getkey.o\" \"sqlcipherdecryptor/getkey.cc\""
    if [ ! -d "sqlcipherdecryptor/o" ] ; then mkdir "sqlcipherdecryptor/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "sqlcipherdecryptor/o/getkey.o" "sqlcipherdecryptor/getkey.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (92/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"sqlcipherdecryptor/o/decryptdata.o\" \"sqlcipherdecryptor/decryptdata.cc\""
    if [ ! -d "sqlcipherdecryptor/o" ] ; then mkdir "sqlcipherdecryptor/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "sqlcipherdecryptor/o/decryptdata.o" "sqlcipherdecryptor/decryptdata.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (93/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"sqlcipherdecryptor/o/gethmackey.o\" \"sqlcipherdecryptor/gethmackey.cc\""
    if [ ! -d "sqlcipherdecryptor/o" ] ; then mkdir "sqlcipherdecryptor/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "sqlcipherdecryptor/o/gethmackey.o" "sqlcipherdecryptor/gethmackey.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (94/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"sqlcipherdecryptor/o/sqlcipherdecryptor.o\" \"sqlcipherdecryptor/sqlcipherdecryptor.cc\""
    if [ ! -d "sqlcipherdecryptor/o" ] ; then mkdir "sqlcipherdecryptor/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "sqlcipherdecryptor/o/sqlcipherdecryptor.o" "sqlcipherdecryptor/sqlcipherdecryptor.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (95/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"basedecryptor/o/getattachment.o\" \"basedecryptor/getattachment.cc\""
    if [ ! -d "basedecryptor/o" ] ; then mkdir "basedecryptor/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "basedecryptor/o/getattachment.o" "basedecryptor/getattachment.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (96/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"keyvalueframe/o/statics.o\" \"keyvalueframe/statics.cc\""
    if [ ! -d "keyvalueframe/o" ] ; then mkdir "keyvalueframe/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "keyvalueframe/o/statics.o" "keyvalueframe/statics.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (97/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"sqlitedb/o/exec.o\" \"sqlitedb/exec.cc\""
    if [ ! -d "sqlitedb/o" ] ; then mkdir "sqlitedb/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "sqlitedb/o/exec.o" "sqlitedb/exec.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (98/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"sqlitedb/o/removecolumn.o\" \"sqlitedb/removecolumn.cc\""
    if [ ! -d "sqlitedb/o" ] ; then mkdir "sqlitedb/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "sqlitedb/o/removecolumn.o" "sqlitedb/removecolumn.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (99/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"sqlitedb/o/copydb.o\" \"sqlitedb/copydb.cc\""
    if [ ! -d "sqlitedb/o" ] ; then mkdir "sqlitedb/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "sqlitedb/o/copydb.o" "sqlitedb/copydb.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (100/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"sqlitedb/o/prettyprint.o\" \"sqlitedb/prettyprint.cc\""
    if [ ! -d "sqlitedb/o" ] ; then mkdir "sqlitedb/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "sqlitedb/o/prettyprint.o" "sqlitedb/prettyprint.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (101/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"sqlitedb/o/valueasstring.o\" \"sqlitedb/valueasstring.cc\""
    if [ ! -d "sqlitedb/o" ] ; then mkdir "sqlitedb/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "sqlitedb/o/valueasstring.o" "sqlitedb/valueasstring.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (102/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"sqlitedb/o/print.o\" \"sqlitedb/print.cc\""
    if [ ! -d "sqlitedb/o" ] ; then mkdir "sqlitedb/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "sqlitedb/o/print.o" "sqlitedb/print.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (103/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"sqlitedb/o/availablewidth.o\" \"sqlitedb/availablewidth.cc\""
    if [ ! -d "sqlitedb/o" ] ; then mkdir "sqlitedb/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "sqlitedb/o/availablewidth.o" "sqlitedb/availablewidth.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (104/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"databaseversionframe/o/statics.o\" \"databaseversionframe/statics.cc\""
    if [ ! -d "databaseversionframe/o" ] ; then mkdir "databaseversionframe/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "databaseversionframe/o/statics.o" "databaseversionframe/statics.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (105/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"headerframe/o/statics.o\" \"headerframe/statics.cc\""
    if [ ! -d "headerframe/o" ] ; then mkdir "headerframe/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "headerframe/o/statics.o" "headerframe/statics.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "BUILDING (106/106): $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o \"stickerframe/o/statics.o\" \"stickerframe/statics.cc\""
    if [ ! -d "stickerframe/o" ] ; then mkdir "stickerframe/o" ; fi
    $COMPILER -c -Wall -Wextra -Wshadow -Wold-style-cast -Woverloaded-virtual -pedantic -std=c++2a -O3 -march=native -flto $EXTRAOPTIONS -o "stickerframe/o/statics.o" "stickerframe/statics.cc"
    if [ $? -ne 0 ] ; then exit 1 ; fi

    echo "LINKING: $COMPILER -Wall -Wextra -Wl,-z,now -Wl,--as-needed -O3 -s -flto=auto \"cryptbase/o/cryptbase.o\" \"cryptbase/o/getbackupkey.o\" \"cryptbase/o/getcipherandmac.o\" \"memfiledb/o/statics.o\" \"endframe/o/statics.o\" \"reactionlist/o/setauthor.o\" \"filedecryptor/o/getframebrute.o\" \"filedecryptor/o/getframe.o\" \"filedecryptor/o/initbackupframe.o\" \"filedecryptor/o/customs.o\" \"filedecryptor/o/filedecryptor.o\" \"csvreader/o/readrow.o\" \"csvreader/o/read.o\" \"arg/o/usage.o\" \"arg/o/arg.o\" \"sharedprefframe/o/statics.o\" \"avatarframe/o/statics.o\" \"attachmentframe/o/statics.o\" \"fileencryptor/o/encryptattachment.o\" \"fileencryptor/o/init.o\" \"fileencryptor/o/encryptframe.o\" \"fileencryptor/o/fileencryptor.o\" \"sqlstatementframe/o/statics.o\" \"sqlstatementframe/o/buildstatement.o\" \"signalbackup/o/setcolumnnames.o\" \"signalbackup/o/fillthreadtablefrommessages.o\" \"signalbackup/o/insertrow.o\" \"signalbackup/o/updategv1migrationmessage.o\" \"signalbackup/o/scramble.o\" \"signalbackup/o/getdesktopdir.o\" \"signalbackup/o/writeencryptedframe.o\" \"signalbackup/o/reordermmssmsids.o\" \"signalbackup/o/handlewamessage.o\" \"signalbackup/o/exportcsv.o\" \"signalbackup/o/exporttofile.o\" \"signalbackup/o/importthread.o\" \"signalbackup/o/buildsqlstatementframe.o\" \"signalbackup/o/exportxml.o\" \"signalbackup/o/getdtreactions.o\" \"signalbackup/o/getthreadidfromrecipient.o\" \"signalbackup/o/updaterecipientid.o\" \"signalbackup/o/dumpmedia.o\" \"signalbackup/o/dropbadframes.o\" \"signalbackup/o/checkdbintegrity.o\" \"signalbackup/o/remaprecipients.o\" \"signalbackup/o/sanitizefilename.o\" \"signalbackup/o/handledtcalltypemessage.o\" \"signalbackup/o/exporttodir.o\" \"signalbackup/o/removedoubles.o\" \"signalbackup/o/croptothread.o\" \"signalbackup/o/deleteattachments.o\" \"signalbackup/o/insertattachments.o\" \"signalbackup/o/getminmaxusedid.o\" \"signalbackup/o/statics.o\" \"signalbackup/o/initfromdir.o\" \"signalbackup/o/setfiletimestamp.o\" \"signalbackup/o/croptodates.o\" \"signalbackup/o/makeidsunique.o\" \"signalbackup/o/cleandatabasebymessages.o\" \"signalbackup/o/cleanattachments.o\" \"signalbackup/o/updategroupmembers.o\" \"signalbackup/o/insertreactions.o\" \"signalbackup/o/importwachat.o\" \"signalbackup/o/customs.o\" \"signalbackup/o/escapexmlstring.o\" \"signalbackup/o/summarize.o\" \"signalbackup/o/dumpinfoonbadframe.o\" \"signalbackup/o/getattachmentmetadata.o\" \"signalbackup/o/datetomsecssinceepoch.o\" \"signalbackup/o/mergerecipients.o\" \"signalbackup/o/scanself.o\" \"signalbackup/o/mergegroups.o\" \"signalbackup/o/getrecipientidfromuuid.o\" \"signalbackup/o/addsmsmessage.o\" \"signalbackup/o/getgroupmembers.o\" \"signalbackup/o/getgroupupdaterecipients.o\" \"signalbackup/o/updatethreadsentries.o\" \"signalbackup/o/handledtgroupchangemessage.o\" \"signalbackup/o/compactids.o\" \"signalbackup/o/dumpavatars.o\" \"signalbackup/o/updatereactionauthors.o\" \"signalbackup/o/initfromfile.o\" \"signalbackup/o/missingattachmentexpected.o\" \"signalbackup/o/setminimumid.o\" \"signalbackup/o/importfromdesktop.o\" \"signalbackup/o/importcsv.o\" \"signalbackup/o/decodestatusmessage.o\" \"o/main.o\" \"backupframe/o/init.o\" \"sqlcipherdecryptor/o/destructor.o\" \"sqlcipherdecryptor/o/getkey.o\" \"sqlcipherdecryptor/o/decryptdata.o\" \"sqlcipherdecryptor/o/gethmackey.o\" \"sqlcipherdecryptor/o/sqlcipherdecryptor.o\" \"basedecryptor/o/getattachment.o\" \"keyvalueframe/o/statics.o\" \"sqlitedb/o/exec.o\" \"sqlitedb/o/removecolumn.o\" \"sqlitedb/o/copydb.o\" \"sqlitedb/o/prettyprint.o\" \"sqlitedb/o/valueasstring.o\" \"sqlitedb/o/print.o\" \"sqlitedb/o/availablewidth.o\" \"databaseversionframe/o/statics.o\" \"headerframe/o/statics.o\" \"stickerframe/o/statics.o\" -lcrypto -lsqlite3 $EXTRALINKOPTIONS -o \"signalbackup-tools\""
    $COMPILER -Wall -Wextra -Wl,-z,now -Wl,--as-needed -O3 -s -flto=auto "cryptbase/o/cryptbase.o" "cryptbase/o/getbackupkey.o" "cryptbase/o/getcipherandmac.o" "memfiledb/o/statics.o" "endframe/o/statics.o" "reactionlist/o/setauthor.o" "filedecryptor/o/getframebrute.o" "filedecryptor/o/getframe.o" "filedecryptor/o/initbackupframe.o" "filedecryptor/o/customs.o" "filedecryptor/o/filedecryptor.o" "csvreader/o/readrow.o" "csvreader/o/read.o" "arg/o/usage.o" "arg/o/arg.o" "sharedprefframe/o/statics.o" "avatarframe/o/statics.o" "attachmentframe/o/statics.o" "fileencryptor/o/encryptattachment.o" "fileencryptor/o/init.o" "fileencryptor/o/encryptframe.o" "fileencryptor/o/fileencryptor.o" "sqlstatementframe/o/statics.o" "sqlstatementframe/o/buildstatement.o" "signalbackup/o/setcolumnnames.o" "signalbackup/o/fillthreadtablefrommessages.o" "signalbackup/o/insertrow.o" "signalbackup/o/updategv1migrationmessage.o" "signalbackup/o/scramble.o" "signalbackup/o/getdesktopdir.o" "signalbackup/o/writeencryptedframe.o" "signalbackup/o/reordermmssmsids.o" "signalbackup/o/handlewamessage.o" "signalbackup/o/exportcsv.o" "signalbackup/o/exporttofile.o" "signalbackup/o/importthread.o" "signalbackup/o/buildsqlstatementframe.o" "signalbackup/o/exportxml.o" "signalbackup/o/getdtreactions.o" "signalbackup/o/getthreadidfromrecipient.o" "signalbackup/o/updaterecipientid.o" "signalbackup/o/dumpmedia.o" "signalbackup/o/dropbadframes.o" "signalbackup/o/checkdbintegrity.o" "signalbackup/o/remaprecipients.o" "signalbackup/o/sanitizefilename.o" "signalbackup/o/handledtcalltypemessage.o" "signalbackup/o/exporttodir.o" "signalbackup/o/removedoubles.o" "signalbackup/o/croptothread.o" "signalbackup/o/deleteattachments.o" "signalbackup/o/insertattachments.o" "signalbackup/o/getminmaxusedid.o" "signalbackup/o/statics.o" "signalbackup/o/initfromdir.o" "signalbackup/o/setfiletimestamp.o" "signalbackup/o/croptodates.o" "signalbackup/o/makeidsunique.o" "signalbackup/o/cleandatabasebymessages.o" "signalbackup/o/cleanattachments.o" "signalbackup/o/updategroupmembers.o" "signalbackup/o/insertreactions.o" "signalbackup/o/importwachat.o" "signalbackup/o/customs.o" "signalbackup/o/escapexmlstring.o" "signalbackup/o/summarize.o" "signalbackup/o/dumpinfoonbadframe.o" "signalbackup/o/getattachmentmetadata.o" "signalbackup/o/datetomsecssinceepoch.o" "signalbackup/o/mergerecipients.o" "signalbackup/o/scanself.o" "signalbackup/o/mergegroups.o" "signalbackup/o/getrecipientidfromuuid.o" "signalbackup/o/addsmsmessage.o" "signalbackup/o/getgroupmembers.o" "signalbackup/o/getgroupupdaterecipients.o" "signalbackup/o/updatethreadsentries.o" "signalbackup/o/handledtgroupchangemessage.o" "signalbackup/o/compactids.o" "signalbackup/o/dumpavatars.o" "signalbackup/o/updatereactionauthors.o" "signalbackup/o/initfromfile.o" "signalbackup/o/missingattachmentexpected.o" "signalbackup/o/setminimumid.o" "signalbackup/o/importfromdesktop.o" "signalbackup/o/importcsv.o" "signalbackup/o/decodestatusmessage.o" "o/main.o" "backupframe/o/init.o" "sqlcipherdecryptor/o/destructor.o" "sqlcipherdecryptor/o/getkey.o" "sqlcipherdecryptor/o/decryptdata.o" "sqlcipherdecryptor/o/gethmackey.o" "sqlcipherdecryptor/o/sqlcipherdecryptor.o" "basedecryptor/o/getattachment.o" "keyvalueframe/o/statics.o" "sqlitedb/o/exec.o" "sqlitedb/o/removecolumn.o" "sqlitedb/o/copydb.o" "sqlitedb/o/prettyprint.o" "sqlitedb/o/valueasstring.o" "sqlitedb/o/print.o" "sqlitedb/o/availablewidth.o" "databaseversionframe/o/statics.o" "headerframe/o/statics.o" "stickerframe/o/statics.o" -lcrypto -lsqlite3 $EXTRALINKOPTIONS -o "signalbackup-tools"
    if [ $? -ne 0 ] ; then exit 1 ; fi
fi

