#!/bin/bash
# Script para executar o Desafio 1

set -e  # Para o script se houver erro

echo "========================================="
echo "  Iniciando Desafio 1 - Containers em Rede"
echo "========================================="
echo ""

# Limpeza (caso já existam)
echo "🧹 Limpando containers e rede anteriores..."
docker rm -f servidor cliente 2>/dev/null || true
docker network rm rede-desafio1 2>/dev/null || true
echo ""

# Criar rede
echo "Criando rede Docker..."
docker network create rede-desafio1
echo ""

# Buildar imagens
echo "Construindo imagens Docker..."
docker build -t servidor-web ./servidor
docker build -t cliente-web ./cliente
echo ""

# Rodar containers
echo "Iniciando containers..."
docker run -d --name servidor --network rede-desafio1 -p 8080:8080 servidor-web
docker run -d --name cliente --network rede-desafio1 cliente-web
echo ""

# Mostrar status
echo "Containers iniciados com sucesso!"
echo ""
echo "Status dos containers:"
docker ps --filter "name=servidor" --filter "name=cliente"
echo ""

# Mostrar logs
echo "Logs do cliente (Ctrl+C para sair):"
echo "========================================="
docker logs -f cliente