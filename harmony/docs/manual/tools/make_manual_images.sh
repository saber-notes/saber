#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# make_manual_images.sh —— 生成说明书里所有的标注图
#
# 坐标全部来自设备上的 uitest dumpLayout(语义树),
# 因此标注框与真实控件是对齐的。
# ---------------------------------------------------------------------------
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."
A="python3 scripts/annotate.py"
OUT="manual/img"
mkdir -p "$OUT"

# --- 01 首页 ---------------------------------------------------------------
$A shots/01-home.jpeg "$OUT/01-home.png" --scale 1600 \
  --ann "box:22,195,144,286"   --ann "badge:83,240" \
  --ann "box:22,332,136,674"   --ann "badge:79,457" \
  --ann "box:167,70,900,176"   --ann "badge:300,120" \
  --ann "badge:2967,122" \
  --ann "badge:3066,122" \
  --ann "box:197,206,666,495"  --ann "badge:430,350" \
  --ann "box:2983,1818,3089,1924" --ann "badge:3036,1871"

# --- 02 新建 / 导入菜单 ----------------------------------------------------
$A shots/02-new-note-menu.jpeg "$OUT/02-new-note.png" --scale 1600 \
  --ann "box:2814,1609,3080,1681" --ann "badge:2883,1637" \
  --ann "box:2814,1723,3080,1795" --ann "badge:2883,1751" \
  --ann "box:2983,1818,3089,1924" --ann "badge:3036,1871"

# --- 03 白板 ---------------------------------------------------------------
$A shots/04-whiteboard.jpeg "$OUT/03-whiteboard.png" --scale 1600 \
  --ann "box:174,77,266,168"    --ann "badge:220,122" \
  --ann "box:304,96,387,149"    --ann "badge:345,122" \
  --ann "badge:2891,122" \
  --ann "badge:2982,122" \
  --ann "badge:3073,122" \
  --ann "box:693,237,2593,1848" --ann "badge:1500,880" \
  --ann "box:963,1863,2323,1939" --ann "badge:1001,1901"

# --- 04 笔记编辑器(完整工具栏) --------------------------------------------
$A shots/05-editor.jpeg "$OUT/04-editor.png" --scale 1600 \
  --ann "box:7,77,98,168"       --ann "badge:52,122" \
  --ann "box:136,77,1200,168"   --ann "badge:400,122" \
  --ann "badge:2891,122" \
  --ann "badge:2982,122" \
  --ann "badge:3073,122" \
  --ann "box:610,237,2510,1727" --ann "badge:1500,700" \
  --ann "badge:917,1901" --ann "badge:1016,1901" --ann "badge:1115,1901" \
  --ann "badge:1214,1901" --ann "badge:1313,1901" --ann "badge:1411,1901" \
  --ann "badge:1510,1901" --ann "badge:1609,1901" --ann "badge:1708,1901" \
  --ann "badge:1807,1901" --ann "badge:1905,1901" --ann "badge:2004,1901" \
  --ann "badge:2103,1901" --ann "badge:2202,1901"

# --- 05 颜色面板 -----------------------------------------------------------
$A shots/13-colors.jpeg "$OUT/05-colors.png" --scale 1600 \
  --ann "box:815,1785,988,1833"  --ann "badge:901,1809" \
  --ann "box:1265,1785,2456,1833" --ann "badge:1296,1809" \
  --ann "badge:1547,1809" \
  --ann "badge:1672,1809" \
  --ann "badge:1798,1809" \
  --ann "badge:1923,1809" \
  --ann "badge:2425,1809"

# --- 06 导出栏 -------------------------------------------------------------
$A shots/06-export.jpeg "$OUT/06-export.png" --scale 1600 \
  --ann "box:1439,1742,1560,1833" --ann "badge:1499,1787" \
  --ann "box:1560,1742,1682,1833" --ann "badge:1621,1787" \
  --ann "box:1682,1742,1804,1833" --ann "badge:1743,1787"

# --- 07 设置 ---------------------------------------------------------------
$A shots/07-settings.jpeg "$OUT/07-settings.png" --scale 1600 \
  --ann "box:167,191,3119,328"   --ann "badge:400,260" \
  --ann "box:182,343,3104,434"   --ann "badge:400,389" \
  --ann "box:167,548,3119,700"   --ann "badge:400,624" \
  --ann "box:167,700,3119,852"   --ann "badge:400,776" \
  --ann "box:167,852,3119,1004"  --ann "badge:400,928" \
  --ann "box:167,1004,3119,1156" --ann "badge:400,1080" \
  --ann "box:167,1156,3119,1308" --ann "badge:400,1232" \
  --ann "box:167,1460,3119,1559" --ann "badge:300,1510"

