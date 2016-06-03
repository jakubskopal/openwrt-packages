#
# Copyright (C) 2007-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=cntlm
PKG_VERSION:=0.92.3
PKG_RELEASE:=10

PKG_MAINTAINER:=Jakub Skopal <j@kubs.cz>

PKG_LICENSE:=GPLv2
PKG_LICENSE_FILES:=LICENSE

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/jakubskopal/cntlm.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=93e41aa1efb35d39c643240ba5b111818ad9b30c
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz

PKG_FIXUP:=autoreconf
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/cntlm
  TITLE:=cntlm
  SECTION:=net
  CATEGORY:=Network
  URL:=http://cntlm.sourceforge.net/
  DEPENDS+= +libpthread
endef

define Package/cntlm/description
	Cntlm is an NTLM / NTLMv2 authenticating HTTP/1.1 proxy.
endef

define Package/cntlm/conffiles
/etc/config/cntlm
endef

TARGET_CFLAGS += $(FPIC)

define Build/Compile
	+$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		CC="$(TARGET_CC)" \
		install
endef

define Package/cntlm/install
	$(INSTALL_DIR) $(1)/usr/sbin \
		$(1)/etc/init.d \
		$(1)/etc/config
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/cntlm $(1)/usr/sbin/
	$(INSTALL_BIN) files/cntlm.init $(1)/etc/init.d/cntlm
	$(INSTALL_CONF) files/cntlm.config $(1)/etc/config/cntlm
endef

$(eval $(call BuildPackage,cntlm))

