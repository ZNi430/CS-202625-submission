# LaTeX 技术方案报告

本目录是正式技术方案报告的 LaTeX 源文件。正文以当前仓库代码和可复现实验为准，参考 Word 报告只用于章节组织和版式参考。

## 文件说明

- `main.tex`：报告正文。
- `report_data.tex`：申报信息和实验指标的单一数据源。
- `assets/`：程序生成图片和后续补充的网页截图。
- `assets/verified_capacity_summary.json`：产能优先轨道的本次复现摘要。
- `assets/verified_balanced_summary.json`：三指标平衡轨道的本次复现摘要。
- `compile.bat`：Windows 下使用 XeLaTeX 编译。
- `项目审查与收口建议.md`：内部审查清单，仅供开发收口，不纳入正式提交材料。

## 编译

本机已经安装 MiKTeX，并在仓库根目录配置了 VS Code 默认构建任务。用 VS Code 打开 `steel_process_optimize` 文件夹后，按 `Ctrl+Shift+B` 即会连续执行两次 XeLaTeX，并在本目录生成 `main.pdf`。

也可以双击 `compile.bat`。命令行等价操作：

```powershell
xelatex -interaction=nonstopmode -halt-on-error main.tex
xelatex -interaction=nonstopmode -halt-on-error main.tex
```

必须使用 XeLaTeX 或 LuaLaTeX，不建议用 pdfLaTeX 编译中文报告。

## 提交前检查

1. 在 `report_data.tex` 中填写单位、申报人、成员、指导教师和联系电话。
2. 重新运行最终算法后，用同一次运行的指标更新 `report_data.tex`。
3. 把最终运行生成的三张 PNG 放入 `assets/`。
4. 按 `assets/README.md` 的文件名补充网页与动态重排截图。
5. 连续编译两次，检查目录、表格、公式、图片和页码。
6. 最终提交 PDF，同时保留完整 LaTeX 源码。

当前目录中的 `项目审查与收口建议.md` 是内部文件；制作最终压缩包时应移出正式报告目录或明确放入“开发说明”，避免与参赛正文混淆。
