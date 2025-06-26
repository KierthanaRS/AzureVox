# Start Client App Script
# This script starts the .NET Blazor client application

Write-Host "Starting Azure MCP Client App..." -ForegroundColor Green

# Use the correct path to the client project directory
$projectPath = "./src/McpTodo.ClientApp"

Write-Host "Project path: $projectPath" -ForegroundColor Yellow
Write-Host "Starting client with command: dotnet watch run --project $projectPath" -ForegroundColor Cyan

try {
    # Start the client application with hot reload
    dotnet watch run --project $projectPath
    
} catch {
    Write-Host "Error starting the client: $($_.Exception.Message)" -ForegroundColor Red
}
