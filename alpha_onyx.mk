#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Alphadroid stuff.
$(call inherit-product, vendor/alpha/config/common_full_phone.mk)

# Inherit from onyx device
$(call inherit-product, device/xiaomi/onyx/device.mk)

PRODUCT_NAME := alpha_onyx
PRODUCT_DEVICE := onyx
PRODUCT_MANUFACTURER := Xiaomi

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BuildFingerprint=POCO/onyx_global/onyx:16/BP2A.250605.031.A3/OS3.0.6.0.WOLMIXM:user/release-keys

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# Boot Animation
TARGET_BOOT_ANIMATION_RES := 1080

# Device config
TARGET_HAS_UDFPS := true
TARGET_ENABLE_BLUR := true
TARGET_EXCLUDES_AUDIOFX := false
TARGET_FACE_UNLOCK_SUPPORTED := true

# TARGET_BUILD_PACKAGE options:
# 1 - vanilla (default)
# 2 - microg
# 3 - gapps
TARGET_BUILD_PACKAGE := 3

# Debugging
TARGET_INCLUDE_MATLOG := true

# Extras
TARGET_INCLUDE_SIMPLE_TUNE := true

# Maintainer
ALPHA_MAINTAINER := "Raphael X Kaveer"

ifeq ($(TARGET_BUILD_PACKAGE),3)
  # (valid only for GAPPS builds)
  TARGET_INCLUDE_GOOGLE_COMMS := true
  TARGET_INCLUDE_PIXEL_LAUNCHER := true
  TARGET_SUPPORTS_QUICK_TAP := true
  TARGET_SUPPORTS_CALL_RECORDING := true
  TARGET_INCLUDE_STOCK_ARCORE := true
  TARGET_INCLUDE_LIVE_WALLPAPERS := true
  TARGET_SUPPORTS_GOOGLE_RECORDER := false
endif