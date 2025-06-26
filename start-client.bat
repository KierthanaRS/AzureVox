@echo off
echo Starting Azure MCP Client App...
echo Project path: ./src/McpTodo.ClientApp

echo Running: dotnet watch run --project src\McpTodo.ClientApp
dotnet watch run --project src\McpTodo.ClientApp

pause
