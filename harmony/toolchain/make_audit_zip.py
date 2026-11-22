#!/usr/bin/env python3
"""生成上传给华为应用市场审核的「授权书及其他材料」附件(审核附件)。

审核第 2 轮要求在版本信息页的「版权信息 / 审核附件」里提供软件权属依据。
本项目是 Saber(GPL-3.0)的 HarmonyOS 移植版本,无法提供上游的「官方授权书」,
但可以提供 **GPL-3.0 协议全文 + 一份开源说明** —— 这正是本项目合法的分发依据。

用法:
    python3 harmony/toolchain/make_audit_zip.py                # 输出到 /tmp/saber-open-source-audit.zip
    python3 harmony/toolchain/make_audit_zip.py -o /tmp/x.zip

产物(不含任何签名材料):
    GPL-3.0-LICENSE.pdf       上游 GPL-3.0 协议全文(PDF,可直接阅读/打印)
    开源说明与授权依据.pdf     开源说明(中文,PDF)
    LICENSE                   上游 GPL-3.0 协议全文(纯文本,取自仓库根目录的 LICENSE.md)
    README-OpenSource.txt     开源说明(纯文本):上游地址 / 本项目地址 / 授权依据 / 与上游的差异

为什么要 PDF:审核第 3 轮的阻塞意见是「缺《Saber 官方授权书》」,并明确指出
上传路径是「分发 > 版本信息 > 版权信息」,而那个位置的上传控件说明写着
「压缩包内支持包含 JPG、JPEG、BMP 格式图片和 **PDF** 格式的文件」。
所以在原有纯文本之外补两份 PDF,让审核员在版权信息里**当场就能翻到依据**。
"""

import argparse
import os
import re
import zipfile

REPO_ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

UPSTREAM_URL = "https://github.com/saber-notes/saber"
OWN_REPO_URL = "https://github.com/brysj22952/saber"
OWN_BRANCH = "feature/ohos-harmonyos"

README_TEMPLATE = """赛博手写笔记 —— 开源说明与授权依据

一、应用性质
本应用(应用名称:赛博手写笔记;包名:com.sabernotes.saber)是开源项目 Saber
({upstream})的 HarmonyOS / 鸿蒙(OpenHarmony NEXT)移植版本,
基于 GPL-3.0 协议开源,源代码完整公开,遵循 GPL-3.0 的全部条款。

二、源码地址
1. 官方开源项目(Saber 上游本体,GPL-3.0):
   {upstream}
2. 本鸿蒙版本(含完整鸿蒙构建链、签名配置说明、补丁脚本):
   {own}
   分支:{branch}

三、授权依据
附件 LICENSE 为 Saber 上游项目采用的 GPL-3.0 完整协议文本。
GPL-3.0 第 4、5、6 条明确允许在保留版权声明与许可证的前提下,
复制、修改并以源程序形式分发本作品,以及分发由本作品衍生的程序。
本移植版本即依据该授权条款开发与发布,并在应用内与本说明中保留上游版权归属信息。

四、与上游的差异(避免混淆)
本移植版本已重新设计应用图标与应用名称(由原项目名改为「赛博手写笔记」),
界面与应用信息均已独立调整,不是上游官方发布的版本,上游项目维护者
不对本移植版本提供官方支持,相关问题请以本仓库 issue 为准。

五、关于名称与图标的独立性(针对「知识产权」审核项)
1. 应用名称「赛博手写笔记」为**本移植版本独立命名**,与上游「Saber」不同,
   上游名称仅按 GPL 署名要求出现在版权声明与源码地址中,不作为本应用名称使用。
2. 应用图标为**从零绘制**的全新图形:近黑石板底(#090e18)+ 青色霓虹触控笔
   (#22d3ee)+ 电路节点,整体冷色科技风。上游项目的图标是**一张黄色纸页配深色笔迹**
   (黄纸 #faca22/#ffd32e、笔迹 #32322e),两者底色、主体与配色完全相反,
   与市场上「Saber」应用的图标无任何素材复用;绘制脚本开源于 {own}
   (harmony/toolchain/make_app_icon.py),可自行核对并复现每一笔。
3. 应用**内部**原先引用的上游图标(关于弹窗、登录页、桌面标题栏)已全部移除,
   统一改用本移植版本自己的图标;应用界面文案中**作为应用自称**的「Saber」
   (26 个语言包的界面文案)已全部改为「赛博手写笔记」。
   仅以下四处按原样保留「Saber」,均非应用自称:
   ① 版权声明里的上游版权署名(GPL-3.0 要求原样保留);
   ② 本机数据文件夹名(磁盘上该文件夹确实叫 Saber);
   ③ 「删除服务器上 Saber 文件夹」一句(服务器上那个文件夹是上游定的名字);
   ④ 「官方 Saber 服务器」一句(该服务器由上游运营,并非本移植版本提供)。
4. 本移植版本未使用上游的商标、商店素材、官方账号或官方服务器,
   与上游及其在应用市场发布的版本无从属、代理或联合运营关系。

六、上游版权声明(按 GPL 要求原样保留)
Saber  Copyright © 2022-2026  Adil Hanney
本程序不附带任何担保。这是自由软件,您可以在特定条件下重新分发它。
(该声明同时显示在本应用「设置 → 关于」中;上游作者信息见上游仓库 {upstream})

七、构建说明
本移植版本在 HarmonyOS 设备 / 开发工具链上编译打包,构建脚本位于:
{own}(harmony/scripts/build_ohos.sh)

八、隐私与数据处理(与应用市场声明完全一致)
本移植版本**不集成任何第三方崩溃上报与埋点 SDK**。上游项目自带的 Sentry
崩溃上报实现(含其写死的 DSN)已在移植过程中整体移除:应用既不会初始化该 SDK,
也不会向用户弹窗征求「上报错误」的同意,更不会把崩溃数据或使用数据发送到
任何第三方服务器。
应用仅申请 ohos.permission.INTERNET(访问网络)这一个权限,且仅在用户主动开启
Nextcloud 同步、并连接用户自己指定的服务器时才会使用;不开启同步时完全离线运行。
应用无广告、无统计 SDK、不采集崩溃日志、不收集任何个人信息。

九、联系方式
开发者仓库与问题反馈:{own}
"""


