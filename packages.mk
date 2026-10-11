#
# Copyright (C) 2014 The Android-x86 Open Source Project
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
#

# Common packages for Android-x86 platform.

PRODUCT_PACKAGES := \
    GlobalTime \
    HoloSpiralWallpaper \
    LiveWallpapers \
    LiveWallpapersPicker \
    PinyinIME \
    Provision \
    WallpaperPicker \
    camera.bst \
    lights.bst \
    memtrack.bst \
    power.bst \
    chat \
    com.android.future.usb.accessory \
    drmserver \
    eject \
    gps.default \
    gps.huawei \
    icu.dat \
    io_switch \
    libGLES_android \
    libhuaweigeneric-ril \
    make_ext4fs \
    parted \
    scp \
    sftp \
    ssh \
    sshd \
    su \
    xmllint \
    pagefusion

# BS-A16-MAC: v86d (uvesafb x86 helper) and the legacy hwcomposer.x86 list
# entry are x86-only; the Mac arm64 guest uses the goldfish EmuHWC2 stack
# (hwcomposer.ranchu from goldfish-opengl-mac). TARGET_ARCH is not set during
# product-config parsing - gate on TARGET_PRODUCT instead.
ifneq ($(TARGET_PRODUCT),android_arm64)
PRODUCT_PACKAGES += \
    hwcomposer.x86 \
    v86d
endif

PRODUCT_PACKAGES += \
    libwpa_client \
    liboemcrypto \
    libwvdrmengine \
    hostapd \
    wificond \
    wpa_supplicant \
    wpa_supplicant.conf \

PRODUCT_PACKAGES += \
    badblocks \
    e2fsck \
    fsck.exfat \
    fsck.f2fs \
    mke2fs \
    make_f2fs \
    mkfs.exfat \
    mkntfs \
    mount.exfat \
    ntfs-3g \
    ntfsfix \
    resize2fs \
    tune2fs \

PRODUCT_PACKAGES += \
    btattach \
    hciconfig \
    hcitool \

# Stagefright FFMPEG plugins
# BS-A16-MAC: i965_drv_video is the Intel VA-API ffmpeg plugin (x86-only;
# it has no arm64 module rules, ninja fails with "no known rule").
ifneq ($(TARGET_PRODUCT),android_arm64)
PRODUCT_PACKAGES += i965_drv_video
endif
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

# BS-A16: Use com.uncube.launcher3 as default home app.
# Remove AOSP Launcher3 to avoid HOME activity conflict on first boot.
# PRODUCT_PACKAGES += \
#     Launcher3QuickStep

# Third party apps
PRODUCT_PACKAGES += \
    bstshutdown \
    bstshutdown_core \
    bstime \
    bstsvcmgrtest \
    report_daemon


# Debug tools
PRODUCT_PACKAGES_DEBUG := \
    avdtptest \
    avinfo \
    avtest \
    bneptest \
    btmgmt \
    btmon \
    btproxy \
    haltest \
    l2ping \
    l2test \
    mcaptest \
    rctest \

PRODUCT_HOST_PACKAGES := \
    xmllint \
    badblocks

# Bluestacks Specific Packages
PRODUCT_PACKAGES_DEBUG := \
    com.bluestacks.BstCommandProcessor \
    com.bluestacks.settings \
