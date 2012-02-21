LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/fw_sst_082f.bin:system/etc/firmware/fw_sst_082f.bin
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/fw_sst_08e7.bin:system/etc/firmware/fw_sst_08e7.bin
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/aac_dec_1.bin:system/etc/firmware/aac_dec_1.bin
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/aac_enc_1.bin:system/etc/firmware/aac_enc_1.bin
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/aac_v1_dec_1.bin:system/etc/firmware/aac_v1_dec_1.bin
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/aac_v2_dec_1.bin:system/etc/firmware/aac_v2_dec_1.bin
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/mp3_dec_1.bin:system/etc/firmware/mp3_dec_1.bin
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/wma9_dec_1.bin:system/etc/firmware/wma9_dec_1.bin


