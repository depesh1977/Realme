# Virtual AB
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# API level
PRODUCT_SHIPPING_API_LEVEL := 30

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    dtbo \
    boot \
    system \
    system_ext \
    vendor \
    product

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

#PACKAGES
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service \
    libhealthd.$(PRODUCT_PLATFORM)

PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl \
    android.hardware.boot@1.1-impl.recovery \
    android.hardware.boot@1.1-service

PRODUCT_PACKAGES += \
    bootctrl.$(PRODUCT_PLATFORM) \
    bootctrl.$(PRODUCT_PLATFORM).recovery

PRODUCT_PACKAGES += \
otapreopt_script \
cppreopts.sh \
update_engine \
update_verifier \
update_engine_sideload

PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
	fastbootd
