# 把鸿蒙适配合并回上游:策略与操作手册

本文档回答一个问题:**这套鸿蒙适配怎么合并回 [saber-notes/saber](https://github.com/saber-notes/saber)?**

> **当前状态(2026-11-22)**:已经按下面的思路提了一个 PR 到上游 —— 见本文末尾的
> 「§8 已经提上去的 PR」。下面 §1–§7 是当时的设计分析,保留下来是因为
> 「上游到底想要不想要鸿蒙支持」「AI 生成的代码要不要交」这两个问题
> 仍然没有答案,讨论的时候还会用到。

结论先说:**不要按现在这个形态直接提一个巨型 PR。**
上游的 [CONTRIBUTING.md](../../.github/CONTRIBUTING.md) 写得很明确,
按它现在的样子提,基本会被关掉。下面把规矩、拆法、每一步怎么操作都写清楚。

---

## 0. 现状

| 项 | 值 |
|---|---|
| 上游仓库 | https://github.com/saber-notes/saber |
| 你的 fork | https://github.com/brysj22952/saber |
| 已推送的分支 | `feature/ohos-harmonyos`(完整工作分支)/ `feature/harmonyos-build-target`(提给上游的 PR 分支) |
| 提给上游的 PR 分支 | 基于上游 `a8175613`(v1.38.0),纯新增,**0 行删除** |
| 改动规模 | `harmony/` + `ohos/` 两个新增目录 + `.gitignore` 几行,上游源码**一行没动** |
| 本地验证 | HarmonyOS NEXT 真机(HUAWEI MatePad Edge,API 26)安装并运行正常;应用已上架华为应用市场 |

---

## 1. 上游的规矩,逐条对照

先读一遍上游的 [CONTRIBUTING.md](../../.github/CONTRIBUTING.md),它对本次改动的影响如下。

### 1.1 「Tiny PRs」—— ⚠️ 最大的障碍

> *I am currently only accepting tiny focused pull requests...*
> *As a rule of thumb, if you would feel disappointed that all your work went to waste if the PR is rejected, it's too big of a PR.*

一个 8385 行、87 个文件的 PR,按这条规矩是**不可能**被接受的。
上游维护者是个人项目,明确说了没有团队、精力有限。

→ 必须拆。拆法见 [§3](#3-拆分策略)。

### 1.2 「Link to an issue」

> *Your pull request must be [linked to an issue]... If there is no existing issue for your proposed change, please open one first.*

→ 必须**先开 issue**,再提 PR,并在 PR 描述里用 `Closes #<编号>` 关联。

### 1.3 「Test everything」

> *Your pull request must be covered by tests. All new and existing tests must pass.*

本次改动的测试情况:

* ✅ 原有测试不受影响(没动 `lib/` 和 `pubspec.yaml`)
* ❌ **新增的 `harmony/packages/stow_secure` 没有单元测试** —— 这是个明确的缺口,
  提 PR 之前应该补上(见 [§3.2](#32-pr-2stow_secure-的鸿蒙实现--提到-adil192stow))

### 1.4 「Document public members」

`harmony/packages/stow_secure/lib/src/secure_stow.dart` 里的公开成员
(`SecureStow`、`SecureStow.int`、`SecureStow.bool`、`keyPrefix`)都有 dartdoc。
但注释是中文的,上游的代码库是英文 —— 提 PR 前需要翻译成英文。

### 1.5 「AI」—— ⚠️ 需要你自己决定

> **Don't generate code or translations\* for this project using AI chatbots or agents.**
> *Reviewing and maintaining AI-generated code is a drain on contributor time...*
> *Autocomplete tools may be used at your discretion, but all submitted code must be fully designed, written, and understood by you.*

这条直接针对本次工作:鸿蒙适配里的 Dart 代码、脚本、文档,
是由 AI 辅助生成和整理的。

**这意味着:直接把这些代码以「我的贡献」的形式提给上游,不符合上游公开的规则。**

你有几个选择:

| 选项 | 说明 |
|---|---|
| **A. 自己重写** | 把代码通读一遍,按自己的写法重写,真正理解每一行。能满足「fully designed, written, and understood by you」的要求。 |
| **B. 只提「不含生成代码」的部分** | 比如只提 issue 讨论、只提手写的文档、只提你手工整理的 issue 列表。 |
| **C. 先问维护者** | 开 issue 时直接问:「我打算提交一套鸿蒙适配,其中部分代码是 AI 辅助的,你们接受吗?」 |

我建议 **A + C**:先开 issue 说明来意(顺便确认他们**是否想要**鸿蒙支持 ——
这本身就不确定),再决定投多少工作量。

> ⚠️ 这一条不是形式主义。上游维护者明说了 AI 代码会增加他的审查负担。
> 被要求撤回的概率不低,而且一旦发生,会损害你在社区里的信誉。
> **开 issue 之前请先读完这段。**

### 1.6 许可证

Saber 是 **GPL-3.0**。提交即表示:

* 你的贡献以 GPL-3.0 授权;
* 你已读过并同意 [Developer Certificate of Origin](https://developercertificate.org/);
* 用这份代码构建的鸿蒙应用也必须以 GPL-3.0 开源。

本次改动没有引入任何新的第三方代码或依赖,
`harmony/packages/stow_secure` 是本仓库内的自有实现,不涉及 `flutter_secure_storage` 的代码复制。

---

## 2. 先想清楚:上游到底想要不想要鸿蒙支持?

在写任何代码之前,这是最该先确认的事。

上游是一个**个人维护的、精力有限**的项目,目前支持的平台是
Android / iOS / Linux / macOS / Windows。鸿蒙支持意味着:

* 多一套构建目标要维护;
* 多一套依赖覆盖要维护;
* 多一个平台要测;
* CI 要么加鸿蒙 job(需要 Flutter-OH + DevEco SDK,很重),要么不加(那平台就很容易坏掉)。

**这些成本全落在维护者一个人身上。** 所以「能不能提」和「他会不会接受」是两件事。

开 issue 的时候,把成本摊开讲清楚,让维护者自己判断:

* 改动是**纯新增**,不碰任何现有代码 —— 维护成本只是「多一个目录」;
* CI 不需要加鸿蒙 job(Flutter-OH 不在公开 CI 里跑得起来);
* 已知限制(PDF 预览、后台同步、分享导出)都写在了 `harmony/docs/ohos.md` §5。

---

## 3. 拆分策略

按「上游能不能独立接受」来拆,而不是按「技术上怎么分」。

### 3.1 PR-0:先开 issue(不是 PR)

**标题**

```
Add OpenHarmony / HarmonyOS NEXT build target
```

**正文**(可直接用,按需调整)

```markdown
Hi Adil,

I'd like to add support for building Saber as a HarmonyOS NEXT (OpenHarmony)
HAP. The work is complete and tested on a real device
(HUAWEI MatePad Edge, HarmonyOS 7.0.0 / API 26).

**What it is**

A pure-addition port — no existing source file is modified:

| Path | What |
|---|---|
| `ohos/` | HarmonyOS project skeleton (`flutter create --platforms ohos`) |
| `harmony/packages/stow_secure/` | OpenHarmony implementation of `stow_secure` |
| `harmony/patches/ohos/` | pub-cache patches (`TargetPlatform.ohos` switch arms, native assets) |
| `harmony/scripts/build_ohos.sh` | one-shot HAP build |
| `harmony/toolchain/` | host-side tooling (SDK prep, Linux AOT, signing, install) |
| `harmony/docs/ohos.md` | full guide: build / sign / install / troubleshooting |

`lib/` and `pubspec.yaml` are untouched, so no existing platform is affected.

**Requirements**

Building for HarmonyOS needs the [Flutter-OH](https://atomgit.com/oh-flutter/flutter_flutter)
fork (`3.47.9-ohos-1.0.0`) — upstream Flutter has no OHOS target and no
`TargetPlatform.ohos`. So CI can't run it on GitHub Actions, and the
port would be maintained by hand.

**Questions before I open a PR**

1. Would you be interested in maintaining an OpenHarmony build target?
2. If not, would you be open to a docs-only PR (a short `harmony/docs/ohos.md`
   pointing at an out-of-tree repo)?
3. `stow_secure` is a separate package you maintain
   ([adil192/stow](https://github.com/adil192/stow)) — would you prefer the
   OpenHarmony `SecureStow` implementation to go there as a PR instead?

**Current limitations** (full table in `harmony/docs/ohos.md`):
PDF preview/import (no OHOS pdfium), background sync, share/export,
and the `printing` plugin are not available on HarmonyOS.

Licensed under GPL-3.0, same as the project. DCO signed.
```

> 三个问题里,第 3 个是最有希望的突破口:
> `stow_secure` 是**你(维护者)自己维护的独立包**,而且是它挡在鸿蒙适配前面。
> 一个聚焦的、几十行的 `stow_secure` 鸿蒙实现 PR,比一个 8000 行的 Saber
> 鸿蒙 PR 容易被接受得多。

### 3.2 PR-2:`stow_secure` 的鸿蒙实现 —— 提到 `adil192/stow`

**这是整套工作里最可能被接受的一个。**

| 项 | 值 |
|---|---|
| 目标仓库 | https://github.com/adil192/stow |
| 源分支 | `feature/ohos-harmonyos`(本仓库) |
| 改动 | `harmony/packages/stow_secure/` 三个文件 |

做法:

```bash
# 1. fork https://github.com/adil192/stow
# 2. 从本仓库切出一个只含 stow_secure 的分支
cd <saber 工作区>
git checkout -b feature/stow-secure-ohos origin/main
git checkout feature/ohos-harmonyos -- harmony/packages/stow_secure/
git commit -m "feat: add OpenHarmony implementation of SecureStow"
```

提交前要做的事(对照上游 stow 仓库的规矩):

- [ ] 注释改成**英文**
- [ ] 补**单元测试**(`stow` 仓库的测试写法照抄现有测试)
- [ ] 确认 API 与上游 `stow_secure` **完全一致**(`SecureStow` / `.int` / `.bool` /
      `keyPrefix` / `protectedRead` / `protectedWrite` / `writeMutex`)
- [ ] `pubspec.yaml` 里 `shared_preferences` 的版本约束与上游 stow 仓库一致
- [ ] 在 `README` 里说明:鸿蒙端底层是 `shared_preferences`,**不是**硬件级加密,
      敏感场景应改用 `huks`

> 如果维护者不接受用 `shared_preferences` 兜底(毕竟 `SecureStow` 的语义就是
> "secure"),那就得改成基于鸿蒙 `huks`(密钥托管服务)实现 ——
> 工作量更大,但语义正确。提前跟他确认。

### 3.3 PR-3:纯文档 —— 提到 `saber-notes/saber`

如果维护者只想要「知道有这回事」,那就提一个**只加文档**的 PR:

```bash
git checkout -b docs/ohos origin/main
git checkout feature/ohos-harmonyos -- harmony/docs/ohos.md
```

把 `harmony/docs/ohos.md` 里的工具链部分(§4.9、§6)删掉或压缩 ——
那部分是给构建者看的,不是给 Saber 用户看的。
正文保留:怎么构建、怎么签名、已知限制、指向详细文档的链接。

**前提**:必须先有 issue,并且 PR 里 `Closes #<编号>`。

### 3.4 不要提的部分

以下内容**不建议**进上游仓库:

| 内容 | 原因 |
|---|---|
| `harmony/toolchain/` 全家桶 | 高度依赖具体机器的目录布局与 Flutter-OH fork;维护成本大,收益低。放独立仓库。 |
| `ohos/` 里的签名配置 | `storePassword` 是绑定密钥库的密文,必须由使用者本地生成(现在是空串模板,已经是对的)。 |
| `pubspec_overrides.yaml` 放根目录 | 会劫持上游 CI 的 `flutter pub get`。现在放在 `harmony/toolchain/` 由构建脚本复制 —— **这个设计必须保留**。 |

---

## 4. 推荐的最终形态

如果维护者不接受鸿蒙 build target(可能性不低),最稳的落点是:

### 4.1 独立仓库 `brysj22952/saber-ohos`

把这次的工作整理成一个**独立仓库**:

```
saber-ohos/
├── README.md              怎么把 Saber 构建成鸿蒙应用(入口)
├── harmony/docs/ohos.md           完整指南(现在的内容)
├── ohos/                  鸿蒙工程骨架
├── harmony/packages/stow_secure/  鸿蒙实现
├── harmony/patches/ohos/          pub-cache 补丁
├── harmony/scripts/build_ohos.sh  构建脚本
└── harmony/toolchain/        主机侧工具链
```

它跟 Saber 上游的关系用 git submodule / subtree 引用,或者干脆在 Saber 仓库里
留一份 `ohos/`(便于随版本升级同步)。

### 4.2 给 Saber 提一个**一行**的 README 链接

> OpenHarmony / HarmonyOS NEXT build: see https://github.com/brysj22952/saber-ohos

这种 PR 上游很难拒绝 —— 一行,零维护成本。

---

## 5. 操作手册

### 5.1 本地已就绪的东西

```bash
# fork 已在浏览器里创建好:
#   https://github.com/brysj22952/saber

# git remote 已配好:
cd <repo>
git remote -v
#   origin  https://github.com/saber-notes/saber.git   (上游)
#   fork    https://github.com/brysj22952/saber.git     (你的 fork)

# 凭据(PAT,public_repo scope,90 天有效)
#   存在 ~/.git-credentials,git config credential.helper = store
#   ⚠️ 2027-02-08 过期。到期后要重新签发:
#      https://github.com/settings/tokens/new  (勾 public_repo)
#      然后 git push 会提示输入用户名/密码,用户名填 brysj22952,密码填 token
```

### 5.2 同步上游

```bash
cd <repo>
git fetch origin
git rebase origin/main        # 把你的分支挪到上游最新
git push -f fork feature/ohos-harmonyos
```

### 5.3 开 issue(浏览器)

```
https://github.com/saber-notes/saber/issues/new
```

用 [§3.1](#31-pr-0先开issue不是-pr) 里的模板。
**开之前把 §1.5(AI 那条)读一遍**,想清楚要不要提、怎么提。

### 5.4 提 PR(浏览器)

```
https://github.com/saber-notes/saber/compare/main...brysj22952:feature/ohos-harmonyos
```

或者从 fork 的分支页点 "Compare & pull request"。

PR 描述要覆盖上游模板的三条勾选项:

```markdown
- [x] I have read CONTRIBUTING.md. I have followed the requirements including but not limited to the licensing requirements.
- [x] I understand my contribution in full and will be able to respond to review comments.
- [x] I have tested my contribution and it works as described.
```

正文模板:

```markdown
Closes #<issue 编号>

## What
...

## Why
...

## How to build
```bash
source harmony/toolchain/env.sh
bash harmony/scripts/build_ohos.sh --release
```

## Testing
- [x] Builds clean on Linux (Flutter-OH 3.47.9-ohos-1.0.0, HarmonyOS SDK 6.0.1 / API 21)
- [x] Installs and runs on a real device (HUAWEI MatePad Edge, HarmonyOS 7.0.0 / API 26)
- [x] Existing test suite unaffected (no existing source file modified)
- [ ] Unit tests for the new `harmony/packages/stow_secure` — **待补**

## Known limitations
...

## Licensing
GPL-3.0, same as the project. DCO signed.
```

### 5.5 拆分支

```bash
# 每个 PR 一个分支,从最新上游切出来
git fetch origin
git checkout -b feature/<名字> origin/main
# 只把要提的文件搬过来
git checkout feature/ohos-harmonyos -- <路径>
git commit -m "..."
git push -u fork feature/<名字>
```

---

## 6. 复现验证清单

提 PR 之前自己跑一遍,也是 PR 描述里「Testing」那栏的依据。

```bash
cd <repo>
source harmony/toolchain/env.sh

# 1. release 构建
bash harmony/scripts/build_ohos.sh --release
#    期望: build/ohos/hap/entry-default-signed.hap  (~39 MB)

# 2. debug 构建
bash harmony/scripts/build_ohos.sh --debug

# 3. 装到真机
hdc tconn <平板IP>:<无线调试端口>
bash harmony/toolchain/install_on_device.sh
#    期望: install bundle successfully. / start ability successfully.

# 4. 手动检查
#    * 首页正常渲染,能展开「+」菜单
#    * 新建笔记能打开,手写编辑器工具栏完整
#    * 手写跟手(这是 release 才有的,debug 会掉帧)
#    * 无 Dart 异常日志:
#        hdc shell hilog -x | grep -iE 'saber|flutter|dart'
```

已验证的设备信息:

| 项 | 值 |
|---|---|
| 型号 | `QXS-W20`(HUAWEI MatePad Edge) |
| 系统 | HarmonyOS `7.0.0.111(SP16C00E111R6P5)` |
| API | `26` |
| 包名 | `com.sabernotes.saber` |

---

## 7. 已知的坑(提 issue 时可以引用)

| 现象 | 原因 | 处理 |
|---|---|---|
| 白屏 + `MissingPlatformDirectoryException` | release 构建缺 `--dart-define=FLUTTER_OHOS_AOT_BUILD=true`,`Platform.isLinux` 被折叠成 true,注册成了 Linux 桌面插件 | 用 `harmony/scripts/build_ohos.sh`(已内置) |
| 白屏 + `MissingPluginException ... window_manager` | 同上 | 同上 |
| `Illegal base64 character 20` | profile 里的 PEM 末尾少了换行符 | `use_agc_signing.sh` 会提前检出 |
| `verify certificate chain failed!` | `.p7b` 和 `.cer` 不是同一次申请 | 重新申请,两者配套 |
| `Profile cert must a cert chain` | `certpath` 指向了单张证书 | 用完整证书链 |
| 装真机报 `code:9568257` | 用的是 OpenHarmony 社区证书,HarmonyOS NEXT 真机不认 | 用华为账号签发的证书 |
| 装真机报 `code:9568393` | profile 没绑定这台设备的 UDID | 在 AGC 的 Profile 里补 UDID |
| 交互掉帧(每 100ms 一次 JANK) | 用了 debug 包 | 换 release 包 |
| `flutter pub get` 报 `No Hmos SDK found` | HMS SDK 探测告警,不影响构建 | 忽略(`build_ohos.sh` 已处理) |

完整的排查过程见 [`harmony/docs/ohos.md`](ohos.md)。

---

## 8. 已经提上去的 PR(2026-11-22)

| 项 | 值 |
|---|---|
| 源分支 | `brysj22952/saber` 的 `feature/harmonyos-build-target` |
| 目标分支 | `saber-notes/saber` 的 `main` |
| 基线 | 上游 `a8175613`(v1.38.0) |
| 改动 | 纯新增:`harmony/` + `ohos/` 两个目录 + `.gitignore` 几行,**0 行删除** |

做法与本文档前面的分析一致:

1. **先开 issue** —— 上游的 CONTRIBUTING 要求 PR 必须关联一个 issue,
   没有就先去开一个,把「要不要支持鸿蒙」「维护成本有多大」摊开问清楚;
2. **PR 分支从上游最新 `main` 切出来**,只把 `harmony/`、`ohos/`、
   `.gitignore` 搬过去 —— 上游源码一行不改;
3. **私人的东西不带进来** —— 上架华为应用市场的过程记录、提交材料包、
   运维知识库都留在自己的 fork 上,PR 里只放「鸿蒙构建目标」本身;
4. **上游改了补丁的上下文就手工重做** —— 这次上游从 `c85af40` 走到
   `a8175613`,75 个补丁里有 8 个需要重做,重做之后全部干净应用,
   反向撤销能回到与上游完全一致的工作树。

还没解决的:

- **§1.1 的「tiny PRs」** —— 上游明确说只收小 PR。这个 PR 很大,
  被关掉的概率不低。真被拒了,退路是 §3.2 的 `stow_secure` 单独提一个
  几十行的小 PR 到 [adil192/stow](https://github.com/adil192/stow),
  那是最容易被接受的落点。
- **§1.5 的 AI 那条** —— 这套代码是 AI 辅助写出来的,上游公开写了
  「不要用 AI 生成代码」。这个问题应该在 issue 里就问清楚,而不是等
  reviewer 提出来。
- **Flutter-OH 的版本** —— 目前基于 Flutter-OH `3.47.9-ohos-1.0.0`
  (Dart 3.13),而上游 v1.38.0 要求 Dart `^3.14.0` / Flutter `>=3.50.0`。
  上游再往前跑,这套适配就需要跟着升级 Flutter-OH。
