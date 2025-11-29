CREATE TABLE IF NOT EXISTS usuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO usuarios (nome, email) VALUES 
    ('Jorge Soares', 'jorge@email.com'),
    ('Diego Bezerra', 'diego@email.com'),
    ('Laura Pacífico', 'laura@email.com');