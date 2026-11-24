# 说明书配图工具

生成《Saber 鸿蒙版使用手册》里那些标注图的脚本。两个平台都能跑。

| 文件 | 作用 |
|---|---|
| `make_manual_images.sh` | **唯一事实来源**:每张图用哪张底图、哪些 `--ann` 坐标都写在这里 |
| `make_manual_images.py` | 跨平台驱动:**解析上面那个 .sh** 再逐条调用 `annotate.py`(Windows 上没 bash 也能跑) |
| `annotate.py` | 真正画框 / 画编号 / 写中文说明(依赖 Pillow) |
| `hui.py` | 跟平板打交道:`dump` 抓语义树、`shot` 截图、`tap/swipe/key/text` 操作、`windows` 列窗口 |
| `verify_annotations.py` | 校验标注图里每个编号确实画出来了(自检用) |

## 用法

```bash
# 1. 连上平板
hdc tconn <设备IP>:<无线调试端口>

# 2. 截图
python harmony/docs/manual/tools/hui.py shot harmony/docs/manual/shots/01-home.jpeg

# 3. 打标注 -> harmony/docs/manual/img/*.png
python harmony/docs/manual/tools/make_manual_images.py          # Windows / macOS
bash harmony/docs/manual/tools/make_manual_images.sh             # Linux

# 4. 自检(可选):确认每个编号都画出来了
python harmony/docs/manual/tools/verify_annotations.py
```

只想重做某几张:`python harmony/docs/manual/tools/make_manual_images.py 01 05`

## 两个坑

* **语义树需要开无障碍**:Flutter 只有在检测到无障碍客户端时才构建语义树,
  否则 `uitest dumpLayout` 只能看到空壳的 `XComponent`。要重新取坐标,
  先在平板上「设置 → 辅助功能 → 无障碍」启用任意一个无障碍服务。
  (`hui.py` 会在设备端的 `-b` 过滤返回空树时,自动回退成整屏 dump + 按窗口过滤。)
* **设备端的 `-b` 过滤对 Flutter 窗口会返回空树** —— 已在 `hui.py` 里处理,
  想手动看看有哪些窗口:`python harmony/docs/manual/tools/hui.py windows`。

## 字体

`annotate.py` 需要一个数字粗体字和一个中文字体,按下列顺序自动找:

* 数字:`$ANNOTATE_DIGIT_FONT` → DejaVuSans-Bold.ttf(Linux)→ arialbd.ttf(Windows)
* 中文:`$ANNOTATE_CJK_FONT` → NotoSansCJK-Bold.ttc(Linux)→ NotoSansSC-VF.ttf / msyhbd.ttc(Windows)
