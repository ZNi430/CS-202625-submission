# CS-202625 最终提交包说明

## 提交内容

- `01_技术报告`：最终 PDF、LaTeX 源文件、报告数据与全部插图。
- `02_算法与仿真程序`：排产模型、优化算法、FastAPI 后端、React 前端源码及已构建页面。
- `03_赛题与输入数据`：赛题说明、流程图、附件 2 钢板零件数据与附件 3 工艺用时表。
- `04_仿真实验举证材料`：固定实验的 CSV、JSON、PNG 和 Web 系统截图。

## 快速运行

在 `02_算法与仿真程序` 目录打开 PowerShell：

```powershell
pip install -r .\backend\requirements.txt
python .\restart_server.py --skip-deps --skip-build
```

浏览器访问 `http://127.0.0.1:8000`。如需修改前端源码后重新构建，先安装 Node.js，再执行：

```powershell
npm ci --prefix .\frontend
python .\restart_server.py --skip-deps
```

## 正式实验口径

- 随机种子：`20260723`
- 搜索迭代次数：`260`
- 主验证算法：`SA+Tabu`
- 产能优先权重：总完工时间 `0.40`、齐套跨度 `0.40`、切割负载差 `0.20`
- 所有正式指标以 `04_仿真实验举证材料` 内的 `summary.json` 和对应 CSV 为准。

## 提交前人工检查

技术报告封面的申报单位、申报人、团队成员、指导教师和联系电话目前保留为“待填写”。参赛团队获得准确信息后，应修改 `01_技术报告/LaTeX源文件/report_data.tex` 并重新编译 PDF。

