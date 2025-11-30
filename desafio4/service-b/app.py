from flask import Flask, jsonify
import requests
import os

app = Flask(__name__)

SERVICE_A_URL = os.getenv('SERVICE_A_URL', 'http://service-a:5000')

@app.route('/')
def home():
    return jsonify({
        "service": "Service B (Consumer)",
        "endpoints": {
            "/users-report": "Consome Service A e gera relatório"
        }
    })

@app.route('/users-report')
def get_report():
    try:
        response = requests.get(f"{SERVICE_A_URL}/users")
        response.raise_for_status()
        users = response.json()
        
        report = []
        for user in users:
            info = f"Usuário {user['name']} ({user['role']}) está ativo desde {user['joined_at']}"
            report.append(info)
            
        return jsonify({
            "source": "Service A",
            "total_users": len(users),
            "report": report
        })
        
    except requests.exceptions.RequestException as e:
        return jsonify({"error": "Falha ao comunicar com Service A", "details": str(e)}), 503

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001)