$ErrorActionPreference = 'Stop'
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new()

$sourceDirectory = Join-Path $PSScriptRoot '01_技术报告\LaTeX源文件'
$buildScript = Join-Path $sourceDirectory 'build-report.ps1'
$generatedPdf = Join-Path $sourceDirectory 'main.pdf'
$submissionPdf = Join-Path $PSScriptRoot '01_技术报告\船体加工车间智能排产与齐套配盘优化调度技术方案报告.pdf'

if (-not (Test-Path -LiteralPath $buildScript)) {
    throw "未找到报告构建脚本：$buildScript"
}

& $buildScript

if (-not (Test-Path -LiteralPath $generatedPdf)) {
    throw "构建完成后未找到 PDF：$generatedPdf"
}

Copy-Item -LiteralPath $generatedPdf -Destination $submissionPdf -Force
Write-Host "最终 PDF 已更新：$submissionPdf" -ForegroundColor Green
