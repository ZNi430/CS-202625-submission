# CS-202625 提交材料说明

## 材料组成

- `01_技术报告`：技术方案报告 PDF、LaTeX 源文件及报告插图。
- `02_算法与仿真程序`：排产模型、优化算法、FastAPI 后端、React 前端源码及已构建页面。
- `03_赛题与输入数据`：赛题说明、产线流程图、附件2钢板零件数据和附件3工艺用时表。
- `04_仿真实验举证材料`：固定随机种子实验的 CSV、JSON、PNG 和 Web 系统截图。

## 快速运行

在 `02_算法与仿真程序` 目录打开 PowerShell：

```powershell
pip install -r .\backend\requirements.txt
python .\restart_server.py --skip-deps --skip-build
```

浏览器访问 `http://127.0.0.1:8000`。如需修改前端源码并重新构建：

```powershell
npm ci --prefix .\frontend
python .\restart_server.py --skip-deps
```

## 报告编译

使用 VS Code 打开本提交包文件夹，按 `Ctrl+Shift+B` 即可重新生成技术报告 PDF。等价命令为：

```powershell
powershell -ExecutionPolicy Bypass -File .\构建技术报告.ps1
```

## 正式实验口径

- 随机种子：`20260723`
- 搜索迭代次数：`260`
- 主验证算法：`SA+Tabu`
- 产能优先权重：总完工时间 `0.40`、齐套跨度 `0.40`、切割负载差 `0.20`
- 正式指标以 `04_仿真实验举证材料` 内的 `summary.json` 和对应 CSV 为准。
