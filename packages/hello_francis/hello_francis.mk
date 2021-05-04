###############################################################################
#
# hello_francis
#
################################################################################

HELLO_FRANCIS_VERSION = 1.0
HELLO_FRANCIS_SITE = $(BR2_EXTERNAL_ZYBO_PATH)/packages/hello_francis/src
HELLO_FRANCIS_SITE_METHOD = local

define HELLO_FRANCIS_BUILD_CMDS
    $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)
endef

define HELLO_FRANCIS_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/hello_francis $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
