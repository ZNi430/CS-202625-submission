# 钢板齐套感知智能排产系统

本项目面向船体加工车间钢板切割、零件加工、齐套配盘与动态重调度场景，建立多资源离散事件仿真模型，并采用 SA+Tabu 进行齐套感知排产优化。

## 快速启动

在当前目录执行：

```powershell
pip install -r .\backend\requirements.txt
python .\restart_server.py --skip-deps --skip-build
```

浏览器访问 `http://127.0.0.1:8000`。`frontend/dist` 已包含构建后的前端页面；修改前端源码后可执行：

```powershell
npm ci --prefix .\frontend
python .\restart_server.py --skip-deps
```

## 主要功能

- 校验并读取附件2钢板零件数据和附件3工艺用时表。
- 联合优化钢板加工顺序、N2/N5切割机分配和下游工序衔接。
- 仿真桁架、打磨、坡口、AGV、天车和有限缓存资源。
- 输出 FIFO 基线与优化方案的完工时间、齐套跨度、负载差、产能和资源利用率对比。
- 展示全资源甘特图、齐套分析、齐套看板、缓存监控和设备利用率。
- 支持机器故障、紧急插单和全局重优化三类动态重调度场景。
- 导出排程明细、实验指标和图表证据。

## 正式复现实验

正式实验使用随机种子 `20260723`、搜索迭代次数 `260` 和 SA+Tabu 主验证算法。产能优先目标为：

```text
0.40 × 总完工时间 + 0.40 × 加权平均齐套跨度 + 0.20 × 切割负载差
```

正式输入和完整输出位于提交包的 `03_赛题与输入数据` 与 `04_仿真实验举证材料` 目录。

## 核心文件

- `steel_schedule_model.py`：数据校验、工时计算、排程构造和离散事件仿真。
- `improved_optimizer.py`：SA+Tabu 优化器。
- `ga_lns_optimizer.py`、`pareto_optimizer.py`：可选对照优化器。
- `backend/main.py`：FastAPI 服务与动态重调度接口。
- `frontend/src`：React 可视化界面源码。
