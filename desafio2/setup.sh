#!/bin/sh

sqlite3 /data/banco.db < /init.sql

echo "======================================"
echo "Banco de dados criado com sucesso!"
echo "======================================"
echo ""
echo "Dados inseridos na tabela usuarios:"
echo ""
sqlite3 /data/banco.db "SELECT * FROM usuarios;"
echo ""
echo "======================================"