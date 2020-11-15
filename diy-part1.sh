#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add feed source
sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default

# Diy Source Code
rm -rf ./package/lean/luci-theme-argon #删除Lean自带的argon主题
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon #新argon主题
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config #新argon主题控制程序
git clone https://github.com/tty228/luci-app-serverchan.git package/luci-app-serverchan #微信推送
git clone https://github.com/zzsj0928/luci-app-serverchand.git package/luci-app-serverchand #钉钉推送
