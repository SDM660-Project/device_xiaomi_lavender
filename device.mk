#
# Copyright (C) 2018-2019 The LineageOS Project
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
#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# Inherit from sdm660-common
$(call inherit-product, device/xiaomi/sdm660-common/sdm660.mk)

DEVICE_PATH := device/xiaomi/lavender

# Hardware
PRODUCT_BOARD_PLATFORM := sdm660
PRODUCT_USES_QCOM_HARDWARE := true

# HALS
SRC_AUDIO_HAL_DIR := hardware/qcom-caf/sdm660/audio
SRC_DISPLAY_HAL_DIR := hardware/qcom-caf/sdm660/display
SRC_MEDIA_HAL_DIR := hardware/qcom-caf/sdm660/media

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/qcom-caf/sdm660

# Properties ($PATH.prop)
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(DEVICE_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(DEVICE_PATH)/audio/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
    $(DEVICE_PATH)/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml

# Camera
PRODUCT_PACKAGES += \
    libstdc++.vendor

# FM
BOARD_HAVE_QCOM_FM := true

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay \
    $(DEVICE_PATH)/overlay-lineage

PRODUCT_PACKAGES += \
    NoCutoutOverlay

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.device.rc

# Shims
PRODUCT_PACKAGES += \
    libcamera_sdm660_shim

# Thermal
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/thermal/thermal-engine.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine.conf \
    $(DEVICE_PATH)/configs/thermal/thermal-engine-map.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine-map.conf \
    $(DEVICE_PATH)/configs/thermal/thermal-engine-normal.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine-normal.conf \
    $(DEVICE_PATH)/configs/thermal/thermal-engine-video.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine-video.conf

# Power Hint
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic

# Wifi
PRODUCT_PACKAGES += \
    LavenderWifiOverlay

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/lavender/lavender-vendor.mk)
