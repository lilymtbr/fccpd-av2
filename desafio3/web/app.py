from flask import Flask, jsonify
import psycopg2
import redis
import os

app = Flask(__name__)

DB_HOST = os.getenv('DB_HOST', 'db')
DB_NAME = os.getenv('DB_NAME', 'contador_db')
DB_USER = os.getenv('DB_USER', 'postgres')
DB_PASS = os.getenv('DB_PASS', 'senha123')

REDIS_HOST = os.getenv('REDIS_HOST', 'cache')

r = redis.Redis(host=REDIS_HOST, port=6379, decode_responses=True)

def get_db_connection():
    conn = psycopg2.connect(
        host=DB_HOST,
        database=DB_NAME,
        user=DB_USER,
        password=DB_PASS
    )
    return conn

@app.route('/')
def home():
    return jsonify({
        "message": "API de Contador de Visitas",
        "endpoints": {
            "/visitas": "GET - Retorna número de visitas",
            "/incrementar": "POST - Incrementa contador"
        }
    })

@app.route('/visitas')
def get_visitas():
    cached = r.get('visitas')
    if cached:
        return jsonify({"visitas": int(cached), "source": "cache"})
    
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT count FROM visitas WHERE id = 1')
    result = cur.fetchone()
    cur.close()
    conn.close()
    
    visitas = result[0] if result else 0
    
    r.setex('visitas', 30, visitas)
    
    return jsonify({"visitas": visitas, "source": "database"})

@app.route('/incrementar', methods=['POST'])
def incrementar():
    conn = get_db_connection()
    cur = conn.cursor()
    
    cur.execute('''
        CREATE TABLE IF NOT EXISTS visitas (
            id INTEGER PRIMARY KEY,
            count INTEGER NOT NULL
        )
    ''')
    
    cur.execute('''
        INSERT INTO visitas (id, count) VALUES (1, 1)
        ON CONFLICT (id) DO UPDATE SET count = visitas.count + 1
    ''')
    
    conn.commit()
    cur.close()
    conn.close()

    r.delete('visitas')
    
    return jsonify({"message": "Contador incrementado!"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)