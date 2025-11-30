from flask import Flask, jsonify

app = Flask(__name__)

orders = [
    {"id": 1, "user_id": 1, "product": "Notebook", "amount": 3500.00, "status": "Entregue"},
    {"id": 2, "user_id": 2, "product": "Mouse", "amount": 50.00, "status": "Processando"},
    {"id": 3, "user_id": 1, "product": "Teclado", "amount": 200.00, "status": "Enviado"},
    {"id": 4, "user_id": 3, "product": "Monitor", "amount": 800.00, "status": "Entregue"},
    {"id": 5, "user_id": 4, "product": "Webcam", "amount": 300.00, "status": "Processando"}
]

@app.route('/')
def home():
    return jsonify({
        "service": "Orders Service",
        "status": "Online",
        "endpoints": {
            "/orders": "GET - Lista todos os pedidos",
            "/orders/<id>": "GET - Busca pedido por ID",
            "/orders/user/<user_id>": "GET - Busca pedidos por usuário"
        }
    })

@app.route('/orders')
def get_orders():
    return jsonify(orders)

@app.route('/orders/<int:order_id>')
def get_order(order_id):
    order = next((o for o in orders if o["id"] == order_id), None)
    if order:
        return jsonify(order)
    return jsonify({"error": "Pedido não encontrado"}), 404

@app.route('/orders/user/<int:user_id>')
def get_orders_by_user(user_id):
    user_orders = [o for o in orders if o["user_id"] == user_id]
    return jsonify(user_orders)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5002)