# `harmony/toolchain/agc/` —— 用脚本驱动 AGC 控制台

AGC(AppGallery Connect)的控制台是纯前端,没有开放 API 给「调试证书 / Profile /
设备白名单」这套流程(至少没有能免登录的)。手工点也就三五分钟,但**每次换设备、
每次换证书都要重来一遍**,容易漏步骤。

这个目录里是一个用 **Chrome DevTools Protocol** 驱动控制台的脚本,
把「加设备 → 编辑 Profile 白名单 → 下载 .p7b」这种重复动作变成一条命令。

## 前置条件

1. 一个开着 AGC 页面的 Chrome,带 `--remote-debugging-port=9333`:

   ```bash
   /root/.cache/ms-playwright/chromium-*/chrome-linux64/chrome \
       --remote-debugging-port=9333 --no-sandbox \
       --user-data-dir=/root/.chrome-agc 'https://developer.huawei.com/consumer/cn/hdc-console/'
   ```

   > 用独立的 `--user-data-dir`,别把日常浏览的 profile 弄脏。

2. **浏览器里已经登录华为账号** —— 脚本只操作页面,不处理登录。

3. Python 依赖:`pip install websocket-client`。

## 控制台的结构(为什么脚本要分 top / iframe)

| 位置 | 内容 |
|---|---|
| 顶层文档 | 左侧菜单(开发者管理 / 设备 / Profile / 凭证 …) |
| `#mainIframeView` iframe | 真正的业务内容,路由形如 `.../amp/?_=xxx#/permission/deviceManage` |

所以命令分两组:`top ...` 操作左侧菜单,`iframe ...` 操作业务内容。

## 常用命令

```bash
# 列出左侧菜单
python3 agc_console.py top menus

# 点进「设备」页
python3 agc_console.py top click 设备

# 看当前页面的文字 / 按钮 / 输入框
python3 agc_console.py iframe text
python3 agc_console.py iframe buttons
python3 agc_console.py iframe inputs

# 点「添加设备」→ 填名称和 UDID → 提交
python3 agc_console.py iframe click 添加设备
python3 agc_console.py iframe filld 0 "Pura X Max"
python3 agc_console.py iframe filld 2 "$UDID"
python3 agc_console.py iframe clickd 提交

# 给现有 Profile 扩设备白名单
python3 agc_console.py top click Profile
python3 agc_console.py iframe clickcontains 编辑设备
python3 agc_console.py iframe clickd 确认修改

# 下载(默认落到 /root/agc_dl,浏览器实际会落到 ~/Downloads,记得拷)
python3 agc_console.py dl

# 截图,用来肉眼确认页面状态
python3 agc_console.py iframe shot /root/agc.png
```

## 注意事项

- **`el-dialog` 里的输入框要用 `filld`**,`fill` 只会填到页面上第 N 个可见输入框
  (搜索框、翻页框会排前面)。
- 弹出来的 `el-message-box`(比如「profile内容已更新,请重新下载并更新软件包」)
  要单独点掉,否则后面的对话框会盖在上面。
- 触发下载后文件不一定落在指定目录 —— Chrome 可能按自己的设置落到 `~/Downloads`,
  下载后用 `ls -lt ~/Downloads | head` 确认一下。
- 每一步之后都建议 `iframe text` 看一眼,确认状态符合预期再往下走。
