#!/bin/bash
# Script para executar o Desafio 4

set -e  # Para o script se houver erro

echo "========================================="
echo "  Iniciando Desafio 4 - Microsserviços"
echo "========================================="
echo ""

# Limpeza (caso já existam)
echo "🧹 Limpando containers e rede anteriores..."
docker-compose down 2>/dev/null || true
echo ""

# Subir serviços
echo "🚀 Subindo microsserviços..."
docker-compose up -d --build
echo ""

# Aguardar serviços iniciarem
echo "⏳ Aguardando serviços iniciarem..."
sleep 5
echo ""

# Mostrar status
echo "✅ Microsserviços iniciados com sucesso!"
echo ""
echo "📊 Status dos serviços:"
docker-compose ps
echo ""

# Testar endpoints
echo "🧪 Testando endpoints..."
echo ""
echo "Service A (/):"
curl -s http://localhost:5000/ | python3 -m json.tool
echo ""
echo "Service A (/users):"
curl -s http://localhost:5000/users | python3 -m json.tool
echo ""
echo "Service B (/):"
curl -s http://localhost:5001/ | python3 -m json.tool
echo ""
echo "Service B (/users-report):"
curl -s http://localhost:5001/users-report | python3 -m json.tool
echo ""

# Mostrar logs
echo "📋 Para ver logs dos serviços:"
echo "  docker-compose logs -f service-a"
echo "  docker-compose logs -f service-b"
echo ""
echo "🛑 Para parar: ./stop.sh"