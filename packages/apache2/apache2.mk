APACHE2_VERSION = 2.4.46
APACHE2_SOURCE  = httpd-$(APACHE2_VERSION).tar.bz2
APACHE2_SITE	= http://archive.apache.org/dist/httpd
APACHE2_LICENSE 	= Apache-2.0
APACHE2_LICENSE_FILES   = LICENSE
APACHE2_CPE_ID_VENDOR   = apache
APACHE2_CPE_ID_PRODUCT  = http_server
APACHE2_AUTORECONF = YES
APACHE_INSTALL_STAGING = YES
APACHE2_DEPENDENCIES = apr apr-util pcre


APACHE2_CONF_ENV= \
        ap_cv_void_ptr_lt_long=no \
        PCRE_CONFIG=$(STAGING_DIR)/usr/bin/pcre-config

ifeq ($(BR2_PACKAGE_APACHE2_MPM_WORKER),y)
APACHE2_MPM = worker
endif

APACHE2_CONF_OPTS = \
		   --sysconfdir=/etc/apache2 \
		   --with-apr=$(STAGING_DIR)/usr \
		   --with-apr-util=$(STAGING_DIR)/usr \
		   --with-pcre=$(STAGING_DIR)/usr/bin/pcre-config \
		   --enable-http \
		   --enable-dbd \
		   --enable-proxy \
		   --enable-mime-magic \
		   --without-suexex-bin \
		   --enable-mods-shared=all \
		   --with-mpm=$(APACHE2_MPM) \
		   --disable-luajit \
		   --disable-xml2enc \
		   --disable-proxy-html\
		   --disable-ssl \
		   --disable-deflate \
		   --disable-http2 \
		   --disable-lua \


define APACHE2_CLEANUP_TARGET 
         $(RM) -rf $(TARGET_DIR)/usr/manual $(TARGET_DIR)/usr/build 
endef 

APACHE2_POST_INSTALL_TARGET_HOOKS += APACHE2_CLEANUP_TARGET 
  
define APACHE2_INSTALL_INIT_SYSV 
         $(INSTALL) -D -m 0755 $(BR2_EXTERNAL_ZYBO_PATH)/packages/apache2/S50apache \ 
                 $(TARGET_DIR)/etc/init.d/S50apache 
endef 
  
#define APACHE2_INSTALL_INIT_SYSTEMD 
#         $(INSTALL) -D -m 0755 $(BR2_EXTERNAL_ZYBO_PATH)/packages/apache2/apache.service \ 
#                 $(TARGET_DIR)/usr/lib/systemd/system/apache.service 
#endef 
  
 $(eval $(autotools-package))


			


