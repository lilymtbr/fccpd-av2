from flask import Flask, jsonify

app = Flask(__name__)

users_db = [
    {"id": 1, "name": "Alice Wonder", "joined_at": "2023-01-15", "role": "Admin"},
    {"id": 2, "name": "Bob Builder", "joined_at": "2023-03-10", "role": "Editor"},
    {"id": 3, "name": "Charlie Brown", "joined_at": "2023-05-22", "role": "Viewer"}
]

@app.route('/')
def home():
    return jsonify({"service": "Service A (Users)", "status": "Online"})

@app.route('/users')
def get_users():
    return jsonify(users_db)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)