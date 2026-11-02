# ScrcpyDeX 简体中文版（汉化交付包）

本目录提供两种立刻可用的中文方案：

1. **推荐：自带默认简体中文的 Windows 构建**（本仓库源码改默认语言后交叉编译）
2. **已有官方 v1.1 安装：一键改配置为中文**（无需重装）

官方仓库本身已含完整 `Strings.zh-Hans.resx`（208/208 键齐全），并在右上角语言菜单提供「简体中文」。
你之前看到英文，通常是因为 **默认语言是 `en`**，或 `%AppData%\ScrcpyDeX\settings.json` 里已写入 `"language": "en"`。

---

## 方案 A：直接用本包中文默认版（推荐）

### 文件

- `ScrcpyDeX-zh-Hans-win-x64.zip`
- 解压后主程序：`ScrcpyDeX-zh-Hans-win-x64/ScrcpyDeX.exe`
- 附带：`scrcpydex-server.jar`、`stop-dex.bat`、`settings.zh-Hans.json`

### 步骤（Windows）

1. 解压 `ScrcpyDeX-zh-Hans-win-x64.zip` 到任意目录（如桌面）。
2. **若你以前跑过官方版**：先完全退出 ScrcpyDeX，再双击  
   `for-existing-install\强制简体中文.bat`  
   （避免旧 `%AppData%\ScrcpyDeX\settings.json` 里的 `"language": "en"` 覆盖默认中文）。
3. 双击 `ScrcpyDeX.exe` 启动。
4. 界面应直接为简体中文；右上角语言按钮显示 **ZH**。
5. 仍想切换语言：点右上角语言按钮 → 选 **简体中文**（会写回 settings）。

### 本构建相对官方的改动

- `LocalizationManager` 默认文化：`en` → **`zh-Hans`**
- `ScrcpyDeXSettings.Language` 默认：`en` → **`zh-Hans`**
- 主窗口语言状态默认：`EN` → **`ZH`**

> 注意：只要用户配置文件里已有 `"language": "en"`，启动时仍会读成英文。用「强制简体中文.bat」或方案 B 覆盖即可。

---

## 方案 B：官方 v1.1 一键强制中文（不换 exe）

适用于你已经下载的官方  
https://github.com/Aureliano021/ScrcpyDex/releases/download/v1.1/ScrcpyDeX.exe

### 一键脚本

1. 完全退出 ScrcpyDeX。
2. 双击：`for-existing-install\强制简体中文.bat`
3. 重新打开 ScrcpyDeX。

脚本会把：

`%AppData%\ScrcpyDeX\settings.json`

里的 `"language"` 写成 **`zh-Hans`**（没有该文件会创建）。

### 手动编辑（等价）

1. 按 `Win + R`，输入：`%AppData%\ScrcpyDeX`，回车。
2. 用记事本打开 `settings.json`（没有就新建）。
3. 确保顶层有这一行（注意逗号）：

```json
"language": "zh-Hans"
```

完整最小示例见：`for-existing-install\settings.json`。

4. 保存后重启软件。

### 应用内点击路径（官方已有菜单）

1. 打开 ScrcpyDeX。
2. 看窗口**右上角**语言切换按钮（显示 `EN` / `ZH` 等）。
3. 点击 → 选择 **简体中文**。
4. 选择后会自动保存到 `settings.json`，下次启动保持中文。

---

## 配置键说明

| 项 | 值 |
|---|---|
| 配置路径 | `%AppData%\ScrcpyDeX\settings.json` |
| 语言键 | `"language"` |
| 简体中文取值 | `"zh-Hans"`（也接受 `"zh"` / `"zh-CN"`，运行时会归一成 `zh-Hans`） |
| 官方 schema 枚举 | 文档里写过 `"zh"`；代码实际用 `zh-Hans`，二者都可用 |

---

## 界面对照表

见同目录 `UI_GLOSSARY_zh.md`（从仓库 `Strings.zh-Hans.resx` 生成）。

---

## 校验

`SHA256SUMS.txt` 含 zip 校验和。

---

## 依赖提醒

ScrcpyDeX 仍需要本机可用的 **scrcpy** / **adb**（与是否中文无关）。按官方 README 安装即可。

---

## 源码补丁（可复现）

`default-zh-Hans.patch` 是相对上游克隆的最小 diff（默认语言改成 zh-Hans）。
在干净源码树执行：

```bat
git apply default-zh-Hans.patch
```

然后按官方 `packaging/windows/build-release.ps1` 或：

```bash
dotnet publish src/ScrcpyDex.App/ScrcpyDex.App.csproj -c Release -r win-x64 --self-contained true -p:PublishSingleFile=true -o publish
```
