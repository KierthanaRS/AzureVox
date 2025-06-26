@echo off
echo Starting Azure MCP Server...
echo Project path: ./src/AzureMcp.ServerApp/src

cd src\AzureMcp.ServerApp\src
echo Changed to directory: %CD%

echo Running: dotnet run -- server start --transport sse --port 5008
dotnet run -- server start --transport sse --port 5008

pause