def _pdf_escape(s: str) -> str:
    return s.replace("\\", r"\\").replace("(", r"\(").replace(")", r"\)")


def latin_to_pdf(text: str) -> bytes:
    """把纯西文文本排成 PDF(内置 Helvetica,不依赖任何外部库)。

    环境里没有 reportlab/fpdf,审核附件却要 PDF,所以这里手写一个最小可用的
    PDF 生成器:只支持 Helvetica / Helvetica-Bold、WinAnsi 编码、A4 纵向。
    """
    # 先把常见的排版字符降成 ASCII,再把非 latin-1 字符替换掉(避免生成非法 PDF)
    text = (text.replace("→", "->").replace("—", "--").replace("–", "-")
                .replace("‘", "'").replace("’", "'")
                .replace("“", '"').replace("”", '"')
                .replace("©", "(c)").replace("…", "..."))
    lines: list[str] = []
    for raw in text.splitlines():
        raw = raw.encode("latin-1", "replace").decode("latin-1")
        if len(raw) <= 100:
            lines.append(raw)
            continue
        cur = ""
        for word in raw.split(" "):
            if cur and len(cur) + len(word) + 1 > 100:
                lines.append(cur)
                cur = word
            else:
                cur = (cur + " " + word).strip()
        lines.append(cur)

    per_page, leading, top, bottom = 62, 13.2, 780, 56
    pages = [lines[i:i + per_page] for i in range(0, len(lines), per_page)] or [[""]]

    objs: list[bytes] = []

    def add(body: bytes) -> int:
        objs.append(body)
        return len(objs)

    font_id = add(b"<< /Type /Font /Subtype /Type1 /BaseFont /Helvetica /Encoding /WinAnsiEncoding >>")
    bold_id = add(b"<< /Type /Font /Subtype /Type1 /BaseFont /Helvetica-Bold /Encoding /WinAnsiEncoding >>")
    pages_id = len(objs) + 1 + 2 * len(pages)  # 先占位,稍后回填

    page_ids = []
    for page in pages:
        stream = ["BT", "/F1 9.5 Tf", f"{leading} TL", f"1 0 0 1 56 {top} Tm"]
        for ln in page:
            stream.append(f"({_pdf_escape(ln)}) Tj T*")
        stream.append("ET")
        content = "\n".join(stream).encode("latin-1", "replace")
        cid = add(b"<< /Length " + str(len(content)).encode() + b" >>\nstream\n" + content + b"\nendstream")
        pid = add(
            b"<< /Type /Page /Parent " + str(pages_id).encode() + b" 0 R /MediaBox [0 0 595 842]"
            b" /Resources << /Font << /F1 " + str(font_id).encode() + b" 0 R /F2 " + str(bold_id).encode()
            + b" 0 R >> >> /Contents " + str(cid).encode() + b" 0 R >>"
        )
        page_ids.append(pid)

    kids = b" ".join(str(p).encode() + b" 0 R" for p in page_ids)
    objs.insert(pages_id - 1, b"<< /Type /Pages /Kids [" + kids + b"] /Count "
                + str(len(page_ids)).encode() + b" >>")
    catalog_id = add(b"<< /Type /Catalog /Pages " + str(pages_id).encode() + b" 0 R >>")

    out = bytearray(b"%PDF-1.4\n")
    offsets = []
    for n, body in enumerate(objs, start=1):
        offsets.append(len(out))
        out += str(n).encode() + b" 0 obj\n" + body + b"\nendobj\n"
    xref_pos = len(out)
    out += b"xref\n0 " + str(len(objs) + 1).encode() + b"\n"
    out += b"0000000000 65535 f \n"
    for off in offsets:
        out += ("%010d 00000 n \n" % off).encode()
    out += (b"trailer\n<< /Size " + str(len(objs) + 1).encode() + b" /Root " + str(catalog_id).encode()
            + b" 0 R >>\nstartxref\n" + str(xref_pos).encode() + b"\n%%EOF\n")
    return bytes(out)


