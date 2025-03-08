#
# This file is part of Pixel Enabler China  For VoTEL.
#
# Pixel Enabler China  For VoTEL is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# Copyright (C) 2021 Pixel Enabler China  For VoTEL Contributors
#

# shellcheck disable=SC2034
SKIPUNZIP=1

VERSION=$(grep_prop version "${TMPDIR}/module.prop")
ui_print "- Pixel Enabler China  For VoTEL version ${VERSION}"
ui_print "- Pixel 启用中国 VoTEL 模块 版本号 ${VERSION}"
# Install
ui_print "- Start Install"
ui_print "- 开始安装"

DEVICE=`getprop ro.product.system.brand`

# Extract Files
ui_print "- Extracting module files"
ui_print "- 导出模块文件"
unzip -o "$ZIPFILE" -d "$MODPATH"

# Edit mbn_sw.txt
SY=/vendor/rfs/msm/mpss/readonly/vendor/mbn/mcfg_sw/
MS=$MODPATH/system/vendor/rfs/msm/mpss/readonly/vendor/mbn/mcfg_sw/mbn_sw.txt
find "$SY" -name '*.mbn' 2>&1  | grep -oi "mcfg_sw/.*/Commercial/.*\.mbn" > "$MS"

# Set perm
set_perm_recursive "$MODPATH" 0 0 0755 0644

# Clean fdr
ui_print "- Removing /data/vendor/modem_fdr/fdr_check"
ui_print "- 删除 /data/vendor/modem_fdr/fdr_check"
rm /data/vendor/modem_fdr/fdr_check

ui_print "- The installation is complete !"
ui_print "- 安装完成!"
ui_print "- Welcome to Pixel Enabler China  For VoTEL version Module!"
ui_print "-  欢迎使用 Pixel 启用中国 VoTEL 模块!"
