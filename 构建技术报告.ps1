$ErrorActionPreference = 'Stop'
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new()

$buildScript = Get-ChildItem -LiteralPath $PSScriptRoot -Recurse -File -Filter 'build-report.ps1' |
    Select-Object -First 1

if (-not $buildScript) {
    throw 'The LaTeX build script was not found.'
}

$sourceDirectory = $buildScript.Directory.FullName
$reportDirectory = Split-Path -Parent $sourceDirectory
$generatedPdf = Join-Path $sourceDirectory 'main.pdf'
$submissionPdf = Get-ChildItem -LiteralPath $reportDirectory -File -Filter '*.pdf' |
    Select-Object -First 1

if (-not $submissionPdf) {
    throw 'The submission PDF target was not found.'
}

& $buildScript.FullName

if (-not (Test-Path -LiteralPath $generatedPdf)) {
    throw 'XeLaTeX did not generate main.pdf.'
}

Copy-Item -LiteralPath $generatedPdf -Destination $submissionPdf.FullName -Force
Write-Host ('PDF updated: ' + $submissionPdf.FullName) -ForegroundColor Green
