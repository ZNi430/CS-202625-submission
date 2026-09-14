$ErrorActionPreference = 'Stop'
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new()

$reportDirectory = $PSScriptRoot
$mainFile = Join-Path $reportDirectory 'main.tex'
$preferredCompiler = 'C:\Users\22086\AppData\Local\Programs\MiKTeX\miktex\bin\x64\xelatex.exe'

if (Test-Path -LiteralPath $preferredCompiler) {
    $compiler = $preferredCompiler
} else {
    $compilerCommand = Get-Command xelatex -ErrorAction SilentlyContinue
    if (-not $compilerCommand) {
        throw 'XeLaTeX was not found. Keep MiKTeX installed or add xelatex.exe to PATH.'
    }
    $compiler = $compilerCommand.Source
}

if (-not (Test-Path -LiteralPath $mainFile)) {
    throw "Report source was not found: $mainFile"
}

Push-Location $reportDirectory
try {
    Write-Host 'Running XeLaTeX pass 1...' -ForegroundColor Cyan
    & $compiler --enable-installer -synctex=1 -interaction=nonstopmode -halt-on-error 'main.tex'
    if ($LASTEXITCODE -ne 0) {
        throw "XeLaTeX pass 1 failed with exit code $LASTEXITCODE"
    }

    Write-Host 'Running XeLaTeX pass 2 for the table of contents and references...' -ForegroundColor Cyan
    & $compiler --enable-installer -synctex=1 -interaction=nonstopmode -halt-on-error 'main.tex'
    if ($LASTEXITCODE -ne 0) {
        throw "XeLaTeX pass 2 failed with exit code $LASTEXITCODE"
    }

    $pdfFile = Join-Path $reportDirectory 'main.pdf'
    if (-not (Test-Path -LiteralPath $pdfFile)) {
        throw "The compiler did not generate the expected PDF: $pdfFile"
    }

    Write-Host "PDF generated: $pdfFile" -ForegroundColor Green
} finally {
    Pop-Location
}
