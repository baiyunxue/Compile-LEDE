#!/bin/bash
#===============================================================
# Copyright (c) 2021 baiyunxue
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/baiyunxue/Compile
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#================================================================

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
sed -i '$a src-git diy https://github.com/baiyunxue/lede-feeds.git' feeds.conf.default
#echo 'src-git hackpackage https://github.com/openwrt/packages.git;openwrt-19.07' >>feeds.conf.default
#echo 'src-git hackluci https://github.com/openwrt/luci.git;openwrt-19.07' >>feeds.conf.default
#echo 'src-git baiyunxue https://github.com/baiyunxue/lede-feeds.git' >>feeds.conf.default
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
#sed -i '$a src-git diy https://github.com/CCnut/feed-netkeeper.git;LUCI-LUA-UCITRACK' feeds.conf.default
#sed -i '$a src-git immortalwrt https://github.com/immortalwrt/luci.git;openwrt-18.06' feeds.conf.default
