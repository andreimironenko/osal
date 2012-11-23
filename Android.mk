LOCAL_PATH:= $(call my-dir)
include $(LOCAL_PATH)/../config/mm_config.mk

# Library suffix name
SUFFIX := bnc

###############################################################################
# OSAL
###############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE := timm_osal
LOCAL_MODULE_SUFFIX         := .a
LOCAL_MODULE_CLASS          := STATIC_LIBRARIES
LOCAL_MODULE_TAGS           := optional
LOCAL_ARM_MODE := arm

LOCAL_SRC_FILES := android_binaries/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)

# Specify variables to be exported to the sub-build
define $(LOCAL_MODULE)_set_config_vars
    $(call timm_set_config_var1,XDCPATH) \
    $(call timm_set_config_var2,XDCBUILDCFG,CONFIG_BLD) \
    $(call timm_set_config_var1,XDCOPTIONS) \
    $(call timm_set_config_var1,TOOLCHAIN_DIR) \
    $(call timm_set_config_var1,TOOLCHAIN_CC) \
    $(call timm_set_config_var2,ANDROID_CFLAGS,CFLAGS) \
    $(call timm_set_config_var2,CROSS_COMPILE,TOOLCHAIN_DIR) \
    $(call timm_set_config_var2,ANDROID_LDFLAGS,LDFLAGS)
endef

# Build against the Android stack
define $(LOCAL_MODULE)_rebuild
$(LOCAL_PATH)/$(LOCAL_SRC_FILES) :
	$(call $(LOCAL_MODULE)_set_config_vars) \
	$(timm_XDC_INSTALL_DIR)/xdc clean -PR $(LOCAL_PATH)/packages/
	$(call $(LOCAL_MODULE)_set_config_vars) \
	$(timm_XDC_INSTALL_DIR)/xdc -PR $(LOCAL_PATH)/packages/
	mkdir -p $$(dir $$@)
	cp -fp $(LOCAL_PATH)/packages/ti/sdo/xdcruntime/linux/lib/release/osal_linux_470.a$(SUFFIX) $$@
endef
$(eval $(call $(LOCAL_MODULE)_rebuild))

include $(BUILD_PREBUILT)

# Cleanup
$(LOCAL_MODULE)_set_config_vars  :=
$(LOCAL_MODULE)_rebuild          :=