def cjk_to_pdf(text: str, path: str) -> None:
    """把中文文本排成 PDF。

    环境里没有能嵌中文字体的 PDF 库,所以用 PIL 渲染成图再存成 PDF
    (文字不可检索,但排版正常,审核员看内容没问题)。
    """
    from PIL import Image, ImageDraw, ImageFont

    font_path = "/usr/share/fonts/opentype/noto/NotoSansCJK-Regular.ttc"
    if not os.path.exists(font_path):
        font_path = "/usr/share/fonts/opentype/noto/NotoSerifCJK-Regular.ttc"
    font = ImageFont.truetype(font_path, 30)
    title_font = ImageFont.truetype(font_path, 38)

    width, height, margin = 1240, 1754, 90  # A4 @150dpi
    probe = Image.new("RGB", (10, 10), "white")
    d0 = ImageDraw.Draw(probe)

    def wrap(txt: str) -> list[str]:
        out, cur = [], ""
        for ch in txt:
            if d0.textlength(cur + ch, font=font) > width - 2 * margin:
                out.append(cur)
                cur = ch
            else:
                cur += ch
        out.append(cur)
        return out

    blocks: list[tuple[str, bool]] = []  # (行, 是否标题)
    for raw in text.splitlines():
        if not raw.strip():
            blocks.append(("", False))
        elif raw.startswith("赛博手写笔记"):
            blocks.append((raw, True))
        else:
            blocks.extend((ln, False) for ln in wrap(raw))

    pages, cur, y = [], [], margin
    for line, is_title in blocks:
        f = title_font if is_title else font
        lh = 46 if is_title else 40
        if y + lh > height - margin:
            pages.append(cur)
            cur, y = [], margin
        cur.append((line, is_title))
        y += lh
    pages.append(cur)

    images = []
    for page in pages:
        img = Image.new("RGB", (width, height), "white")
        d = ImageDraw.Draw(img)
        y = margin
        for line, is_title in page:
            if line:
                d.text((margin, y), line, fill="black", font=title_font if is_title else font)
            y += 46 if is_title else 40
        images.append(img)
    images[0].save(path, "PDF", resolution=150.0, save_all=True, append_images=images[1:])


def markdown_to_text(md: str) -> str:
    """把 LICENSE.md 粗略地转成可排版的纯文本。"""
    out = []
    for line in md.splitlines():
        line = re.sub(r"^#{1,6}\s*", "", line)
        line = line.replace("**", "").replace("`", "")
        line = re.sub(r"^\|\s*", "", line)
        line = re.sub(r"\s*\|\s*$", "", line)
        if re.fullmatch(r"[-=]{3,}", line.strip()):
            continue
        out.append(line.rstrip())
    return "\n".join(out)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-o", "--output", default="/tmp/saber-open-source-audit.zip")
    args = ap.parse_args()

    lic = os.path.join(REPO_ROOT, "LICENSE.md")
    if not os.path.exists(lic):
        lic = os.path.join(REPO_ROOT, "LICENSE")
    if not os.path.exists(lic):
        raise SystemExit("找不到 LICENSE / LICENSE.md,无法生成授权依据附件")

    with open(lic, encoding="utf-8", errors="replace") as f:
        gpl_md = f.read()
    readme = README_TEMPLATE.format(upstream=UPSTREAM_URL, own=OWN_REPO_URL, branch=OWN_BRANCH)

    gpl_pdf = latin_to_pdf(markdown_to_text(gpl_md))
    cjk_pdf_path = "/tmp/opensource-statement.pdf"
    cjk_to_pdf(readme, cjk_pdf_path)
    with open(cjk_pdf_path, "rb") as f:
        cjk_pdf = f.read()

    with zipfile.ZipFile(args.output, "w", zipfile.ZIP_DEFLATED) as z:
        z.write(lic, "LICENSE")
        z.writestr("README-OpenSource.txt", readme)
        z.writestr("GPL-3.0-LICENSE.pdf", gpl_pdf)
        z.writestr("开源说明与授权依据.pdf", cjk_pdf)

    print("已生成:", args.output, os.path.getsize(args.output), "字节")
    for info in zipfile.ZipFile(args.output).infolist():
        print(f"  {info.filename:28} {info.file_size:>8} 字节")


if __name__ == "__main__":
    main()
