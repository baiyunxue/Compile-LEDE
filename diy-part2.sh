#!/bin/bash
#=============================================================
# Copyright (c) 2021 baiyunxue
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/baiyunxue/Compile-LEDE
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (Before Update feeds)
#=============================================================

# Modify default IP ==》自定义 IP地址
#sed -i 's/192.168.1.1/192.168.10.1/g' openwrt/package/base-files/files/bin/config_generate

# Modify hostname
#sed -i 's/ImmortalWrt/rax3000m_256m/g' package/base-files/files/bin/config_generate

# 默认开启 WiFi
#sed -i 's/disabled=1/disabled=0/g' openwrt/package/kernel/mac80211/files/lib/wifi/mac80211.sh

#修改wifi名称（mtwifi-cfg）
#sed -i 's/ImmortalWrt-2.4G/OpenWrt/g' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
#sed -i 's/ImmortalWrt-5G/OpenWrt5G/g' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh

#修改闪存为256M版本(这是针对原厂128闪存来的，但又要编译256M固件来的）
#sed -i 's/<0x580000 0x7200000>/<0x580000 0xee00000>/g' target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7981-cmcc-rax3000m.dts
#sed -i 's/116736k/240128k/g' target/linux/mediatek/image/mt7981.mk

#删除冲突的软件包
rm -rf ./package/istore
rm -rf ./feeds/kenzo/luci-app-quickstart
rm -rf ./feeds/kenzo/luci-app-store
rm -rf ./feeds/kenzo/luci-lib-taskd




# 自定义app
#git clone https://github.com/jerrykuku/node-request.git package/lean/node-request  #京东签到依赖
#rm -rf ../lean/luci-app-jd-dailybonus
#git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/lean/luci-app-jd-dailybonus  #京东签到
#svn co https://github.com/linkease/ddnsto-openwrt/trunk/ddnsto package/network/services/ddnsto  #DDNSTO穿透
#svn co https://github.com/linkease/ddnsto-openwrt/trunk/luci-app-ddnsto package/files/luci-app-ddnsto  #DDNSTO穿透
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-xunlei package/files/luci-app-xunlei  #迅雷下载
#svn co https://github.com/281677160/openwrt-package/trunk/feeds/luci/applications/luci-app-openclash package/files/luci-app-openclash  #openclash出国软件
#svn co https://github.com/281677160/openwrt-package/trunk/feeds/luci/applications/luci-app-smartdns package/files/luci-app-smartdns  #smartdns DNS加速

# 取消bootstrap为默认主题
#sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
#sed -i '/set luci.main.mediaurlbase=\/luci-static\/argonv3/d' feeds/luci/themes/luci-theme-argonv3/root/etc/uci-defaults/30_luci-theme-argonv3

# 自定义theme主题
# Add luci-theme-argon
#rm -rf ../lean/luci-theme-argon
#git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/files/luci-theme-argon
#git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config package/files/luci-app-argon-config

#svn co https://github.com/281677160/openwrt-package/trunk/feeds/luci/themes/luci-theme-opentomcat package/files/luci-theme-opentomcat
#svn co https://github.com/281677160/openwrt-package/trunk/feeds/luci/themes/luci-theme-opentomato package/files/luci-theme-opentomato
#svn co https://github.com/liuran001/openwrt-packages/trunk/packages/luci-theme-opentomcat package/files/luci-theme-opentomcat

# 自定义第三方软件包
#git clone https://github.com/jerrykuku/luci-theme-argon.git package/baiyun/luci-theme-argon
#git clone https://github.com/AlexZhuo/luci-app-bandwidthd.git package/baiyun/luci-app-bandwidthd
#git clone https://github.com/jerrykuku/luci-app-vssr.git package/baiyun/luci-app-vssr
#git clone https://github.com/jerrykuku/lua-maxminddb.git package/baiyun/lua-maxminddb
#git clone https://github.com/kenzok8/openwrt-packages.git package/baiyun/openwrt-packages
#git clone https://github.com/kenzok8/small.git package/baiyun/small
#git clone --depth=1 https://github.com/immortalwrt/packages -b openwrt-18.06 packages
#git clone --depth=1 https://github.com/immortalwrt/luci -b openwrt-18.06 package/immortalwrt
#git clone -b 18.06 https://github.com/kenzok8/openwrt-packages package/kenzok8
#git clone https://github.com/liuran001/openwrt-packages package/liuran001
#git clone https://github.com/kiddin9/openwrt-packages.git package/kiddin9
#git clone https://github.com/sirpdboy/sirpdboy-package.git package/sirpdboy

