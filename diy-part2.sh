#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.3.1/g' package/base-files/files/bin/config_generate

#Add LAN DNS
sed -i '/$netm/a \\t\t\t\tset network.$1.dns=\'"'"'223.5.5.5 223.6.6.6\'"'"'' package/base-files/files/bin/config_generate

#ssid
#sed -i 's/OpenWrt/360T7/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#sed -i 's/none/psk-mixed/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#sed -i '/encryption/a \\t\t\tset wireless.default_radio${devidx}.key=12345678' package/kernel/mac80211/files/lib/wifi/mac80211.sh

#set root password
sed -i 's/root.*/root:$1$h04sEe8A$kYjJPkQdnyixuiZY3zf2D.:19484:0:99999:7:::/' package/base-files/files/etc/shadow

#theme
sed -i 's/+luci-theme-bootstrap//g' feeds/luci/collections/luci/Makefile

#image Size
#sed -i 's/tplink-4mlzma/tplink-16mlzma/g' target/linux/ath79/image/tiny-tp-link.mk
