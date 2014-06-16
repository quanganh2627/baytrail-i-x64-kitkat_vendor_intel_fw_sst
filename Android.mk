LOCAL_PATH:= $(call my-dir)

# Audio Firmware
audio_firmware := fw_sst_0f28_ssp0.bin fw_sst_0f28_ssp2.bin

# Boilerplate
define copy-firmware
$(foreach t,$(1), \
  $(eval include $(CLEAR_VARS)) \
  $(eval tw := $(subst :, ,$(strip $(t)))) \
  $(eval LOCAL_MODULE := $(tw)) \
  $(eval LOCAL_MODULE_OWNER := intel) \
  $(eval LOCAL_MODULE_TAGS := optional) \
  $(eval LOCAL_MODULE_CLASS := ETC) \
  $(eval LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/firmware) \
  $(eval LOCAL_SRC_FILES := $(tw)) \
  $(eval include $(BUILD_PREBUILT)) \
)
endef

# Copy Firmware
$(call copy-firmware, $(audio_firmware))

