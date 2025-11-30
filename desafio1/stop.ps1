# Script para parar e limpar o Desafio 1

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "  Parando Desafio 1" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Parando containers..." -ForegroundColor Yellow
docker stop servidor cliente 2>$null

Write-Host "Removendo containers..." -ForegroundColor Yellow
docker rm servidor cliente 2>$null

Write-Host "Removendo rede..." -ForegroundColor Yellow
docker network rm rede-desafio1 2>$null

Write-Host "Removendo imagens..." -ForegroundColor Yellow
docker rmi servidor-web cliente-web 2>$null

Write-Host ""
Write-Host "Limpeza concluida!" -ForegroundColor Green