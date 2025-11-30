# FGCPD-AV2 - Projeto Docker e Microsserviços

Este repositório contém a implementação de 5 desafios práticos envolvendo Docker, Docker Compose e arquitetura de microsserviços. Os desafios demonstram desde conceitos básicos de containerização até arquiteturas distribuídas complexas com API Gateway.

## 📋 Índice

- [Desafio 1 - Containers em Rede](#desafio-1---containers-em-rede)
- [Desafio 2 - Volumes e Persistência](#desafio-2---volumes-e-persistência)
- [Desafio 3 - Docker Compose Orquestrando Serviços](#desafio-3---docker-compose-orquestrando-serviços)
- [Desafio 4 - Microsserviços Independentes](#desafio-4---microsserviços-independentes)
- [Desafio 5 - Microsserviços com API Gateway](#desafio-5---microsserviços-com-api-gateway)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Estrutura do Repositório](#estrutura-do-repositório)
- [Como Usar Este Repositório](#como-usar-este-repositório)

---

## Desafio 1 - Containers em Rede

**Objetivo:** Demonstrar comunicação entre containers através de redes Docker customizadas.

**Tecnologias:** Docker, Nginx, Alpine Linux, curl

**Conceitos explorados:**
- Criação de redes bridge customizadas
- Comunicação entre containers usando nomes (DNS interno)
- Requisições HTTP periódicas
- Isolamento de rede

**Destaques da implementação:**
- Servidor Nginx servindo conteúdo na porta 8080
- Cliente fazendo requisições automáticas a cada 5 segundos
- Logs demonstrando comunicação contínua

[📂 Ver detalhes completos](./desafio1/README.md)

---

## Desafio 2 - Volumes e Persistência

**Objetivo:** Demonstrar persistência de dados usando volumes Docker.

**Tecnologias:** Docker, SQLite, Alpine Linux

**Conceitos explorados:**
- Volumes nomeados vs bind mounts
- Persistência de dados após remoção de containers
- Múltiplos containers acessando o mesmo volume
- Gerenciamento de ciclo de vida de volumes

**Destaques da implementação:**
- Banco de dados SQLite com tabela de usuários
- Container leitor demonstrando acesso compartilhado
- Scripts SQL organizados (init.sql, setup.sh)
- Demonstração prática de persistência

[📂 Ver detalhes completos](./desafio2/README.md)

---

## Desafio 3 - Docker Compose Orquestrando Serviços

**Objetivo:** Orquestrar múltiplos serviços dependentes usando Docker Compose.

**Tecnologias:** Docker Compose, Flask, PostgreSQL, Redis

**Conceitos explorados:**
- Orquestração de múltiplos containers
- Dependências entre serviços (depends_on)
- Variáveis de ambiente e configuração
- Redes internas e isolamento
- Sistema de cache com Redis
- Persistência com volumes PostgreSQL

**Destaques da implementação:**
- API REST de contador de visitas
- Cache inteligente com expiração de 30 segundos
- Comunicação Web ↔ PostgreSQL ↔ Redis
- Endpoints bem documentados

[📂 Ver detalhes completos](./desafio3/README.md)

---

## Desafio 4 - Microsserviços Independentes

**Objetivo:** Criar microsserviços independentes que se comunicam via HTTP.

**Tecnologias:** Docker, Docker Compose, Flask, Python Requests

**Conceitos explorados:**
- Arquitetura de microsserviços
- Comunicação HTTP entre serviços
- Containerização de aplicações independentes
- APIs RESTful
- Isolamento de responsabilidades

**Destaques da implementação:**
- Service A (Produtor): API de usuários com dados mock
- Service B (Consumidor): Processa e formata dados do Service A
- Tratamento de erros de comunicação
- Variáveis de ambiente para configuração

[📂 Ver detalhes completos](./desafio4/README.md)

---

## Desafio 5 - Microsserviços com API Gateway

**Objetivo:** Implementar arquitetura com API Gateway centralizando acesso a microsserviços.

**Tecnologias:** Docker, Docker Compose, Flask, Python Requests

**Conceitos explorados:**
- Padrão API Gateway
- Roteamento e orquestração de requisições
- Ponto único de entrada
- Agregação de dados de múltiplos serviços
- Isolamento de microsserviços

**Destaques da implementação:**
- Gateway expondo endpoints /users e /orders
- Users Service (gerenciamento de usuários)
- Orders Service (gerenciamento de pedidos)
- Endpoint combinado: /users/<id>/orders
- Microsserviços não expostos externamente

[📂 Ver detalhes completos](./desafio5/README.md)

---

## 🛠️ Tecnologias Utilizadas

- **Docker** - Containerização de aplicações
- **Docker Compose** - Orquestração de múltiplos containers
- **Nginx** - Servidor web
- **Flask** - Framework web Python
- **PostgreSQL** - Banco de dados relacional
- **Redis** - Cache em memória
- **SQLite** - Banco de dados leve
- **Alpine Linux** - Distribuição Linux minimalista
- **Python Requests** - Biblioteca HTTP para comunicação entre serviços

## 📁 Estrutura do Repositório

```
FGCPD-AV2/
├── README.md                    # Este arquivo
├── desafio1/                    # Containers em Rede
│   ├── servidor/
│   │   └── Dockerfile
│   ├── cliente/
│   │   └── Dockerfile
│   ├── run.sh
│   ├── run.ps1
│   ├── stop.sh
│   ├── stop.ps1
│   └── README.md
├── desafio2/                    # Volumes e Persistência
│   ├── Dockerfile
│   ├── Dockerfile.leitor
│   ├── init.sql
│   ├── setup.sh
│   └── README.md
├── desafio3/                    # Docker Compose
│   ├── web/
│   │   ├── Dockerfile
│   │   └── app.py
│   ├── docker-compose.yml
│   └── README.md
├── desafio4/                    # Microsserviços Independentes
│   ├── service-a/
│   │   ├── Dockerfile
│   │   ├── app.py
│   │   └── requirements.txt
│   ├── service-b/
│   │   ├── Dockerfile
│   │   ├── app.py
│   │   └── requirements.txt
│   ├── docker-compose.yml
│   ├── run.sh
│   ├── run.ps1
│   ├── stop.sh
│   ├── stop.ps1
│   └── README.md
├── desafio5/                    # API Gateway
│   ├── gateway/
│   │   ├── Dockerfile
│   │   ├── app.py
│   │   └── requirements.txt
│   ├── users-service/
│   │   ├── Dockerfile
│   │   ├── app.py
│   │   └── requirements.txt
│   ├── orders-service/
│   │   ├── Dockerfile
│   │   ├── app.py
│   │   └── requirements.txt
│   ├── docker-compose.yml
│   ├── run.sh
│   ├── run.ps1
│   ├── stop.sh
│   ├── stop.ps1
│   └── README.md
└── imagens/                     # Screenshots e diagramas
    ├── desafio1-*.png
    ├── desafio2-*.png
    ├── desafio3-*.png
    ├── desafio4-*.png
    └── desafio5-*.png
```

## 🚀 Como Usar Este Repositório

Cada desafio está em sua própria pasta com:
- README.md detalhado com explicações técnicas
- Dockerfiles e configurações necessárias
- Instruções passo a passo de execução
- Demonstrações com screenshots
- Scripts de automação (.sh para Linux/Mac, .ps1 para Windows) - Apenas alguns desafios

**Para executar qualquer desafio:**

1. Clone o repositório:
```bash
git clone https://github.com/lilymtbr/FGCPD-AV2.git
cd FGCPD-AV2
```

2. Entre na pasta do desafio desejado:
```bash
cd desafio1  # ou desafio2, desafio3, desafio4, desafio5
```

3. Siga as instruções do README.md específico do desafio

**Execução rápida com scripts:**

Linux/Mac:
```bash
chmod +x run.sh
./run.sh
```

Windows PowerShell:
```powershell
.\run.ps1
```

## 📊 Progressão dos Desafios

```
Desafio 1: Containers em Rede
    ↓ (Comunicação básica)
Desafio 2: Volumes e Persistência
    ↓ (Armazenamento de dados)
Desafio 3: Docker Compose
    ↓ (Orquestração de múltiplos serviços)
Desafio 4: Microsserviços Independentes
    ↓ (Arquitetura distribuída)
Desafio 5: API Gateway
    ↓ (Padrão de design avançado)
```

## 📝 Observações

- Todos os desafios foram desenvolvidos e testados no ambiente Windows com Docker Desktop
- Cada desafio é independente e pode ser executado separadamente
- Os READMEs de cada desafio contêm explicações detalhadas de decisões técnicas e funcionamento
- Screenshots incluídos mostram saídas Windows PowerShell
- Scripts de automação facilitam a execução em diferentes sistemas operacionais (Em alguns desafios)

## 🎯 Conceitos Aprendidos

Através destes desafios, foram explorados:

1. **Fundamentos Docker:**
   - Containers e isolamento
   - Imagens e Dockerfiles
   - Redes customizadas
   - Volumes e persistência

2. **Docker Compose:**
   - Orquestração de serviços
   - Dependências (depends_on)
   - Variáveis de ambiente
   - Redes internas

3. **Microsserviços:**
   - Comunicação HTTP/REST
   - Desacoplamento de serviços
   - Padrão API Gateway
   - Agregação de dados
   - Tratamento de erros

4. **Boas Práticas:**
   - Imagens leves (Alpine)
   - Configuração via variáveis de ambiente
   - Isolamento de responsabilidades
   - Documentação clara
   - Scripts de automação

## 👨‍💻 Autora

Lisa M.

## 📄 Licença

Este projeto foi desenvolvido para fins educacionais como parte da disciplina FGCPD-AV2.