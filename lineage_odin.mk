#
# Copyright (C) 2018-2019 The MoKee Open Source Project
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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_n_mr1.mk)

# Inherit from odin device
$(call inherit-product, device/smartisan/odin/device.mk)

# Inherit some common MK stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_odin
PRODUCT_BRAND := SMARTISAN
PRODUCT_DEVICE := odin
PRODUCT_MANUFACTURER := smartisan

PRODUCT_GMS_CLIENTID_BASE := android-smartisan

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="odin" \
    PRIVATE_BUILD_DESC="odin-user 7.1.1 NMF26F 1 dev-keys"

BUILD_FINGERPRINT := Rock/odin/odin:7.1.1/NMF26F/1547630572:user/dev-keys

# Sign bootable images
PRODUCT_SUPPORTS_BOOT_SIGNER := true
PRODUCT_SUPPORTS_VERITY := true
PRODUCT_VERITY_SIGNING_KEY := build/target/product/security/verity

TARGET_VENDOR := Smartisan
