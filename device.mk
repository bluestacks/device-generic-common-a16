#
# Copyright (C) 2014-2016 The Android-x86 Open Source Project
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

PRODUCT_DIR := $(dir $(lastword $(filter-out device/common/%,$(filter device/%,$(ALL_PRODUCTS)))))

PRODUCT_PROPERTY_OVERRIDES := \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    keyguard.no_require_sim=true \
    ro.com.android.dataroaming=true \
    media.sf.hwaccel=1 \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin= \
    debug.stagefright.omx_default_rank.sw-audio=1 \
    debug.stagefright.omx_default_rank=0 \
    ro.lmk.kill_timeout_ms=100

PRODUCT_DEFAULT_PROPERTY_OVERRIDES := \
    persist.rtc_local_time=1 \
    ro.logd.size=1M \
    logd.logpersistd=logcatd \
    logd.logpersistd.size=30 \

PRODUCT_COPY_FILES := \
    $(if $(wildcard $(PRODUCT_DIR)init.rc),$(PRODUCT_DIR)init.rc:root/init.rc) \
    $(if $(wildcard $(PRODUCT_DIR)init.sh),$(PRODUCT_DIR),$(LOCAL_PATH)/)init.sh:system/etc/init.sh \
    $(if $(wildcard $(PRODUCT_DIR)modules.blocklist),$(PRODUCT_DIR),$(LOCAL_PATH)/)modules.blocklist:system/etc/modules.blocklist \
    $(if $(wildcard $(PRODUCT_DIR)fstab.$(TARGET_PRODUCT)),$(PRODUCT_DIR)fstab.$(TARGET_PRODUCT),$(LOCAL_PATH)/fstab.x86):root/fstab.baklava \
    $(if $(wildcard $(PRODUCT_DIR)wpa_supplicant.conf),$(PRODUCT_DIR),$(LOCAL_PATH)/)wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant.conf \
    $(if $(wildcard $(PRODUCT_DIR)wpa_supplicant_overlay.conf),$(PRODUCT_DIR),$(LOCAL_PATH)/)wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(if $(wildcard $(PRODUCT_DIR)excluded-input-devices.xml),$(PRODUCT_DIR),$(LOCAL_PATH)/)excluded-input-devices.xml:system/etc/excluded-input-devices.xml \
    $(if $(wildcard $(PRODUCT_DIR)init.$(TARGET_PRODUCT).rc),$(PRODUCT_DIR)init.$(TARGET_PRODUCT).rc,$(LOCAL_PATH)/init.x86.rc):root/init.baklava.rc \
    $(if $(wildcard $(PRODUCT_DIR)ueventd.$(TARGET_PRODUCT).rc),$(PRODUCT_DIR)ueventd.$(TARGET_PRODUCT).rc,$(LOCAL_PATH)/ueventd.x86.rc):root/ueventd.baklava.rc \
    $(call find-copy-subdir-files,*,device/generic/common/libndk_baklava64/lib64/arm64,$(TARGET_COPY_OUT_SYSTEM)/lib64/arm64_ndk) \
    $(call find-copy-subdir-files,libndk_translation*,device/generic/common/libndk_baklava64/lib64,$(TARGET_COPY_OUT_SYSTEM)/lib64) \
    $(call find-copy-subdir-files,libberberis_exec_region.so,device/generic/common/libndk_baklava64/lib64,$(TARGET_COPY_OUT_SYSTEM)/lib64) \
    $(call find-copy-subdir-files,*,device/generic/common/libndk_baklava64/etc,$(TARGET_COPY_OUT_SYSTEM)/etc) \
    $(call find-copy-subdir-files,*,device/generic/common/libndk_baklava64/bin/arm64,$(TARGET_COPY_OUT_SYSTEM)/bin/arm64)


