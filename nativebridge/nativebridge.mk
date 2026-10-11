#
# Copyright 2022-2023 BlueStack Systems, Inc.
# All Rights Reserved
#
# THIS IS UNPUBLISHED PROPRIETARY SOURCE CODE OF BLUESTACK SYSTEMS, INC.
# The copyright notice above does not evidence any actual or intended
# publication of such source code.
#

# BS-A16-MAC: the Mac (polar_mac) arm64 guest runs arm code natively - no
# libnb/houdini, no translator props. (TARGET_ARCH is not set during product
# parsing; gate on TARGET_PRODUCT like the other mac guards.)
IS_A16_MAC_GUEST := $(filter android_arm64,$(TARGET_PRODUCT))

# Enable native bridge
ifneq ($(IS_A16_MAC_GUEST),android_arm64)
WITH_NATIVE_BRIDGE := true
endif

# Native Bridge ABI List
# The Android 16 Houdini package and the bundled NDK translation payload are
# both arm64-only. Do not advertise an arm32 translator that is not installed.
NATIVE_BRIDGE_ABI_LIST_32_BIT :=
NATIVE_BRIDGE_ABI_LIST_64_BIT := arm64-v8a

PRODUCT_COPY_FILES := \
    $(LOCAL_PATH)/OEMBlackList:$(TARGET_COPY_OUT_VENDOR)/etc/misc/.OEMBlackList \
    $(LOCAL_PATH)/OEMWhiteList:$(TARGET_COPY_OUT_VENDOR)/etc/misc/.OEMWhiteList \
    $(LOCAL_PATH)/ThirdPartySO:$(TARGET_COPY_OUT_VENDOR)/etc/misc/.ThirdPartySO \

ifneq ($(IS_A16_MAC_GUEST),android_arm64)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.dalvik.vm.isa.arm=x86 \
    ro.enable.native.bridge.exec=1 \

ifeq ($(TARGET_SUPPORTS_64_BIT_APPS),true)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.dalvik.vm.isa.arm64=x86_64 \
    ro.enable.native.bridge.exec64=1 \
    ro.vendor.enable.native.bridge.exec64=1
endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.dalvik.vm.native.bridge=libnb.so \
    persist.sys.nativebridge=1

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.dalvik.vm.native.bridge=libnb.so

# libnb preserves the A13 per-app translator selection and compatibility hooks;
# houdini64 installs the licensed Android 16 translator payload.
PRODUCT_PACKAGES += libnb houdini64
endif

