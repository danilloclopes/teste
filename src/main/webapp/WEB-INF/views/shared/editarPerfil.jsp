<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Perfil — MagicFest</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
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

        .edit-header {
            background: linear-gradient(135deg, #7c3aed, #a855f7);
            color: #fff;
            padding: 1.5rem 0;
        }

        .edit-header .container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .edit-logo {
            font-size: 1.4rem;
            font-weight: 800;
            color: #fff;
            text-decoration: none;
        }

        .edit-main {
            max-width: 540px;
            margin: 3rem auto;
            padding: 0 1.25rem;
        }

        .edit-card {
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 4px 24px rgba(0, 0, 0, .08);
            padding: 2rem 2.5rem;
        }

        .edit-card h2 {
            font-size: 1.4rem;
            font-weight: 800;
            color: #1e1b4b;
            margin-bottom: 1.75rem;
        }

        .alert-error {
            background: #fee2e2;
            color: #991b1b;
            border: 1px solid #fca5a5;
            border-radius: 10px;
            padding: .8rem 1.2rem;
            margin-bottom: 1.25rem;
            font-weight: 600;
            font-size: .9rem;
        }

        .field {
            margin-bottom: 1.25rem;
        }

        .field label {
            display: block;
            font-weight: 700;
            color: #374151;
            margin-bottom: .4rem;
            font-size: .9rem;
        }

        .field input {
            width: 100%;
            padding: .65rem 1rem;
            border: 1.5px solid #d1d5db;
            border-radius: 10px;
            font-size: .95rem;
            box-sizing: border-box;
            font-family: inherit;
            transition: border-color .2s;
        }

        .field input:focus {
            outline: none;
            border-color: #7c3aed;
        }

        .field .hint {
            font-size: .8rem;
            color: #9ca3af;
            margin-top: .35rem;
        }

        .form-actions {
            display: flex;
            gap: .75rem;
            margin-top: 1.75rem;
            flex-wrap: wrap;
        }

        .form-actions .btn {
            flex: 1;
            text-align: center;
        }
    </style>
</head>

<body>

    <header class="edit-header">
        <div class="container">
            <a href="${pageContext.request.contextPath}/" class="edit-logo">🎭 MagicFest</a>
            <a href="${pageContext.request.contextPath}/usuario?acao=perfil"
                style="color:#fff;text-decoration:none;font-weight:600;font-size:.85rem;">
                ← Meu Perfil
            </a>
        </div>
    </header>

    <main class="edit-main">
        <div class="edit-card">
            <h2>✏️ Editar Perfil</h2>

            <c:if test="${not empty requestScope.erro}">
                <div class="alert-error">⚠️
                    <c:out value="${requestScope.erro}" />
                </div>
            </c:if>

            <c:choose>
                <c:when test="${not empty sessionScope.usuarioLogado}">
                    <form action="${pageContext.request.contextPath}/usuario" method="post">

                        <div class="field">
                            <label for="nome">Nome completo</label>
                            <input type="text" id="nome" name="nome"
                                value="<c:out value='${sessionScope.usuarioLogado.nome}'/>" maxlength="100"
                                required>
                        </div>

                        <div class="field">
                            <label for="email">E-mail</label>
                            <input type="email" id="email" name="email"
                                value="<c:out value='${sessionScope.usuarioLogado.email}'/>" maxlength="100"
                                required>
                        </div>

                        <div class="field">
                            <label for="senha">Nova senha</label>
                            <input type="password" id="senha" name="senha" minlength="8" maxlength="100"
                                placeholder="Deixe em branco para manter a atual">
                            <p class="hint">Mínimo de 8 caracteres. Deixe em branco para não alterar.</p>
                        </div>

                        <div class="form-actions">
                            <button type="submit" class="btn btn-primary">Salvar alterações</button>
                            <a href="${pageContext.request.contextPath}/usuario?acao=perfil"
                                class="btn btn-outline">
                                Cancelar
                            </a>
                        </div>

                    </form>
                </c:when>
                <c:otherwise>
                    <p style="color:#991b1b;font-weight:600;">Sessão expirada. Faça login novamente.</p>
                    <a href="${pageContext.request.contextPath}/login.jsp" class="btn btn-primary"
                        style="display:inline-block;margin-top:1rem;">
                        Fazer login
                    </a>
                </c:otherwise>
            </c:choose>

        </div>
    </main>

</body>

</html>