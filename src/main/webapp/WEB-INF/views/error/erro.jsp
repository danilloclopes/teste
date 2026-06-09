<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Erro — MagicFest</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700;800&display=swap" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Nunito:wght@400;700;800&display=swap');

        *,
        *::before,
        *::after {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --primary: #7C3AED;
            --primary-dark: #5B21B6;
            --accent: #EC4899;
            --text-dark: #1E1B4B;
            --text-medium: #4B5563;
            --white: #FFFFFF;
            --border: #E9D5FF;
            --shadow: rgba(124, 58, 237, 0.12);
            --shadow-hover: rgba(124, 58, 237, 0.25);
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
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        .error-card {
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 4px 24px rgba(0, 0, 0, .08);
            padding: 3rem 2.5rem;
            text-align: center;
            max-width: 480px;
            width: 100%;
        }

        .error-icon {
            font-size: 4rem;
            margin-bottom: 1rem;
        }

        .error-title {
            font-size: 1.5rem;
            font-weight: 800;
            color: #1e1b4b;
            margin-bottom: .75rem;
        }

        .error-msg {
            color: #6b7280;
            font-size: .95rem;
            margin-bottom: 2rem;
        }

        .error-actions {
            display: flex;
            gap: .75rem;
            justify-content: center;
            flex-wrap: wrap;
        }
    </style>
</head>

<body>
    <div class="error-card">
        <div class="error-icon">😕</div>
        <h1 class="error-title">Algo deu errado</h1>
        <p class="error-msg">
            <c:choose>
                <c:when test="${not empty requestScope.erro}">${requestScope.erro}</c:when>
                <c:otherwise>Ocorreu um erro inesperado. Tente novamente.</c:otherwise>
            </c:choose>
        </p>
        <div class="error-actions">
            <a href="${pageContext.request.contextPath}/" class="btn btn-primary">Voltar ao início</a>
            <a href="javascript:history.back()" class="btn btn-outline">Página anterior</a>
        </div>
    </div>
</body>

</html>