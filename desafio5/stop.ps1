# Script para parar e limpar o Desafio 5

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "  Parando Desafio 5" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Parando serviços..." -ForegroundColor Yellow
docker-compose stop

Write-Host "Removendo containers..." -ForegroundColor Yellow
docker-compose down

Write-Host "Removendo imagens (opcional)..." -ForegroundColor Yellow
docker rmi desafio5-gateway desafio5-users-service desafio5-orders-service 2>$null

Write-Host ""
Write-Host "Limpeza concluida!" -ForegroundColor Green