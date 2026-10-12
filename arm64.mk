#
# Copyright (C) 2026 The BlueStacks Project
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

# This is the arm64 flavour of the generic BlueStacks guest platform
# (Mac / polar_mac line). Mirrors x86.mk; the product identity and the
# BST service packages are set by device/generic/arm64/android_arm64.mk.

# Additional settings used in all AOSP builds
PRODUCT_USE_DYNAMIC_PARTITION_SIZE := true

$(call inherit-product,$(LOCAL_PATH)/device.mk)

# Get a list of languages.
$(call inherit-product,$(SRC_TARGET_DIR)/product/languages_full.mk)

# Get everything else from the parent package
$(call inherit-product,$(SRC_TARGET_DIR)/product/generic.mk)

# Get some sounds
$(call inherit-product-if-exists,frameworks/base/data/sounds/AudioPackage6.mk)
