# Script para parar e limpar o Desafio 4

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "  Parando Desafio 4" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Parando serviços..." -ForegroundColor Yellow
docker-compose stop

Write-Host "Removendo containers..." -ForegroundColor Yellow
docker-compose down

Write-Host "Removendo imagens (opcional)..." -ForegroundColor Yellow
docker rmi desafio4-service-a desafio4-service-b 2>$null

Write-Host ""
Write-Host "Limpeza concluida!" -ForegroundColor Green