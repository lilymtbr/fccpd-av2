#!/bin/bash
# Script para parar e limpar o Desafio 1

echo "========================================="
echo "  Parando Desafio 1"
echo "========================================="
echo ""

echo "🛑 Parando containers..."
docker stop servidor cliente 2>/dev/null || true

echo "🗑️  Removendo containers..."
docker rm servidor cliente 2>/dev/null || true

echo "🌐 Removendo rede..."
docker network rm rede-desafio1 2>/dev/null || true

echo "🗑️  Removendo imagens..."
docker rmi servidor-web cliente-web 2>/dev/null || true

echo ""
echo "✅ Limpeza concluída!"