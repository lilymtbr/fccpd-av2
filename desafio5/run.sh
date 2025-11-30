#!/bin/bash

set -e  # Para o script se houver erro

echo "========================================="
echo "  Iniciando Desafio 5 - API Gateway"
echo "========================================="
echo ""

# Limpeza (caso já existam)
echo "🧹 Limpando containers e rede anteriores..."
docker-compose down 2>/dev/null || true
echo ""

# Subir serviços
echo "🚀 Subindo serviços..."
docker-compose up -d --build
echo ""

# Aguardar serviços iniciarem
echo "⏳ Aguardando serviços iniciarem..."
sleep 5
echo ""

# Mostrar status
echo "✅ Serviços iniciados com sucesso!"
echo ""
echo "📊 Status dos serviços:"
docker-compose ps
echo ""

# Testar endpoints
echo "🧪 Testando endpoints do Gateway..."
echo ""
echo "Gateway (/):"
curl -s http://localhost:5000/ | python3 -m json.tool
echo ""
echo "Usuários (/users):"
curl -s http://localhost:5000/users | python3 -m json.tool
echo ""
echo "Pedidos (/orders):"
curl -s http://localhost:5000/orders | python3 -m json.tool
echo ""
echo "Pedidos de um usuário (/users/1/orders):"
curl -s http://localhost:5000/users/1/orders | python3 -m json.tool
echo ""

# Informações finais
echo "📋 Para ver logs dos serviços:"
echo "  docker-compose logs -f gateway"
echo "  docker-compose logs -f users-service"
echo "  docker-compose logs -f orders-service"
echo ""
echo "🛑 Para parar: ./stop.sh"