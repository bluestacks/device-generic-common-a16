# Graphics HAL
PRODUCT_PACKAGES += \
    android.hardware.graphics.mapper@2.0-impl-2.1 \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \

# HWComposer HAL
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.1-service

# Audio HAL
PRODUCT_PACKAGES += \
    android.hardware.audio.service \
    android.hardware.audio@7.0-impl \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.soundtrigger@2.3-impl

# Bluetooth HAL
PRODUCT_PACKAGES += \
    android.hardware.bluetooth-service.default

# Camera HAL
PRODUCT_PACKAGES += \
    camera.device@3.2-impl \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service

# Media codec
PRODUCT_PACKAGES += \
    com.android.media.swcodec \
    android.hardware.media.omx@1.0-service

# DumpState HAL
PRODUCT_PACKAGES += \
    android.hardware.dumpstate-service.example

# Gatekeeper HAL
#PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl

# Health HAL
PRODUCT_PACKAGES += \
    android.hardware.health-service.example

# Keymint HAL
PRODUCT_PACKAGES += \
    android.hardware.security.keymint-service


# Light HAL
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service

# Memtrack HAL
PRODUCT_PACKAGES += \
    com.android.hardware.memtrack

# Power HAL
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-impl \
    android.hardware.power@1.0-service

# RenderScript HAL
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# Sensors HAL
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl

# USB HAL
PRODUCT_PACKAGES += \
    android.hardware.usb-service.example

# Drm HAL
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service \
    android.hardware.drm-service.clearkey \
    android.hardware.drm@1.3-service.widevine

# GPS HAL
PRODUCT_PACKAGES += \
    com.android.hardware.gnss

# ConfigStore HAL
PRODUCT_PACKAGES += \
    android.hardware.configstore@1.1-service
