#!/bin/bash
set -e
DEVICE=zircon
VENDOR=xiaomi
SRC=${1:-adb}

function extract() {
    local FILE_LIST=$1
    local SRC_DIR=$2
    while read -r FILE; do
        [[ "$FILE" =~ ^#.*$ || -z "$FILE" ]] && continue
        DEST="vendor/$VENDOR/$DEVICE/proprietary/$FILE"
        mkdir -p "$(dirname "$DEST")"
        if [ "$SRC_DIR" == "adb" ]; then
            adb pull "/$FILE" "$DEST"
        else
            cp "$SRC_DIR/$FILE" "$DEST" || echo "[-] Missing: $FILE"
        fi
    done < "$FILE_LIST"
}
extract proprietary-files.txt "$SRC"
