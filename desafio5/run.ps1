# Script para executar o Desafio 5
# PowerShell Version

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "  Iniciando Desafio 5 - API Gateway" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

# Limpeza
Write-Host "Limpando containers e rede anteriores..." -ForegroundColor Yellow
docker-compose down 2>$null
Write-Host ""

# Subir serviços
Write-Host "Subindo serviços..." -ForegroundColor Green
docker-compose up -d --build
Write-Host ""

# Aguardar serviços iniciarem
Write-Host "Aguardando serviços iniciarem..." -ForegroundColor Yellow
Start-Sleep -Seconds 5
Write-Host ""

# Mostrar status
Write-Host "Serviços iniciados com sucesso!" -ForegroundColor Green
Write-Host ""
Write-Host "Status dos serviços:" -ForegroundColor Cyan
docker-compose ps
Write-Host ""

# Testar endpoints
Write-Host "Testando endpoints do Gateway..." -ForegroundColor Cyan
Write-Host ""

Write-Host "Gateway (/):" -ForegroundColor Yellow
$response = Invoke-WebRequest -Uri http://localhost:5000/ -UseBasicParsing
$response.Content | ConvertFrom-Json | ConvertTo-Json
Write-Host ""

Write-Host "Usuarios (/users):" -ForegroundColor Yellow
$response = Invoke-WebRequest -Uri http://localhost:5000/users -UseBasicParsing
$response.Content | ConvertFrom-Json | ConvertTo-Json
Write-Host ""

Write-Host "Pedidos (/orders):" -ForegroundColor Yellow
$response = Invoke-WebRequest -Uri http://localhost:5000/orders -UseBasicParsing
$response.Content | ConvertFrom-Json | ConvertTo-Json
Write-Host ""

Write-Host "Pedidos de um usuario (/users/1/orders):" -ForegroundColor Yellow
$response = Invoke-WebRequest -Uri http://localhost:5000/users/1/orders -UseBasicParsing
$response.Content | ConvertFrom-Json | ConvertTo-Json
Write-Host ""

# Informações finais
Write-Host "Para ver logs dos serviços:" -ForegroundColor Cyan
Write-Host "  docker-compose logs -f gateway" -ForegroundColor White
Write-Host "  docker-compose logs -f users-service" -ForegroundColor White
Write-Host "  docker-compose logs -f orders-service" -ForegroundColor White
Write-Host ""
Write-Host "Para parar: .\stop.ps1" -ForegroundColor Cyan