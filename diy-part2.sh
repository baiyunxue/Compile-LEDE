#!/bin/bash
#=============================================================
# Copyright (c) 2021 baiyunxue
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/baiyunxue/Compile
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (Before Update feeds)
#=============================================================

# 自定义 IP地址
#sed -i 's/192.168.1.1/192.168.10.1/g' openwrt/package/base-files/files/bin/config_generate

# 默认开启 WiFi
#sed -i 's/disabled=1/disabled=0/g' openwrt/package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 自定义 SSID
#sed -i 's/ssid=OpenWrt/ssid=lantian/g' openwrt/package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 自定义app
#git clone https://github.com/baiyunxue/openwrt-app.git package/files
#git clone https://github.com/jerrykuku/node-request.git package/files
svn co https://github.com/linkease/ddnsto-openwrt/trunk/ddnsto package/network/services/ddnsto
svn co https://github.com/linkease/ddnsto-openwrt/trunk/luci-app-ddnsto package/files/luci-app-ddnsto
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-xunlei package/files/luci-app-xunlei
svn co https://github.com/281677160/openwrt-package/trunk/feeds/luci/applications/luci-app-openclash package/files/luci-app-openclash
svn co https://github.com/281677160/openwrt-package/trunk/feeds/luci/applications/luci-app-smartdns package/files/luci-app-smartdns

# 自定义theme
svn co https://github.com/immortalwrt/luci/branches/openwrt-18.06-k5.4/themes/luci-theme-argon-dark-mod package/files/luci-theme-argon-dark-mod
svn co https://github.com/281677160/openwrt-package/trunk/feeds/luci/themes/luci-theme-opentomato package/files/luci-theme-opentomato
