#
# Copyright (C) 2007-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=cntlm
PKG_VERSION:=0.92.3
PKG_RELEASE:=1

PKG_MAINTAINER:=Jakub Skopal <j@kubs.cz>

PKG_LICENSE:=GPLv2
PKG_LICENSE_FILES:=LICENSE

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://tenet.dl.sourceforge.net/project/cntlm/cntlm/cntlm%200.92.3/
PKG_MD5SUM:=48b101fe4d354ff99276d19ab94563d4

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
  Cntlm is an NTLM / NTLMv2 authenticating HTTP/1.1 proxy. It caches auth'd connections for reuse,
  offers TCP/IP tunneling (port forwarding) thru parent proxy and much much more. It's in C,
  very fast and resource-efficient. Go to http://cntlm.sf.net/ 
endef

define Package/cntlm/conffiles
/etc/cntlm.conf
endef

TARGET_CFLAGS += $(FPIC)

define Build/Compile
	+$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		CC="$(TARGET_CC)" \
		install
endef

define Package/cntlm/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/cntlm $(1)/usr/sbin/
	$(INSTALL_CONF) $(PKG_INSTALL_DIR)/etc/cntlm.conf $(1)/etc/
endef

$(eval $(call BuildPackage,cntlm))

