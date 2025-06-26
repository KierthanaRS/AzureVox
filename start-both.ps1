# Start Both Azure MCP Server and Client App
# This script starts both the Azure MCP server and the Blazor client application

Write-Host "Starting Azure MCP Server and Client App..." -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Yellow

# Start the Azure MCP Server in the background
Write-Host "1. Starting Azure MCP Server..." -ForegroundColor Cyan
Start-Process PowerShell -ArgumentList "-File", "start-azure-mcp.ps1" -WindowStyle Normal

# Wait a moment for the server to start
Write-Host "Waiting 5 seconds for MCP server to initialize..." -ForegroundColor Yellow
Start-Sleep -Seconds 5

# Start the Blazor Client App
Write-Host "2. Starting Blazor Client App..." -ForegroundColor Cyan
Start-Process PowerShell -ArgumentList "-File", "start-client.ps1" -WindowStyle Normal

Write-Host "=========================================" -ForegroundColor Yellow
Write-Host "Both applications are starting in separate windows:" -ForegroundColor Green
Write-Host "- Azure MCP Server: http://localhost:5008" -ForegroundColor White
Write-Host "- Blazor Client App: http://localhost:5000" -ForegroundColor White
Write-Host "=========================================" -ForegroundColor Yellow
Write-Host "Press any key to exit..." -ForegroundColor Gray
Read-Host