# --- 08 设置(滚动) ---------------------------------------------------------
$A shots/08-settings-scroll.jpeg "$OUT/08-settings-scroll.png" --scale 1600 \
  --ann "box:167,1583,3119,1735" --ann "badge:400,1659" \
  --ann "box:167,626,3119,724"   --ann "badge:300,675"

# --- 09 全部笔记 -----------------------------------------------------------
$A shots/09-browse.jpeg "$OUT/09-browse.png" --scale 1600 \
  --ann "box:167,70,3119,176"    --ann "badge:300,120" \
  --ann "badge:2876,122" \
  --ann "badge:2967,122" \
  --ann "badge:3066,122" \
  --ann "box:190,222,674,415"    --ann "badge:430,318" \
  --ann "box:2983,1818,3089,1924" --ann "badge:3036,1871"

# --- 10 展开的侧边栏(文件树) ----------------------------------------------
$A shots/10-file-tree.jpeg "$OUT/10-file-tree.png" --scale 1600 \
  --ann "box:22,195,144,286"     --ann "badge:83,240" \
  --ann "box:22,332,592,767"     --ann "badge:300,743" \
  --ann "box:615,70,3120,176"    --ann "badge:800,120"

# --- 11 Nextcloud 登录 -----------------------------------------------------
$A shots/11-nextcloud.jpeg "$OUT/11-nextcloud.png" --scale 1600 \
  --ann "box:420,709,1499,764"   --ann "badge:700,736" \
  --ann "box:1712,709,2700,769"  --ann "badge:1900,739" \
  --ann "box:1613,893,1934,942"  --ann "badge:1700,917" \
  --ann "box:1620,1119,2700,1225" --ann "badge:1800,1172"

# --- 12 编辑器设置对话框 ---------------------------------------------------
$A shots/12-editor-menu.jpeg "$OUT/12-editor-menu.png" --scale 1600 \
  --ann "box:1115,932,2004,978"  --ann "badge:1300,955" \
  --ann "box:1115,978,2004,1377" --ann "badge:1250,1100" \
  --ann "box:1115,1407,2004,1453" --ann "badge:1300,1430" \
  --ann "box:1115,1582,2004,1628" --ann "badge:1300,1605" \
  --ann "box:1115,1628,2004,1666" --ann "badge:1300,1647"

# --- 13 导入笔记:系统文件选择器 -------------------------------------------
# 坐标取自 uitest dumpLayout(鸿蒙自带选择器,不是 Flutter 画的,
# 所以坐标会随窗口位置变化;这里是浮窗 [515,351]-[2605,1675] 时的取值)
$A shots/13-file-picker.jpeg "$OUT/13-file-picker.png" --scale 1600 \
  --ann "box:391,300,780,1250"   --ann "badge:600,1180" \
  --ann "box:1600,325,1850,395"  --ann "badge:1725,290" \
  --ann "box:803,434,2400,1447"  --ann "badge:2180,1300" \
  --ann "box:803,1500,1190,1570" --ann "badge:1050,1462" \
  --ann "box:803,1643,1000,1719" --ann "badge:1060,1610" \
  --ann "box:2456,1643,2684,1719" --ann "badge:2560,1600"

# --- 15 导出:系统「另存为」对话框 -----------------------------------------
$A shots/15-save-dialog.jpeg "$OUT/15-save-dialog.png" --scale 1600 \
  --ann "box:391,300,780,1250"   --ann "badge:600,1180" \
  --ann "box:1150,220,1260,280"  --ann "badge:1205,185" \
  --ann "box:954,1505,2290,1583" --ann "badge:1600,1462" \
  --ann "box:2456,1643,2684,1719" --ann "badge:2560,1600"

# --- 16 插入照片:带后缀过滤的文件选择器 -----------------------------------
$A shots/16-photo-picker.jpeg "$OUT/16-photo-picker.png" --scale 1600 \
  --ann "box:391,300,780,1250"   --ann "badge:600,1180" \
  --ann "box:803,1490,1200,1570" --ann "badge:1050,1462" \
  --ann "box:803,434,2400,1440"  --ann "badge:2180,1300" \
  --ann "box:2456,1643,2684,1719" --ann "badge:2560,1600"

echo
echo "已生成:"
ls -1 "$OUT"
