@echo off
chcp 65001 >nul
setlocal
set "CFG=%APPDATA%\ScrcpyDeX"
if not exist "%CFG%" mkdir "%CFG%"
set "FILE=%CFG%\settings.json"

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$p = Join-Path $env:APPDATA 'ScrcpyDeX\settings.json'; $dir = Split-Path $p -Parent; if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }; if (Test-Path $p) { try { $j = Get-Content -Raw -Encoding UTF8 $p | ConvertFrom-Json } catch { $j = [pscustomobject]@{ version = '1.1' } } } else { $j = [pscustomobject]@{ version = '1.1' } }; $j | Add-Member -NotePropertyName language -NotePropertyValue 'zh-Hans' -Force; ($j | ConvertTo-Json -Depth 20) | Set-Content -Encoding UTF8 $p; Write-Host ('OK: language=zh-Hans -> ' + $p)"

if errorlevel 1 (
  echo [失败] 写入配置失败。可手动把 for-existing-install\settings.json 复制到 %%APPDATA%%\ScrcpyDeX\settings.json
  pause
  exit /b 1
)

echo.
echo [完成] 已将语言设为 zh-Hans
echo 配置文件: %FILE%
echo 请完全退出 ScrcpyDeX 后重新打开。
echo.
pause
