# MagicFest — Sistema de Agendamento de Personagens

Aplicação web com arquitetura desacoplada:
- **Back-end**: Java Servlets como API REST (Tomcat 9 + MySQL)
- **Front-end**: React + Vite (SPA)
- **Infraestrutura**: Docker Compose

---

## Pré-requisitos

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) — necessário para rodar com Docker
- [Node.js 20+](https://nodejs.org/) — necessário para gerar o `package-lock.json` antes do primeiro build
- [Maven 3.9+](https://maven.apache.org/) — apenas para desenvolvimento local do back-end

---

## Como rodar com Docker

### Passo 1 — Gerar o lockfile do front-end (só na primeira vez)

O Docker precisa do `package-lock.json` para instalar as dependências.
Antes do primeiro build, gere esse arquivo localmente:

```cmd
cd frontend
npm install
cd ..
```

Isso cria `frontend/package-lock.json`. Commite esse arquivo no repositório.

---

### Passo 2 — Criar o arquivo de variáveis de ambiente

```cmd
copy .env.example .env
```

O `.env` padrão já funciona para uso local — só é necessário editar para produção.

---

### Passo 3 — Subir os containers

```cmd
docker compose up --build
```

Na **primeira execução** o Docker irá:
1. Baixar as imagens base (Maven, Tomcat, Node, Nginx, MySQL) — pode demorar alguns minutos
2. Compilar o WAR Java
3. Fazer o build do React
4. Subir o MySQL e inicializar o banco com tabelas e dados de teste automaticamente

Aguarde a linha de confirmação do Tomcat:
```
magicfest-backend | ... Deployment of web application archive [...] has finished in ...ms
```

---

### Passo 4 — Acessar a aplicação

| Serviço       | URL                        |
|---------------|----------------------------|
| **Frontend**  | http://localhost:3000      |
| **API**       | http://localhost:8080/api  |
| **Health**    | http://localhost:8080/api/health → `{"status":"ok"}` |

---

### Parar os containers

```cmd
docker compose down       # para os containers, mantém os dados do banco
docker compose down -v    # para e apaga tudo, incluindo dados
```

### Rebuildar após mudanças no código

```cmd
docker compose up --build
```

---

## Desenvolvimento local (sem Docker)

### Back-end

```cmd
rem 1. Inicie um MySQL local e execute src/main/resources/script.sql
rem 2. Verifique src/main/resources/db.properties (usuário/senha/host)

mvn tomcat7:run
rem API disponível em http://localhost:8080
```

### Front-end

```cmd
cd frontend
npm install
npm run dev
rem Disponível em http://localhost:5173
rem O Vite redireciona /api automaticamente para http://localhost:8080
```

---

## API REST — Endpoints

### Autenticação

| Método | Rota                  | Body / Retorno |
|--------|-----------------------|----------------|
| POST   | `/api/auth/cadastro`  | `{ nome, email, senha, cpf }` |
| POST   | `/api/auth/login`     | `{ email, senha }` → `{ id, nome, email }` |
| POST   | `/api/auth/logout`    | — |
| GET    | `/api/auth/me`        | → `{ id, nome, email }` ou `401` |

### Agendamentos *(requer login)*

| Método | Rota                  | Body / Retorno |
|--------|-----------------------|----------------|
| GET    | `/api/agendamentos`   | → lista de agendamentos do usuário |
| POST   | `/api/agendamentos`   | `{ animadorId, dataHora }` — ex: `"2026-07-20T14:30:00"` |

### Usuário *(requer login)*

| Método | Rota                    | Body / Retorno |
|--------|-------------------------|----------------|
| GET    | `/api/usuarios/perfil`  | → `{ id, nome, email, cpf }` |
| PUT    | `/api/usuarios/perfil`  | `{ nome, email, senha }` — senha em branco mantém a atual |

### Animadores *(requer login)*

| Método | Rota               | Retorno |
|--------|--------------------|---------|
| GET    | `/api/animadores`  | → lista de animadores com nome e personagem |

### Health check

| Método | Rota           | Retorno |
|--------|----------------|---------|
| GET    | `/api/health`  | `{"status":"ok"}` |

---

## Testando a API com Bruno

### Instalação

Baixe em https://www.usebruno.com/ e instale normalmente.

---

### Configuração inicial

1. Abra o Bruno → clique em **Create Collection** → nome: `MagicFest API` → escolha uma pasta
2. Com a coleção criada, clique na **engrenagem (⚙️)** dela → **Environments** → **+ New Environment**
   - Nome: `local`
   - Adicione a variável:
     ```
     baseUrl   →   http://localhost:8080
     ```
   - Clique no ambiente `local` para ativá-lo (fica destacado)
3. Nas configurações da coleção, certifique-se de que **Send Cookies** está habilitado — isso mantém a sessão entre requisições

---

### Criando as requisições (na ordem)

#### 1. Health check
```
Método: GET
URL:    {{baseUrl}}/api/health
```
Esperado: `200` → `{"status":"ok"}`

---

#### 2. Cadastro
```
Método: POST
URL:    {{baseUrl}}/api/auth/cadastro
Header: Content-Type: application/json
Body:
{
  "nome": "Teste Bruno",
  "email": "teste@bruno.com",
  "senha": "minhasenha",
  "cpf": "98765432100"
}
```
Esperado: `201` → `{"message":"Conta criada com sucesso"}`

---

#### 3. Login
```
Método: POST
URL:    {{baseUrl}}/api/auth/login
Header: Content-Type: application/json
Body:
{
  "email": "teste@bruno.com",
  "senha": "minhasenha"
}
```
Esperado: `200` → `{"id":..., "nome":"Teste Bruno", "email":"..."}`

> Após esse request, o Bruno armazena o cookie `JSESSIONID` automaticamente.
> Todas as requisições seguintes já estarão autenticadas.

---

#### 4. Verificar sessão ativa
```
Método: GET
URL:    {{baseUrl}}/api/auth/me
```
Esperado: `200` com os dados do usuário logado.
Se retornar `401`, o cookie não está sendo enviado — verifique o passo 3 da configuração.

---

#### 5. Listar animadores
```
Método: GET
URL:    {{baseUrl}}/api/animadores
```
Esperado: `200` → array com os animadores pré-cadastrados, cada um com `id`, `usuario.nome` e `personagem.nome`.
Guarde um `id` para usar no próximo passo.

---

#### 6. Criar agendamento
```
Método: POST
URL:    {{baseUrl}}/api/agendamentos
Header: Content-Type: application/json
Body:
{
  "animadorId": 1,
  "dataHora": "2026-08-15T14:00:00"
}
```
Esperado: `201` → `{"message":"Agendamento criado com sucesso"}`

**Teste de conflito:** envie a mesma requisição novamente — deve retornar `400` com `"O animador já está ocupado no horário requisitado."`

---

#### 7. Listar meus agendamentos
```
Método: GET
URL:    {{baseUrl}}/api/agendamentos
```
Esperado: `200` → array com o agendamento criado acima, incluindo status `PENDENTE`.

---

#### 8. Ver perfil
```
Método: GET
URL:    {{baseUrl}}/api/usuarios/perfil
```
Esperado: `200` → `{ id, nome, email, cpf }` (senha **não** aparece — protegida no servidor)

---

#### 9. Atualizar perfil
```
Método: PUT
URL:    {{baseUrl}}/api/usuarios/perfil
Header: Content-Type: application/json
Body:
{
  "nome": "Nome Atualizado",
  "email": "teste@bruno.com",
  "senha": ""
}
```
> `"senha": ""` mantém a senha atual. Preencha para trocar.

Esperado: `200` → `{"message":"Perfil atualizado com sucesso"}`

---

#### 10. Logout
```
Método: POST
URL:    {{baseUrl}}/api/auth/logout
```
Esperado: `200` → `{"message":"Logout realizado"}`

Após o logout, `GET /api/auth/me` deve retornar `401`.

---

### Tabela de verificação rápida

| Cenário | Resultado esperado |
|---|---|
| `GET /api/health` sem estar logado | `200 {"status":"ok"}` |
| `GET /api/agendamentos` sem login | `401 {"error":"Não autorizado"}` |
| Login com `joao.silva@gmail.com` / senha `123` | `200` com dados do usuário |
| POST agendamento com `animadorId` inválido (ex: `999`) | `400` com mensagem de erro |
| POST agendamento no mesmo horário do mesmo animador | `400 "O animador já está ocupado..."` |

---

## Hospedagem

### Front-end — GitHub Pages (automático)

O workflow `.github/workflows/frontend-deploy.yml` faz o deploy automaticamente
em cada push para `main` que altere arquivos dentro de `frontend/`.

**Configuração:**

1. Vá em **Settings → Pages** do repositório
2. Defina a fonte como branch `gh-pages`
3. Vá em **Settings → Secrets → Actions** e crie:
   ```
   VITE_API_URL = https://URL_DO_SEU_BACKEND/api
   ```
4. Faça um push para `main` — o Action iniciará automaticamente

> O front-end usa `HashRouter`, então URLs como `/#/dashboard` funcionam
> corretamente no GitHub Pages sem configuração extra.

### Back-end — opções gratuitas

| Plataforma  | Observação                                                 |
|-------------|------------------------------------------------------------|
| **Render**  | Suporte a Docker, plano free disponível, cold start ~30s   |
| **Railway** | Deploy via Dockerfile, free tier com limite mensal         |
| **Fly.io**  | Deploy com `fly deploy`, plano free com 3 VMs              |

Para qualquer plataforma, configure as variáveis de ambiente:

```
DB_URL          = jdbc:mysql://<host>:<port>/agendamento_db?useSSL=false&allowPublicKeyRetrieval=true
DB_USER         = <usuario>
DB_PASSWORD     = <senha>
FRONTEND_ORIGIN = https://<seu-usuario>.github.io
```

---

## Estrutura do projeto

```
.
├── src/                        # Back-end Java (Maven WAR)
│   └── main/java/.../
│       ├── controller/         # Servlets REST (/api/*)
│       ├── filter/             # AuthFilter (CORS + autenticação)
│       ├── model/
│       │   ├── dao/
│       │   ├── entity/
│       │   ├── enums/
│       │   └── service/
│       └── util/               # ConnectionFactory, JsonUtil, PasswordHash
├── frontend/                   # Front-end React
│   ├── src/
│   │   ├── components/         # Header, Footer, ProtectedRoute
│   │   ├── context/            # AuthContext
│   │   ├── pages/              # Home, Login, Cadastro, Dashboard…
│   │   └── services/api.js     # Wrapper do Fetch API
│   ├── Dockerfile
│   └── nginx.conf
├── docker-compose.yml
├── docker-init.sql             # Init do banco para Docker
├── Dockerfile                  # Multi-stage: Maven build → Tomcat 9
└── .github/workflows/
    └── frontend-deploy.yml     # CI/CD para GitHub Pages
```

---

## Ferramentas utilizadas

### Back-end
- Java 17 + Maven
- Tomcat 9 (javax.servlet API 4.0)
- MySQL 8.3
- Jackson Databind (serialização JSON)
- Lombok

### Front-end
- React 18 + Vite 5
- React Router DOM 6
- Fetch API com cookies de sessão

### Infraestrutura
- Docker + Docker Compose
- Nginx (serve o build do React)
- GitHub Actions (CI/CD para GitHub Pages)

---

## Dados de teste

Todos os usuários pré-cadastrados usam a senha `123`.

| E-mail                       | Animador (personagem)     |
|------------------------------|---------------------------|
| joao.silva@gmail.com         | Homem-Aranha              |
| maria.souza@yahoo.com        | Hulk                      |
| pedro.santos@hotmail.com     | Capitão América           |
| ana.oliveira@gmail.com       | Batman                    |
| carlos.pereira@yahoo.com     | Superman                  |
