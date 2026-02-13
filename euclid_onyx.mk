#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Euclid stuff.
$(call inherit-product, vendor/euclid/config/common_full_phone.mk)

# Inherit from onyx device
$(call inherit-product, device/xiaomi/onyx/device.mk)

PRODUCT_NAME := euclid_onyx
PRODUCT_DEVICE := onyx
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := POCO
PRODUCT_MODEL := 25053PC47G

PRODUCT_SYSTEM_NAME := onyx_global
PRODUCT_SYSTEM_DEVICE := onyx

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="onyx_global-user 15 AQ3A.250226.002 OS3.0.5.0.WOLMIXM release-keys" \
    BuildFingerprint=POCO/onyx_global/onyx:15/AQ3A.250226.002/OS3.0.5.0.WOLMIXM:user/release-keys \
    DeviceName=$(PRODUCT_SYSTEM_DEVICE) \
    DeviceProduct=$(PRODUCT_SYSTEM_NAME)

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

EUCLID_MAINTAINER := Kaveer
EUCLID_BUILD_TYPE := OFFICIAL
TARGET_ENABLE_BLUR := true

# Gapps
EUCLID_GAPPS := true
TARGET_SUPPORTS_GOOGLE_RECORDER := true
TARGET_INCLUDE_STOCK_ARCORE := true
TARGET_INCLUDE_LIVE_WALLPAPERS := true  

# Extras
TARGET_INCLUDE_PIXEL_LAUNCHER := true
TARGET_PREBUILT_LAWNICONS := true
TARGET_INCLUDE_STOCK_ARCORE := true
TARGET_BUILD_BCR := true (For Basic Call Recorder)
TARGET_BUILD_DOTGALLERY := true (For Including DotGallery)

# UDFPS
EXTRA_UDFPS_ANIMATIONS := true
TARGET_HAS_UDFPS := true

# Misc.
TARGET_SUPPORTS_TOUCHGESTURES := true
TARGET_SUPPORTS_QUICK_TAP := true
EUCLID_DEVICE := POCO_F7
EUCLID_PROCESSOR := Snapdragon_8s_Gen_4