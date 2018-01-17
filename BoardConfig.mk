#
# Copyright (C) 2014 The CyanogenMod Project
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

# Include path
TARGET_SPECIFIC_HEADER_PATH := device/nubia/nx505j/include
PRODUCT_COPY_FILES := $(filter-out frameworks/base/data/keyboards/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
	frameworks/base/data/keyboards/Generic.kl:system/usr/keylayout/Generic.kl \
	frameworks/base/data/keyboards/Generic.kcm:system/usr/keychars/Generic.kcm, $(PRODUCT_COPY_FILES))

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8974
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
BOARD_VENDOR := zte-qcom

# Platform
TARGET_BOARD_PLATFORM := msm8974
TARGET_BOARD_PLATFORM_GPU := qcom-adreno330

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := krait

# Kernel
TARGET_KERNEL_CONFIG := lineage_nx505j_defconfig
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3
BOARD_CUSTOM_BOOTIMG_MK := device/nubia/nx505j/mkbootimg.mk
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01E00000
TARGET_KERNEL_SOURCE := kernel/nubia/nx505j
TARGET_ZTEMT_DTS := true

# Flags
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_BSP
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

# QCOM hardware
TARGET_POWERHAL_VARIANT := qcom
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := true
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
TARGET_QCOM_AUDIO_VARIANT := caf
TARGET_QCOM_DISPLAY_VARIANT := caf-new
TARGET_QCOM_MEDIA_VARIANT := caf-new

# Audio
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_DISABLED_DS1_DOLBY_DDP := true

# FM
QCOM_FM_ENABLED := true
AUDIO_FEATURE_ENABLED_FM := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/nubia/nx505j/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true

# NFC
BOARD_NFC_HAL_SUFFIX := qcom

# Charger
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BOARD_CHARGER_RES := device/nubia/nx505j/charger/images

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_PROVIDES_CAMERA_HAL := true

# CM Hardware
BOARD_HARDWARE_CLASS := device/nubia/nx505j/cmhw/

# SELinux
BOARD_SEPOLICY_DIRS += \
   device/nubia/nx505j/sepolicy

# The list below is order dependent
BOARD_SEPOLICY_UNION += \
    file.te \
    device.te \
    app.te \
    cne.te \
    qmux.te \
    mpdecision.te \
    thermald.te \
    ueventd.te \
    vold.te \
    file_contexts \
    genfs_contexts \
    te_macros

PRODUCT_BOOT_JARS := $(subst $(space),:,$(PRODUCT_BOOT_JARS))

# Graphics
BOARD_EGL_CFG := device/nubia/nx505j/configs/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
HAVE_ADRENO_SOURCE:= false
VSYNC_EVENT_PHASE_OFFSET_NS := 7500000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_HAS_QCOM_WLAN_SDK          := true
BOARD_WLAN_DEVICE                := qcwcn
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_qcwcn
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
TARGET_USES_WCNSS_CTRL           := true
TARGET_USES_QCOM_WCNSS_QMI       := true
TARGET_USES_WCNSS_MAC_ADDR_REV   := true
TARGET_WCNSS_MAC_PREFIX          := e8bba8

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 25165824
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12738083840
BOARD_FLASH_BLOCK_SIZE := 131072

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
TARGET_RECOVERY_FSTAB := device/nubia/nx505j/rootdir/etc/fstab.qcom
TARGET_USERIMAGES_USE_EXT4 := true
RECOVERY_VARIANT := cm

# QCOM Power
TARGET_POWERHAL_VARIANT := qcom

# Workaround for factory issue
BOARD_VOLD_CRYPTFS_MIGRATE := true

# No old RPC for prop
TARGET_NO_RPC := true

# GPS HAL lives here
TARGET_GPS_HAL_PATH := device/nubia/nx505j/gps
TARGET_PROVIDES_GPS_LOC_API := true

# Use HW crypto for ODE
TARGET_HW_DISK_ENCRYPTION := true

# Enable CNE
BOARD_USES_QCNE := true

# Added to indicate that protobuf-c is supported in this build
PROTOBUF_SUPPORTED := true

# Enable CPU boosting events in the power HAL
TARGET_USES_CPU_BOOST_HINT := true

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/nubia/nx505j

# inherit from the proprietary version
-include vendor/nubia/nx505j/BoardConfigVendor.mk
