# SPDX-License-Identifier: Apache-2.0
M2391_KERNEL_PATH := kernel/meizu/m2391
# The complete boot image is prebuilt. Skip Lineage's kernel-source build tasks;
# otherwise they mistake this prebuilt directory for an OEM source checkout.
TARGET_NO_KERNEL := true
TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_PREBUILT_KERNEL := $(M2391_KERNEL_PATH)/prebuilt/Image
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_PREBUILT_BOOTIMAGE := $(M2391_KERNEL_PATH)/prebuilt/boot.img
BOARD_PREBUILT_INIT_BOOT_IMAGE := $(M2391_KERNEL_PATH)/prebuilt/init_boot.img
BOARD_PREBUILT_VENDOR_BOOTIMAGE := $(M2391_KERNEL_PATH)/prebuilt/vendor_boot.img
BOARD_PREBUILT_DTBOIMAGE := $(M2391_KERNEL_PATH)/prebuilt/dtbo.img

TARGET_PREBUILT_KERNEL_HEADERS := $(M2391_KERNEL_PATH)/include/kernel-uapi-headers.tar.gz
