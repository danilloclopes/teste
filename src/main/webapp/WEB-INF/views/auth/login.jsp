<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Entrar — MagicFest</title>
    <meta name="description" content="Acesse sua conta MagicFest e gerencie seus agendamentos de personagens.">
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

        a {
            text-decoration: none;
            color: inherit;
        }

        .auth-page {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, var(--primary-dark) 0%, var(--primary) 50%, var(--accent) 100%);
            padding: 2rem 1rem;
            position: relative;
            overflow: hidden;
        }

        .auth-page::before,
        .auth-page::after {
            content: '';
            position: absolute;
            border-radius: 50%;
            opacity: .15;
        }

        .auth-page::before {
            width: 420px;
            height: 420px;
            background: var(--secondary);
            top: -120px;
            right: -100px;
        }

        .auth-page::after {
            width: 280px;
            height: 280px;
            background: var(--accent-light);
            bottom: -80px;
            left: -80px;
        }

        .auth-card {
            background: var(--white);
            border-radius: 20px;
            padding: 2.5rem 2rem;
            width: 100%;
            max-width: 440px;
            box-shadow: 0 25px 60px rgba(0, 0, 0, .25);
            position: relative;
            z-index: 1;
            animation: fadeInUp .5s ease both;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(24px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .auth-logo {
            text-align: center;
            margin-bottom: 1.75rem;
        }

        .auth-logo .logo-icon {
            font-size: 2.8rem;
            display: block;
            margin-bottom: .4rem;
        }

        .auth-logo .logo-text {
            font-family: 'Nunito', sans-serif;
            font-size: 1.6rem;
            font-weight: 900;
            background: linear-gradient(135deg, var(--primary), var(--accent));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .auth-logo .logo-sub {
            font-family: 'Poppins', sans-serif;
            font-size: .85rem;
            color: var(--text-medium);
            margin-top: .2rem;
        }

        .auth-title {
            font-family: 'Nunito', sans-serif;
            font-size: 1.4rem;
            font-weight: 800;
            color: var(--text-dark);
            text-align: center;
            margin-bottom: 1.5rem;
        }

        .alert {
            padding: .75rem 1rem;
            border-radius: 10px;
            font-family: 'Poppins', sans-serif;
            font-size: .85rem;
            margin-bottom: 1.25rem;
            display: flex;
            align-items: center;
            gap: .5rem;
        }

        .alert-error {
            background: #fef2f2;
            border: 1px solid #fecaca;
            color: #b91c1c;
        }

        .alert-success {
            background: #f0fdf4;
            border: 1px solid #bbf7d0;
            color: #15803d;
        }

        .form-group {
            margin-bottom: 1.1rem;
        }

        .form-group label {
            display: block;
            font-family: 'Poppins', sans-serif;
            font-size: .82rem;
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: .4rem;
        }

        .input-wrapper {
            position: relative;
        }

        .input-wrapper .input-icon {
            position: absolute;
            left: .9rem;
            top: 50%;
            transform: translateY(-50%);
            font-size: 1rem;
            pointer-events: none;
        }

        .form-control {
            width: 100%;
            padding: .7rem .9rem .7rem 2.4rem;
            border: 1.5px solid var(--border);
            border-radius: 10px;
            font-family: 'Poppins', sans-serif;
            font-size: .9rem;
            color: var(--text-dark);
            background: #faf9ff;
            transition: border-color .2s, box-shadow .2s;
            box-sizing: border-box;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(124, 58, 237, .12);
            background: var(--white);
        }

        .form-control.invalid {
            border-color: #ef4444;
            box-shadow: 0 0 0 3px rgba(239, 68, 68, .1);
        }

        .field-error {
            font-family: 'Poppins', sans-serif;
            font-size: .75rem;
            color: #dc2626;
            margin-top: .3rem;
            display: none;
        }

        .field-error.visible {
            display: block;
        }

        .toggle-password {
            position: absolute;
            right: .9rem;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            cursor: pointer;
            font-size: 1rem;
            padding: 0;
            color: var(--text-light);
            transition: color .2s;
        }

        .toggle-password:hover {
            color: var(--primary);
        }

        .form-row-between {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 1.4rem;
            flex-wrap: wrap;
            gap: .5rem;
        }

        .checkbox-label {
            display: flex;
            align-items: center;
            gap: .45rem;
            font-family: 'Poppins', sans-serif;
            font-size: .83rem;
            color: var(--text-medium);
            cursor: pointer;
        }

        .checkbox-label input[type="checkbox"] {
            accent-color: var(--primary);
            width: 15px;
            height: 15px;
            cursor: pointer;
        }

        .link-subtle {
            font-family: 'Poppins', sans-serif;
            font-size: .83rem;
            color: var(--primary);
            text-decoration: none;
            font-weight: 500;
        }

        .link-subtle:hover {
            text-decoration: underline;
        }

        .btn-auth {
            width: 100%;
            padding: .85rem;
            background: linear-gradient(135deg, var(--primary), var(--accent));
            color: var(--white);
            border: none;
            border-radius: 12px;
            font-family: 'Nunito', sans-serif;
            font-size: 1rem;
            font-weight: 800;
            cursor: pointer;
            transition: opacity .2s, transform .15s;
            letter-spacing: .3px;
        }

        .btn-auth:hover {
            opacity: .9;
            transform: translateY(-1px);
        }

        .btn-auth:active {
            transform: translateY(0);
        }

        .btn-auth:disabled {
            opacity: .6;
            cursor: not-allowed;
            transform: none;
        }

        .divider {
            display: flex;
            align-items: center;
            gap: .75rem;
            margin: 1.4rem 0;
            color: var(--text-light);
            font-family: 'Poppins', sans-serif;
            font-size: .8rem;
        }

        .divider::before,
        .divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background: var(--border);
        }

        .auth-footer-text {
            text-align: center;
            font-family: 'Poppins', sans-serif;
            font-size: .88rem;
            color: var(--text-medium);
        }

        .auth-footer-text a {
            color: var(--primary);
            font-weight: 700;
            text-decoration: none;
        }

        .auth-footer-text a:hover {
            text-decoration: underline;
        }

        .back-link {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: .4rem;
            margin-top: 1rem;
            font-family: 'Poppins', sans-serif;
            font-size: .82rem;
            color: var(--text-medium);
            text-decoration: none;
            transition: color .2s;
        }

        .back-link:hover {
            color: var(--primary);
        }

        @media (max-width: 480px) {
            .auth-card {
                padding: 2rem 1.25rem;
            }
        }
    </style>
</head>

<body>

    <main class="auth-page">
        <div class="auth-card">

            <div class="auth-logo">
                <span class="logo-icon">🎭</span>
                <span class="logo-text">MagicFest</span>
                <p class="logo-sub">Personagens que encantam festas</p>
            </div>

            <h1 class="auth-title">Bem-vindo de volta!</h1>

            <c:if test="${not empty requestScope.erro}">
                <div class="alert alert-error" role="alert">
                    <span>⚠️</span>
                    <c:out value="${requestScope.erro}" />
                </div>
            </c:if>

            <c:if test="${not empty param.sucesso}">
                <div class="alert alert-success" role="alert">
                    <span>✅</span> Conta criada com sucesso! Faça o login para continuar.
                </div>
            </c:if>

            <form id="loginForm" action="${pageContext.request.contextPath}/auth" method="post" novalidate>
                <input type="hidden" name="acao" value="login">

                <div class="form-group">
                    <label for="email">E-mail</label>
                    <div class="input-wrapper">
                        <span class="input-icon">📧</span>
                        <input type="email" id="email" name="email" class="form-control"
                            placeholder="seu@email.com" autocomplete="email"
                            value="<c:out value='${param.email}'/>">
                    </div>
                    <span class="field-error" id="emailError">Informe um e-mail válido.</span>
                </div>

                <div class="form-group">
                    <label for="senha">Senha</label>
                    <div class="input-wrapper">
                        <span class="input-icon">🔒</span>
                        <input type="password" id="senha" name="senha" class="form-control"
                            placeholder="Sua senha" autocomplete="current-password">
                        <button type="button" class="toggle-password" aria-label="Mostrar ou ocultar senha"
                            data-target="senha">👁️</button>
                    </div>
                    <span class="field-error" id="senhaError">A senha não pode estar vazia.</span>
                </div>

                <div class="form-row-between">
                    <label class="checkbox-label">
                        <input type="checkbox" name="lembrar" id="lembrar">
                        Lembrar de mim
                    </label>
                    <span class="link-subtle" style="color:#aaa;cursor:default;">Esqueceu a senha?</span>
                </div>

                <button type="submit" class="btn-auth" id="btnEntrar">Entrar na minha conta</button>
            </form>

            <div class="divider">ou</div>

            <p class="auth-footer-text">
                Ainda não tem conta?
                <a href="${pageContext.request.contextPath}/auth?acao=cadastro">Criar conta grátis</a>
            </p>

            <a href="${pageContext.request.contextPath}/" class="back-link">← Voltar para a página inicial</a>

        </div>
    </main>

    <script src="${pageContext.request.contextPath}/assets/js/login.js"></script>

</body>

</html>