# Case 8783, Removing this feature from default feature set, if this is present, sound is broken in com.tencent.tmgp.dragonnest
# this feature is not present in any of the actual feature files that we ship, so removing this
# frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml
# BS-A16: restore the hardware/software feature declarations the A13 build
# ships (the A16 port trimmed them). Finsky computes Play device
# compatibility from this list; without touchscreen/portrait/telephony/
# sensors every app shows as incompatible on the store.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ppp/ip-up:system/etc/ppp/ip-up \
    $(LOCAL_PATH)/ppp/ip-down:system/etc/ppp/ip-down \
    $(LOCAL_PATH)/ppp/peers/gprs:system/etc/ppp/peers/gprs \
    $(LOCAL_PATH)/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/google.xml:system/etc/sysconfig/google.xml \
    $(LOCAL_PATH)/busybox:system/xbin/busybox \
    device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml \
    device/sample/etc/old-apns-conf.xml:system/etc/old-apns-conf.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2.xml:system/etc/media_codecs_google_c2.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_audio.xml:system/etc/media_codecs_google_c2_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_video.xml:system/etc/media_codecs_google_c2_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:system/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:system/etc/permissions/android.hardware.vulkan.compute.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:system/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.calling.xml:system/etc/permissions/android.hardware.telephony.calling.xml \
    frameworks/native/data/etc/android.hardware.telephony.data.xml:system/etc/permissions/android.hardware.telephony.data.xml \
    frameworks/native/data/etc/android.hardware.telephony.messaging.xml:system/etc/permissions/android.hardware.telephony.messaging.xml \
    frameworks/native/data/etc/android.hardware.telephony.radio.access.xml:system/etc/permissions/android.hardware.telephony.radio.access.xml \
    frameworks/native/data/etc/android.hardware.telephony.subscription.xml:system/etc/permissions/android.hardware.telephony.subscription.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.print.xml:system/etc/permissions/android.software.print.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/android.software.connectionservice.xml:system/etc/permissions/android.software.connectionservice.xml \
    frameworks/native/data/etc/android.software.activities_on_secondary_displays.xml:system/etc/permissions/android.software.activities_on_secondary_displays.xml \
    frameworks/native/data/etc/android.software.device_admin.xml:system/etc/permissions/android.software.device_admin.xml \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:system/etc/permissions/android.software.freeform_window_management.xml \
    frameworks/native/data/etc/android.software.picture_in_picture.xml:system/etc/permissions/android.software.picture_in_picture.xml \
    $(LOCAL_PATH)/permissions/android.hardware.telephony.xml:system/etc/permissions/android.hardware.telephony.xml \
    $(foreach f,$(wildcard $(LOCAL_PATH)/alsa/*),$(f):$(subst $(LOCAL_PATH),system/etc,$(f))) \
    $(foreach f,$(wildcard $(LOCAL_PATH)/idc/*.idc $(LOCAL_PATH)/keylayout/*.kl),$(f):$(subst $(LOCAL_PATH),system/usr,$(f))) \
    $(foreach f,$(wildcard $(LOCAL_PATH)/bst_etc/*),$(f):$(subst $(LOCAL_PATH)/bst_etc,system/etc,$(f))) \
	$(foreach f,$(wildcard $(LOCAL_PATH)/bst_bins/*),$(f):$(subst $(LOCAL_PATH)/bst_bins,system/bin,$(f)))

PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.fuse.passthrough.enable=true

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_ENFORCE_VINTF_MANIFEST := false
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false
PRODUCT_CHARACTERISTICS := tablet

PRODUCT_AAPT_CONFIG := normal large xlarge mdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay


# Get emulated storage settings
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Get Android 8.0 HIDL HALs
$(call inherit-product-if-exists,$(LOCAL_PATH)/treble.mk)

# Get the firmwares
$(call inherit-product-if-exists,device/generic/firmware/firmware.mk)

# Get the touchscreen calibration tool
$(call inherit-product-if-exists,external/tslib/tslib.mk)

# Get the alsa files
$(call inherit-product-if-exists,hardware/bst/audio/alsa.mk)
# BS-A16: run the vendor audio HAL service 64-bit (like camera provider);
# audio.primary.bst is a vendor module, 64-bit only
$(call soong_config_set, android_hardware_audio, run_64bit, true)

# Get GPS configuration
#$(call inherit-product-if-exists,device/common/gps/gps_as.mk)

# Get the hardware acceleration libraries
$(call inherit-product-if-exists,$(LOCAL_PATH)/gpu/gpu_mesa.mk)

# Get the sensors hals
$(call inherit-product-if-exists,hardware/bst/sensors/sensors.mk)

# Get tablet dalvik parameters
$(call inherit-product,frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

# Get GMS
GAPPS_VARIANT ?= pico
$(call inherit-product-if-exists,$(if $(wildcard vendor/google/products/gms.mk),vendor/google/products/gms.mk,vendor/opengapps/build/opengapps-packages.mk))

# BST: ship apexes uncompressed so apexd does not decompress ~200MB to
# /data on first boot (saves ~3.3s warm, ~15s after a cold host page cache).
# Image grows ~55MB. The initrd loop-mounts of com.android.runtime/i18n
# already expect uncompressed .apex files, so nothing else changes.
PRODUCT_COMPRESSED_APEX := false

# Get native bridge settings
$(call inherit-product-if-exists,$(LOCAL_PATH)/nativebridge/nativebridge.mk)

$(call inherit-product,$(if $(wildcard $(PRODUCT_DIR)packages.mk),$(PRODUCT_DIR),$(LOCAL_PATH)/)packages.mk)

# A16 first-boot blackscreen: 'quicken' is an obsolete alias for 'verify' in
# ART16, so the soong default produced verify-only odex for every prebuilt app
# and the whole system JIT'd on first boot (minutes of black screen on slow
# machines). Compile prebuilt apps with real AOT code instead.
PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := speed

# SystemUI java optimization: unset = conditions_default = no R8 shrink, which
# balloons the dex (140MB concatenated container, 167MB apk, 214MB odex) and
# first-boot cold-IO dominates SystemUI startup (28s first vs 8s second boot).
SOONG_CONFIG_ANDROID_SYSTEMUI_OPTIMIZE_JAVA := true
