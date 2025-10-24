#!/bin/bash
set -e
DEVICE=zircon
VENDOR=xiaomi
echo "[*] Création des makefiles pour $DEVICE..."
mkdir -p vendor/$VENDOR/$DEVICE
cat > vendor/$VENDOR/$DEVICE/$DEVICE-vendor.mk << MAKEFILE
PRODUCT_COPY_FILES += \\
    \$(call find-copy-subdir-files,*,\$(LOCAL_PATH)/proprietary,system/vendor)
MAKEFILE
