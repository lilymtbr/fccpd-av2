#!/bin/bash
# Script para parar e limpar o Desafio 5

echo "========================================="
echo "  Parando Desafio 5"
echo "========================================="
echo ""

echo "🛑 Parando serviços..."
docker-compose stop

echo "🗑️  Removendo containers..."
docker-compose down

echo "🗑️  Removendo imagens (opcional)..."
docker rmi desafio5-gateway desafio5-users-service desafio5-orders-service 2>/dev/null || true

echo ""
echo "✅ Limpeza concluída!"