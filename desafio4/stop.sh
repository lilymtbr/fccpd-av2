#!/bin/bash
# Script para parar e limpar o Desafio 4

echo "========================================="
echo "  Parando Desafio 4"
echo "========================================="
echo ""

echo "🛑 Parando serviços..."
docker-compose stop

echo "🗑️  Removendo containers..."
docker-compose down

echo "🗑️  Removendo imagens (opcional)..."
docker rmi desafio4-service-a desafio4-service-b 2>/dev/null || true

echo ""
echo "✅ Limpeza concluída!"