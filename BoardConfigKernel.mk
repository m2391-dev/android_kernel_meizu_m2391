# SPDX-License-Identifier: Apache-2.0
M2391_KERNEL_PATH := kernel/meizu/m2391
M2391_KERNEL_BLOBS := vendor/meizu/m2391/proprietary

# This repository only supplies UAPI headers and the captured configuration.
# Keep generated_kernel_headers working for Qualcomm recovery dependencies,
# while explicitly selecting the extracted kernel rather than a source build.
TARGET_KERNEL_SOURCE := $(M2391_KERNEL_PATH)
TARGET_KERNEL_CONFIG := m2391_defconfig
TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_KERNEL_VERSION := 5.15
TARGET_PREBUILT_KERNEL := $(M2391_KERNEL_BLOBS)/boot/kernel
TARGET_PREBUILT_KERNEL_HEADERS := $(M2391_KERNEL_PATH)/include/kernel-uapi-headers.tar.gz
BOARD_KERNEL_IMAGE_NAME := Image

BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := video=vfb:640x400,bpp=32,memsize=3072000 \
    qcom_geni_serial.con_enabled=1 nosoftlockup page_poison=1 \
    sysrq_always_enabled bootconfig
BOARD_BOOTCONFIG := androidboot.hardware=qcom androidboot.memcg=1 \
    androidboot.usbcontroller=a600000.dwc3
BOARD_MKBOOTIMG_ARGS += --header_version 4 --kernel_offset 0x00008000 \
    --ramdisk_offset 0x01000000 --tags_offset 0x00000100 --dtb_offset 0x01f00000
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_PREBUILT_DTBIMAGE_DIR := $(M2391_KERNEL_BLOBS)/vendor_boot/dtb
BOARD_PREBUILT_DTBOIMAGE := vendor/meizu/m2391/radio/dtbo.img

# Preserve signed .ko bytes. Native depmod rules generate dependency metadata.
BOARD_DO_NOT_STRIP_VENDOR_MODULES := true
BOARD_DO_NOT_STRIP_VENDOR_RAMDISK_MODULES := true
BOARD_VENDOR_KERNEL_MODULES := $(wildcard $(M2391_KERNEL_BLOBS)/vendor_dlkm/lib/modules/*.ko)
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/configs/modules/modules.load.vendor_dlkm))
BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE := $(DEVICE_PATH)/configs/modules/modules.blocklist.vendor_dlkm
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(wildcard $(M2391_KERNEL_BLOBS)/vendor_boot/lib/modules/*.ko)
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/configs/modules/modules.load.vendor_ramdisk))
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/configs/modules/modules.load.recovery))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_BLOCKLIST_FILE := $(DEVICE_PATH)/configs/modules/modules.blocklist.vendor_ramdisk
