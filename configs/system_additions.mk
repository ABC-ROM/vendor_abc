# Copyright (C) 2016 The Pure Nexus Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# init.d script support
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/aosp/prebuilt/bin/sysinit:system/bin/sysinit

# ABC-specific init file
# Skip if project treble, for those devices use the specific
# init.rc in the device tree
ifneq (true,$(PRODUCT_FULL_TREBLE))
    PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/etc/init.abc.rc:root/init.abc.rc
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/aosp/prebuilt/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/aosp/prebuilt/bin/50-base.sh:system/addon.d/50-base.sh \

# Prebuilt busybox fstrim command
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/bin/fstrim:system/bin/fstrim

# Security Enhanced Linux
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.selinux=1

# Set Pixel blue light theme on Gboard
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.ime.theme_id=5

# Don't compile SystemUITests
EXCLUDE_SYSTEMUI_TESTS := true

# DU Utils Library
PRODUCT_BOOT_JARS += \
   org.dirtyunicorns.utils

# DU Utils Library
PRODUCT_PACKAGES += \
   org.dirtyunicorns.utils

# Packages
PRODUCT_PACKAGES += \
    GBoardDarkTheme \
    SystemUIDarkTheme \
    SettingsDarkTheme \
    SystemDarkTheme

# Overlays
PRODUCT_PACKAGES += \
    AmberAccent \
    BlackAccent \
    BlueAccent \
    BlueGreyAccent \
    BrownAccent \
    CyanAccent \
    DeepOrangeAccent \
    DeepPurpleAccent \
    GreenAccent \
    GreyAccent \
    IndigoAccent \
    LightBlueAccent \
    LightGreenAccent \
    LimeAccent \
    OrangeAccent \
    PinkAccent \
    PurpleAccent \
    RedAccent \
    TealAccent \
    YellowAccent \
    WhiteAccent

# Disable Rescue Party
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.disable_rescue=true

  
# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so
  
# Set custom volume steps
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.config.media_vol_steps=30 \
    ro.config.bt_sco_vol_steps=30

# Bluetooth
PRODUCT_PACKAGES += \
    BluetoothExt

# Optional packages
PRODUCT_PACKAGES += \
    libemoji 

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni

# Extra tools
PRODUCT_PACKAGES += \
    7z \
    awk \
    bash \
    bzip2 \
    curl \
    fsck.ntfs \
    gdbserver \
    htop \
    lib7z \
    libsepol \
    micro_bench \
    mke2fs \
    mkfs.ntfs \
    mount.ntfs \
    oprofiled \
    pigz \
    powertop \
    sqlite3 \
    strace \
    tune2fs \
    unrar \
    unzip \
    vim \
    wget \
    zip

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# exFAT tools
PRODUCT_PACKAGES += \
    fsck.exfat \
    mkfs.exfat

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync

    
$(call inherit-product-if-exists, vendor/aosp/prebuilt/prebuilt.mk)
