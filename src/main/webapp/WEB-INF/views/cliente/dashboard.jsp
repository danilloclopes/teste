<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meus Agendamentos — MagicFest</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800;900&family=Poppins:wght@400;500;600;700&display=swap"
        rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800;900&family=Poppins:wght@400;500;600;700&display=swap');

        *,
        *::before,
        *::after {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --primary: #7C3AED;
            --primary-light: #A78BFA;
            --primary-dark: #5B21B6;
            --secondary: #F59E0B;
            --secondary-light: #FCD34D;
            --accent: #EC4899;
            --accent-light: #F9A8D4;
            --bg-section: #F5F3FF;
            --text-dark: #1E1B4B;
            --text-medium: #4B5563;
            --text-light: #9CA3AF;
            --white: #FFFFFF;
            --border: #E9D5FF;
            --shadow: rgba(124, 58, 237, 0.12);
            --shadow-hover: rgba(124, 58, 237, 0.25);
            --radius-sm: 8px;
            --radius-md: 16px;
            --radius-lg: 24px;
            --radius-full: 9999px;
            --transition: 0.3s ease;
            --font-heading: 'Nunito', sans-serif;
            --font-body: 'Poppins', sans-serif;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            font-family: var(--font-body);
            color: var(--text-dark);
            background: var(--white);
            line-height: 1.6;
        }

        img {
            max-width: 100%;
            display: block;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        ul {
            list-style: none;
        }

        .container {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 24px;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 14px 28px;
            border-radius: var(--radius-full);
            font-family: var(--font-heading);
            font-weight: 800;
            font-size: 0.95rem;
            cursor: pointer;
            border: none;
            transition: var(--transition);
            white-space: nowrap;
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            color: var(--white);
            box-shadow: 0 4px 20px var(--shadow);
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 30px var(--shadow-hover);
        }

        .btn-outline {
            background: transparent;
            color: var(--primary);
            border: 2px solid var(--primary);
        }

        .btn-outline:hover {
            background: var(--primary);
            color: var(--white);
            transform: translateY(-2px);
        }
    </style>
    <style>
        body {
            background: #f4f7fa;
        }

        .dash-header {
            background: linear-gradient(135deg, #7c3aed, #a855f7);
            color: #fff;
            padding: 1.5rem 0;
        }

        .dash-header .container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .dash-logo {
            font-size: 1.4rem;
            font-weight: 800;
            color: #fff;
            text-decoration: none;
        }

        .dash-logo span {
            margin-right: .4rem;
        }

        .dash-user {
            font-size: .9rem;
            opacity: .9;
        }

        .dash-nav {
            display: flex;
            gap: .75rem;
            align-items: center;
            flex-wrap: wrap;
        }

        .dash-nav a,
        .dash-nav button {
            padding: .45rem 1rem;
            border-radius: 8px;
            font-size: .85rem;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            border: none;
        }

        .btn-dash-outline {
            border: 1.5px solid rgba(255, 255, 255, .6) !important;
            color: #fff;
            background: transparent;
        }

        .btn-dash-outline:hover {
            background: rgba(255, 255, 255, .12);
        }

        .btn-dash-filled {
            background: #fff;
            color: #7c3aed;
        }

        .btn-dash-filled:hover {
            background: #f3e8ff;
        }

        .btn-dash-danger {
            background: rgba(239, 68, 68, .15);
            color: #fca5a5;
            border: 1.5px solid rgba(239, 68, 68, .4) !important;
        }

        .btn-dash-danger:hover {
            background: rgba(239, 68, 68, .3);
        }

        .dash-main {
            max-width: 900px;
            margin: 2.5rem auto;
            padding: 0 1.25rem;
        }

        .dash-title {
            font-size: 1.5rem;
            font-weight: 800;
            color: #1e1b4b;
            margin-bottom: 1.5rem;
        }

        .alert-success {
            background: #dcfce7;
            color: #166534;
            border: 1px solid #86efac;
            border-radius: 10px;
            padding: .8rem 1.2rem;
            margin-bottom: 1.5rem;
            font-weight: 600;
            font-size: .9rem;
        }

        .empty-state {
            text-align: center;
            padding: 3rem 1rem;
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 2px 12px rgba(0, 0, 0, .06);
        }

        .empty-state .empty-icon {
            font-size: 3.5rem;
            margin-bottom: 1rem;
        }

        .empty-state h3 {
            color: #374151;
            margin-bottom: .5rem;
        }

        .empty-state p {
            color: #6b7280;
            font-size: .9rem;
            margin-bottom: 1.5rem;
        }

        .agendamento-card {
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 2px 12px rgba(0, 0, 0, .06);
            padding: 1.25rem 1.5rem;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 1.25rem;
            flex-wrap: wrap;
        }

        .ag-icon {
            font-size: 2.5rem;
            flex-shrink: 0;
        }

        .ag-info {
            flex: 1;
            min-width: 200px;
        }

        .ag-personagem {
            font-size: 1rem;
            font-weight: 700;
            color: #1e1b4b;
            margin-bottom: .2rem;
        }

        .ag-animador {
            font-size: .82rem;
            color: #6b7280;
            margin-bottom: .4rem;
        }

        .ag-data {
            font-size: .85rem;
            color: #374151;
            font-weight: 600;
        }

        .ag-status {
            padding: .3rem .8rem;
            border-radius: 99px;
            font-size: .75rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: .04em;
            flex-shrink: 0;
        }

        .status-PENDENTE {
            background: #fef9c3;
            color: #854d0e;
        }

        .status-CONTRATADO {
            background: #dcfce7;
            color: #166534;
        }

        .status-CANCELADO {
            background: #fee2e2;
            color: #991b1b;
        }

        .status-CONCLUIDO {
            background: #e0e7ff;
            color: #3730a3;
        }
    </style>
</head>

<body>

    <header class="dash-header">
        <div class="container">
            <a href="${pageContext.request.contextPath}/" class="dash-logo">
                <span>🎭</span>MagicFest
            </a>
            <span class="dash-user">
                Olá, <strong>${sessionScope.usuarioLogado.nome}</strong>!
            </span>
            <nav class="dash-nav">
                <a href="${pageContext.request.contextPath}/agendamento?acao=agendar" class="btn-dash-filled">+
                    Novo Agendamento</a>
                <a href="${pageContext.request.contextPath}/usuario?acao=perfil" class="btn-dash-outline">Meu
                    Perfil</a>
                <form action="${pageContext.request.contextPath}/auth" method="post" style="margin:0;">
                    <input type="hidden" name="acao" value="logout">
                    <button type="submit" class="btn-dash-danger">Sair</button>
                </form>
            </nav>
        </div>
    </header>

    <main class="dash-main">
        <h1 class="dash-title">📅 Meus Agendamentos</h1>

        <c:if test="${not empty param.sucesso}">
            <div class="alert-success">✅ Agendamento realizado com sucesso!</div>
        </c:if>

        <c:choose>
            <c:when test="${empty requestScope.agendamentos}">
                <div class="empty-state">
                    <div class="empty-icon">🎉</div>
                    <h3>Nenhum agendamento ainda</h3>
                    <p>Que tal reservar um personagem incrível para sua próxima festa?</p>
                    <a href="${pageContext.request.contextPath}/agendamento?acao=agendar"
                        class="btn btn-primary">
                        Fazer meu primeiro agendamento
                    </a>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="ag" items="${requestScope.agendamentos}">
                    <div class="agendamento-card">
                        <div class="ag-icon">🎭</div>
                        <div class="ag-info">
                            <div class="ag-personagem">${ag.animador.personagem.nome}</div>
                            <div class="ag-animador">Animador: ${ag.animador.usuario.nome}</div>
                            <div class="ag-data">📅 ${ag.dataHora}</div>
                        </div>
                        <span class="ag-status status-${ag.status}">${ag.status}</span>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </main>

</body>

</html>