#!/bin/bash
#=================================================
# Copyright (c) 2021 baiyunxue
# Description: DIY script
# Lisence: MIT
# https://github.com/baiyunxue/Compile
#=================================================
#

# 自定义 IP地址
sed -i 's/192.168.1.1/192.168.10.1/g' openwrt/package/base-files/files/bin/config_generate

# 默认开启 WiFi
sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 自定义 SSID
#sed -i 's/ssid=OpenWrt/ssid=lantian/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 删除默认密码
#sed -i "/CYXluq4wUazHjmCDBCqXF/d" package/lean/default-settings/files/zzz-default-settings

# 取消bootstrap为默认主题
#sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
