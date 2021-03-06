#
# Copyright (C) 2018 The MoKee Open Source Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# Inherit from msm8953-common
-include device/smartisan/msm8953-common/BoardConfigCommon.mk

DEVICE_PATH := device/smartisan/odin

# Kernel
TARGET_KERNEL_CONFIG := mokee_odin_defconfig

# HAX: SELinux Permissive - Remove ASAP
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Camera
TARGET_LD_SHIM_LIBS += /system/vendor/lib/hw/camera.msm8953.so|/system/vendor/lib/libshim_camera.so
TARGET_LD_SHIM_LIBS += /system/vendor/lib/libmmcamera_ppeiscore.so|/system/vendor/lib/libshim_camera.so

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Init
TARGET_INIT_VENDOR_LIB := libinit_odin
TARGET_RECOVERY_DEVICE_MODULES := libinit_odin

# MK Hardware
BOARD_HARDWARE_CLASS += $(DEVICE_PATH)/mkhw

# NFC
TARGET_USES_NQ_NFC := true
BOARD_NFC_CHIPSET := pn548
BOARD_NFC_HAL_SUFFIX := $(TARGET_BOARD_PLATFORM)

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Releasetools
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# Security patch level
VENDOR_SECURITY_PATCH := 2018-10-10

# inherit from the proprietary version
-include vendor/smartisan/odin/BoardConfigVendor.mk
