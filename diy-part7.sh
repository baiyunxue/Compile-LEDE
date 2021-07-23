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
sed -i 's/192.168.1.1/192.168.10.1/g' openwrt/package/base-files/files/bin/config_generate

# 默认开启 WiFi
sed -i 's/disabled=1/disabled=0/g' openwrt/package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 自定义 SSID
#sed -i 's/ssid=OpenWrt/ssid=lantian/g' openwrt/package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 删除默认密码
#sed -i "/CYXluq4wUazHjmCDBCqXF/d" openwrt/package/lean/default-settings/files/zzz-default-settings

# 取消bootstrap为默认主题
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

# Add luci-app-ssr-plus
pushd package/lean
git clone --depth=1 https://github.com/fw876/helloworld
popd

# Clone community packages to package/community
mkdir package/community
pushd package/community

# Add Lienol's Packages
git clone --depth=1 https://github.com/Lienol/openwrt-package
rm -rf ../lean/luci-app-kodexplorer

# Add luci-app-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall

# Add luci-app-vssr <M>
git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb.git
git clone --depth=1 https://github.com/jerrykuku/luci-app-vssr

# Add luci-proto-minieap
git clone --depth=1 https://github.com/ysc3839/luci-proto-minieap

# Add ServerChan
git clone --depth=1 https://github.com/tty228/luci-app-serverchan

# Add OpenClash
git clone --depth=1 -b master https://github.com/vernesong/OpenClash

# Add luci-app-onliner
git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner

# Add luci-app-diskman
git clone --depth=1 https://github.com/SuLingGG/luci-app-diskman
mkdir parted
cp luci-app-diskman/Parted.Makefile parted/Makefile

# Add luci-app-dockerman
rm -rf ../lean/luci-app-docker
git clone --depth=1 https://github.com/lisaac/luci-app-dockerman
git clone --depth=1 https://github.com/lisaac/luci-lib-docker

# Add luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config
rm -rf ../lean/luci-theme-argon

# Add subconverter
git clone --depth=1 https://github.com/tindy2013/openwrt-subconverter


# Add immortalwrt's Packages
git clone --depth=1 -b openwrt-18.06 https://github.com/immortalwrt/packages
git clone --depth=1 -b openwrt-18.06-k5.4 https://github.com/immortalwrt/luci
cp -r ../luci/applications/luci-app-adguardhome ../package/lean//luci-app-adguardhome

# Add luci-app-ddnsto
svn co https://github.com/baiyunxue/ZDY/trunk/ddnsto/luci/luci-app-ddnsto package/lean/luci-app-ddnsto
#svn co https://github.com/baiyunxue/ZDY/trunk/ddnsto/luci/luci-app-ddnsto package/lean/luci-app-linkease
svn co https://github.com/baiyunxue/ZDY/trunk/ddnsto/network/services/ddnsto package/network/services/ddnsto
#svn co https://github.com/baiyunxue/ZDY/trunk/ddnsto/network/services/ddnsto package/network/services/linkease

# Add apk (Apk Packages Manager)
svn co https://github.com/openwrt/packages/trunk/utils/apk
popd

# Mod zzz-default-settings
pushd package/lean/default-settings/files
sed -i '/http/d' zzz-default-settings
export orig_version="$(cat "zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')"
sed -i "s/${orig_version}/${orig_version} ($(date +"%Y-%m-%d"))/g" zzz-default-settings
popd

# Use Lienol's https-dns-proxy package
pushd feeds/packages/net
rm -rf https-dns-proxy
svn co https://github.com/Lienol/openwrt-packages/trunk/net/https-dns-proxy
popd

# Use snapshots' syncthing package
pushd feeds/packages/utils
rm -rf syncthing
svn co https://github.com/openwrt/packages/trunk/utils/syncthing
popd

# Fix mt76 wireless driver
pushd package/kernel/mt76
sed -i '/mt7662u_rom_patch.bin/a\\techo mt76-usb disable_usb_sg=1 > $\(1\)\/etc\/modules.d\/mt76-usb' Makefile
popd

# Change default shell to zsh
sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd

# Add luci-app-diskman
git clone --depth=1 https://github.com/SuLingGG/luci-app-diskman
mkdir parted
cp luci-app-diskman/Parted.Makefile parted/Makefile

# Add luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config
rm -rf ../lean/luci-theme-argon
