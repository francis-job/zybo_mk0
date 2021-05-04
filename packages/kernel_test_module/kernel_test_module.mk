
KERNEL_TEST_MODULE_VERSION = 1.0.0
KERNEL_TEST_MODULE_SITE = $(BR2_EXTERNAL_ZYBO_PATH)/packages/kernel_test_module/src
KERNEL_TEST_MODULE_SITE_METHOD = local



$(eval $(kernel-module))
$(eval $(generic-package))
