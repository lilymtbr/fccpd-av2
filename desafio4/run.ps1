# Script para executar o Desafio 4
# PowerShell Version

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "  Iniciando Desafio 4 - Microsserviços" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

# Limpeza
Write-Host "Limpando containers e rede anteriores..." -ForegroundColor Yellow
docker-compose down 2>$null
Write-Host ""

# Subir serviços
Write-Host "Subindo microsserviços..." -ForegroundColor Green
docker-compose up -d --build
Write-Host ""

# Aguardar serviços iniciarem
Write-Host "Aguardando serviços iniciarem..." -ForegroundColor Yellow
Start-Sleep -Seconds 5
Write-Host ""

# Mostrar status
Write-Host "Microsserviços iniciados com sucesso!" -ForegroundColor Green
Write-Host ""
Write-Host "Status dos serviços:" -ForegroundColor Cyan
docker-compose ps
Write-Host ""

# Testar endpoints
Write-Host "Testando endpoints..." -ForegroundColor Cyan
Write-Host ""

Write-Host "Service A (/):" -ForegroundColor Yellow
$response = Invoke-WebRequest -Uri http://localhost:5000/ -UseBasicParsing
$response.Content | ConvertFrom-Json | ConvertTo-Json
Write-Host ""

Write-Host "Service A (/users):" -ForegroundColor Yellow
$response = Invoke-WebRequest -Uri http://localhost:5000/users -UseBasicParsing
$response.Content | ConvertFrom-Json | ConvertTo-Json
Write-Host ""

Write-Host "Service B (/):" -ForegroundColor Yellow
$response = Invoke-WebRequest -Uri http://localhost:5001/ -UseBasicParsing
$response.Content | ConvertFrom-Json | ConvertTo-Json
Write-Host ""

Write-Host "Service B (/users-report):" -ForegroundColor Yellow
$response = Invoke-WebRequest -Uri http://localhost:5001/users-report -UseBasicParsing
$response.Content | ConvertFrom-Json | ConvertTo-Json
Write-Host ""

# Informações finais
Write-Host "Para ver logs dos serviços:" -ForegroundColor Cyan
Write-Host "  docker-compose logs -f service-a" -ForegroundColor White
Write-Host "  docker-compose logs -f service-b" -ForegroundColor White
Write-Host ""
Write-Host "Para parar: .\stop.ps1" -ForegroundColor Cyan