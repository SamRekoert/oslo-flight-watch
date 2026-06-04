# Joel Flight Operations Center — local launcher
# Serves the dashboard locally and opens a public Cloudflare tunnel link to send Joel.
# Press Ctrl+C to stop everything (which kills the public link).

$ErrorActionPreference = "Stop"
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $here

# Make sure cloudflared is on PATH (winget installs to Program Files)
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" +
            [System.Environment]::GetEnvironmentVariable("Path","User")

$port = 8000
Write-Host "Starting local web server on http://localhost:$port ..." -ForegroundColor Cyan
$server = Start-Process -FilePath "python" -ArgumentList "-m","http.server",$port `
            -WorkingDirectory $here -PassThru -WindowStyle Hidden

Start-Sleep -Seconds 2
Write-Host "Local preview: http://localhost:$port" -ForegroundColor Green
Write-Host ""
Write-Host "Opening public tunnel — copy the https://....trycloudflare.com link below and send it to Joel:" -ForegroundColor Yellow
Write-Host "(Keep this window open. Closing it / Ctrl+C kills the public link.)" -ForegroundColor DarkGray
Write-Host ""

try {
    cloudflared tunnel --url "http://localhost:$port"
}
finally {
    Write-Host "`nShutting down local server..." -ForegroundColor Cyan
    if ($server -and -not $server.HasExited) { Stop-Process -Id $server.Id -Force }
}
