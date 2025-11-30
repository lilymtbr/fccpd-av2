from flask import Flask, jsonify

app = Flask(__name__)

users = [
    {"id": 1, "name": "Ana Silva", "email": "ana@email.com", "role": "Manager"},
    {"id": 2, "name": "Carlos Santos", "email": "carlos@email.com", "role": "Developer"},
    {"id": 3, "name": "Maria Oliveira", "email": "maria@email.com", "role": "Designer"},
    {"id": 4, "name": "João Costa", "email": "joao@email.com", "role": "Analyst"}
]

@app.route('/')
def home():
    return jsonify({
        "service": "Users Service",
        "status": "Online",
        "endpoints": {
            "/users": "GET - Lista todos os usuários",
            "/users/<id>": "GET - Busca usuário por ID"
        }
    })

@app.route('/users')
def get_users():
    return jsonify(users)

@app.route('/users/<int:user_id>')
def get_user(user_id):
    user = next((u for u in users if u["id"] == user_id), None)
    if user:
        return jsonify(user)
    return jsonify({"error": "Usuário não encontrado"}), 404

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001)

