#
# Copyright 2022-2023 BlueStack Systems, Inc.
# All Rights Reserved
#
# THIS IS UNPUBLISHED PROPRIETARY SOURCE CODE OF BLUESTACK SYSTEMS, INC.
# The copyright notice above does not evidence any actual or intended
# publication of such source code.
#

LOCAL_PATH := $(my-dir)

# BS-A16: the native bridge glue is x86-only (arm64 guests run arm apps
# natively and libnb.cpp uses x86 cpuid/asm).
ifneq ($(filter x86 x86_64,$(TARGET_ARCH)),)

include $(CLEAR_VARS)

LOCAL_MODULE := libnb
LOCAL_SRC_FILES := libnb.cpp
LOCAL_CFLAGS := -Werror -Wall -Wno-unused-function -Wold-style-cast
LOCAL_CPPFLAGS := -std=gnu++17
LOCAL_STRIP_MODULE := true
LOCAL_SHARED_LIBRARIES := liblog
LOCAL_C_INCLUDES := \
	art/libnativebridge/include/nativebridge \
	libnativehelper/include_jni

LOCAL_MULTILIB := both

include $(BUILD_SHARED_LIBRARY)

endif  # x86-only native bridge
