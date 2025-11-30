from flask import Flask, jsonify, request
import requests
import os

app = Flask(__name__)

USERS_SERVICE_URL = os.getenv('USERS_SERVICE_URL', 'http://users-service:5001')
ORDERS_SERVICE_URL = os.getenv('ORDERS_SERVICE_URL', 'http://orders-service:5002')

@app.route('/')
def home():
    return jsonify({
        "service": "API Gateway",
        "version": "1.0",
        "endpoints": {
            "/users": "GET - Lista todos os usuários",
            "/users/<id>": "GET - Busca usuário por ID",
            "/orders": "GET - Lista todos os pedidos",
            "/orders/<id>": "GET - Busca pedido por ID",
            "/users/<id>/orders": "GET - Busca pedidos de um usuário específico"
        }
    })

@app.route('/users')
def get_users():
    try:
        response = requests.get(f"{USERS_SERVICE_URL}/users")
        response.raise_for_status()
        return jsonify(response.json())
    except requests.exceptions.RequestException as e:
        return jsonify({"error": "Falha ao comunicar com Users Service", "details": str(e)}), 503

@app.route('/users/<int:user_id>')
def get_user(user_id):
    try:
        response = requests.get(f"{USERS_SERVICE_URL}/users/{user_id}")
        if response.status_code == 404:
            return jsonify({"error": "Usuário não encontrado"}), 404
        response.raise_for_status()
        return jsonify(response.json())
    except requests.exceptions.RequestException as e:
        return jsonify({"error": "Falha ao comunicar com Users Service", "details": str(e)}), 503

@app.route('/orders')
def get_orders():
    try:
        response = requests.get(f"{ORDERS_SERVICE_URL}/orders")
        response.raise_for_status()
        return jsonify(response.json())
    except requests.exceptions.RequestException as e:
        return jsonify({"error": "Falha ao comunicar com Orders Service", "details": str(e)}), 503

@app.route('/orders/<int:order_id>')
def get_order(order_id):
    try:
        response = requests.get(f"{ORDERS_SERVICE_URL}/orders/{order_id}")
        if response.status_code == 404:
            return jsonify({"error": "Pedido não encontrado"}), 404
        response.raise_for_status()
        return jsonify(response.json())
    except requests.exceptions.RequestException as e:
        return jsonify({"error": "Falha ao comunicar com Orders Service", "details": str(e)}), 503

@app.route('/users/<int:user_id>/orders')
def get_user_orders(user_id):
    try:
        user_response = requests.get(f"{USERS_SERVICE_URL}/users/{user_id}")
        if user_response.status_code == 404:
            return jsonify({"error": "Usuário não encontrado"}), 404
        user_response.raise_for_status()
        user = user_response.json()
        
        orders_response = requests.get(f"{ORDERS_SERVICE_URL}/orders/user/{user_id}")
        orders_response.raise_for_status()
        orders = orders_response.json()
        
        return jsonify({
            "user": user,
            "total_orders": len(orders),
            "orders": orders
        })
    except requests.exceptions.RequestException as e:
        return jsonify({"error": "Falha ao comunicar com os serviços", "details": str(e)}), 503

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)