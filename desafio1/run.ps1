# Script para executar o Desafio 1
# PowerShell Version

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "  Iniciando Desafio 1 - Containers em Rede" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

# Limpeza
Write-Host "Limpando containers e rede anteriores..." -ForegroundColor Yellow
docker rm -f servidor cliente 2>$null
docker network rm rede-desafio1 2>$null
Write-Host ""

# Criar rede
Write-Host "Criando rede Docker..." -ForegroundColor Green
docker network create rede-desafio1
Write-Host ""

# Buildar imagens
Write-Host "Construindo imagens Docker..." -ForegroundColor Green
docker build -t servidor-web ./servidor
docker build -t cliente-web ./cliente
Write-Host ""

# Rodar containers
Write-Host "Iniciando containers..." -ForegroundColor Green
docker run -d --name servidor --network rede-desafio1 -p 8080:8080 servidor-web
docker run -d --name cliente --network rede-desafio1 cliente-web
Write-Host ""

# Mostrar status
Write-Host "Containers iniciados com sucesso!" -ForegroundColor Green
Write-Host ""
Write-Host "Status dos containers:" -ForegroundColor Cyan
docker ps --filter "name=servidor" --filter "name=cliente"
Write-Host ""

# Mostrar logs
Write-Host "Logs do cliente (Ctrl+C para sair):" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
docker logs -f cliente