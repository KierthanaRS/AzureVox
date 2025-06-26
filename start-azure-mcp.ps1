# Start Azure MCP Server Script
# This script starts the Azure MCP server with SSE transport

Write-Host "Starting Azure MCP Server..." -ForegroundColor Green

# Function to load environment variables from .env file
function Load-EnvFile {
    param([string]$EnvFilePath)
    
    if (Test-Path $EnvFilePath) {
        Write-Host "Loading environment variables from: $EnvFilePath" -ForegroundColor Yellow
        
        Get-Content $EnvFilePath | ForEach-Object {
            if ($_ -match "^\s*([^#][^=]*)\s*=\s*(.*)\s*$") {
                $name = $matches[1].Trim()
                $value = $matches[2].Trim()
                
                # Remove quotes if present
                if ($value -match "^[`"'](.*)[`"']$") {
                    $value = $matches[1]
                }
                
                Set-Item -Path "env:$name" -Value $value
                Write-Host "  $name = $value" -ForegroundColor Gray
            }
        }
        return $true
    } else {
        Write-Host "Warning: .env file not found at: $EnvFilePath" -ForegroundColor Yellow
        return $false
    }
}

# Try to load .env file from current directory or root
$envLoaded = $false
$envPaths = @(".\.env", ".\env", ".env")

foreach ($envPath in $envPaths) {
    if (Load-EnvFile $envPath) {
        $envLoaded = $true
        break
    }
}

if (-not $envLoaded) {
    Write-Host "No environment variables loaded. Ensure .env file exists." -ForegroundColor Red
    exit 1
}

Write-Host "Azure Subscription ID: $env:AZURE_SUBSCRIPTION_ID" -ForegroundColor Cyan
Write-Host "Azure Tenant ID: $env:AZURE_TENANT_ID" -ForegroundColor Cyan

# Use the correct path to the project directory
$projectPath = "./src/AzureMcp.ServerApp/src"

Write-Host "Project path: $projectPath" -ForegroundColor Yellow
Write-Host "Starting server with command: dotnet run --project $projectPath -- server start --transport sse --port 5008" -ForegroundColor Cyan

# Change to the project directory and run the server
Push-Location $projectPath
try {
    Write-Host "Changed to directory: $(Get-Location)" -ForegroundColor Yellow
    
    # Start the Azure MCP server
    dotnet run -- server start --transport sse --port 5008
    
} catch {
    Write-Host "Error starting the server: $($_.Exception.Message)" -ForegroundColor Red
} finally {
    # Return to the original directory
    Pop-Location
}
