<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Política de Privacidade — MagicFest</title>
    <meta name="description"
        content="Política de Privacidade da MagicFest — saiba como tratamos seus dados pessoais conforme a LGPD." />
    <link rel="icon"
        href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🎭</text></svg>" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
        href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800;900&family=Poppins:wght@400;500;600;700&display=swap"
        rel="stylesheet" />
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
            overflow-x: hidden;
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

        .section-tag {
            display: inline-block;
            background: linear-gradient(135deg, var(--primary-light), var(--accent-light));
            color: var(--primary-dark);
            font-family: var(--font-heading);
            font-weight: 800;
            font-size: 0.75rem;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            padding: 6px 16px;
            border-radius: var(--radius-full);
            margin-bottom: 12px;
        }

        .section-title {
            font-family: var(--font-heading);
            font-weight: 900;
            font-size: clamp(1.8rem, 4vw, 2.6rem);
            color: var(--text-dark);
            line-height: 1.2;
            margin-bottom: 16px;
        }

        .section-title span {
            background: linear-gradient(135deg, var(--primary), var(--accent));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .section-subtitle {
            font-size: 1rem;
            color: var(--text-medium);
            max-width: 560px;
            margin: 0 auto 48px;
        }

        .text-center {
            text-align: center;
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

        .navbar {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
            padding: 18px 0;
            background: transparent;
            transition: background 0.4s ease, box-shadow 0.4s ease, padding 0.4s ease;
        }

        .navbar.scrolled {
            background: rgba(255, 255, 255, 0.97);
            box-shadow: 0 2px 20px rgba(0, 0, 0, 0.08);
            padding: 12px 0;
            backdrop-filter: blur(12px);
        }

        .navbar-inner {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .nav-logo {
            display: flex;
            align-items: center;
            gap: 10px;
            font-family: var(--font-heading);
            font-weight: 900;
            font-size: 1.5rem;
            color: var(--white);
            transition: color var(--transition);
        }

        .navbar.scrolled .nav-logo {
            color: var(--primary-dark);
        }

        .nav-logo .logo-icon {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, var(--secondary), var(--accent));
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            flex-shrink: 0;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 32px;
        }

        .nav-links a {
            font-weight: 600;
            font-size: 0.9rem;
            color: rgba(255, 255, 255, 0.9);
            transition: color var(--transition);
            position: relative;
        }

        .nav-links a::after {
            content: '';
            position: absolute;
            bottom: -4px;
            left: 0;
            width: 0;
            height: 2px;
            background: var(--secondary);
            transition: width var(--transition);
            border-radius: var(--radius-full);
        }

        .nav-links a:hover::after {
            width: 100%;
        }

        .navbar.scrolled .nav-links a {
            color: var(--text-medium);
        }

        .navbar.scrolled .nav-links a:hover {
            color: var(--primary);
        }

        .nav-actions {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .nav-btn-outline {
            padding: 9px 22px;
            border-radius: var(--radius-full);
            border: 2px solid rgba(255, 255, 255, 0.8);
            color: var(--white);
            font-family: var(--font-heading);
            font-weight: 700;
            font-size: 0.9rem;
            cursor: pointer;
            transition: var(--transition);
            background: transparent;
        }

        .nav-btn-outline:hover {
            background: rgba(255, 255, 255, 0.15);
        }

        .navbar.scrolled .nav-btn-outline {
            border-color: var(--primary);
            color: var(--primary);
        }

        .navbar.scrolled .nav-btn-outline:hover {
            background: var(--primary);
            color: var(--white);
        }

        .nav-btn-filled {
            padding: 9px 22px;
            border-radius: var(--radius-full);
            background: var(--secondary);
            color: var(--white);
            font-family: var(--font-heading);
            font-weight: 800;
            font-size: 0.9rem;
            cursor: pointer;
            border: none;
            transition: var(--transition);
            box-shadow: 0 4px 14px rgba(245, 158, 11, 0.4);
        }

        .nav-btn-filled:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(245, 158, 11, 0.5);
        }

        .menu-toggle {
            display: none;
            flex-direction: column;
            gap: 5px;
            cursor: pointer;
            padding: 4px;
            background: none;
            border: none;
        }

        .menu-toggle span {
            display: block;
            width: 26px;
            height: 3px;
            background: var(--white);
            border-radius: 3px;
            transition: var(--transition);
        }

        .navbar.scrolled .menu-toggle span {
            background: var(--text-dark);
        }

        .menu-toggle.open span:nth-child(1) {
            transform: translateY(8px) rotate(45deg);
        }

        .menu-toggle.open span:nth-child(2) {
            opacity: 0;
        }

        .menu-toggle.open span:nth-child(3) {
            transform: translateY(-8px) rotate(-45deg);
        }

        .mobile-nav {
            display: none;
            position: fixed;
            top: 0;
            right: -100%;
            width: 280px;
            height: 100vh;
            background: var(--white);
            box-shadow: -8px 0 40px rgba(0, 0, 0, 0.15);
            z-index: 999;
            padding: 80px 32px 32px;
            flex-direction: column;
            gap: 8px;
            transition: right 0.35s ease;
        }

        .mobile-nav.open {
            right: 0;
        }

        .mobile-nav a {
            display: block;
            padding: 12px 0;
            font-family: var(--font-heading);
            font-weight: 700;
            font-size: 1.1rem;
            color: var(--text-dark);
            border-bottom: 1px solid var(--border);
            transition: color var(--transition);
        }

        .mobile-nav a:hover {
            color: var(--primary);
        }

        .mobile-nav .mobile-nav-actions {
            display: flex;
            flex-direction: column;
            gap: 12px;
            margin-top: 24px;
        }

        .overlay {
            display: none;
            position: fixed;
            inset: 0;
            background: rgba(0, 0, 0, 0.4);
            z-index: 998;
            backdrop-filter: blur(4px);
        }

        .overlay.open {
            display: block;
        }

        .footer {
            background: var(--text-dark);
            color: rgba(255, 255, 255, 0.7);
            padding: 64px 0 32px;
        }

        .footer-grid {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr 1fr;
            gap: 40px;
            margin-bottom: 48px;
        }

        .footer-brand .nav-logo {
            margin-bottom: 16px;
            color: var(--white);
        }

        .footer-desc {
            font-size: 0.875rem;
            line-height: 1.7;
            margin-bottom: 24px;
            max-width: 280px;
        }

        .footer-social {
            display: flex;
            gap: 12px;
        }

        .social-link {
            width: 36px;
            height: 36px;
            background: rgba(255, 255, 255, 0.08);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1rem;
            transition: var(--transition);
            cursor: pointer;
        }

        .social-link:hover {
            background: var(--primary);
            transform: translateY(-2px);
        }

        .footer-col-title {
            font-family: var(--font-heading);
            font-weight: 800;
            font-size: 0.9rem;
            color: var(--white);
            margin-bottom: 16px;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .footer-links {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .footer-links a {
            font-size: 0.875rem;
            color: rgba(255, 255, 255, 0.6);
            transition: color var(--transition);
        }

        .footer-links a:hover {
            color: var(--primary-light);
        }

        .footer-contact-item {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 0.875rem;
            margin-bottom: 10px;
        }

        .footer-bottom {
            border-top: 1px solid rgba(255, 255, 255, 0.08);
            padding-top: 28px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 12px;
        }

        .footer-copyright {
            font-size: 0.825rem;
        }

        .footer-bottom-links {
            display: flex;
            gap: 20px;
        }

        .footer-bottom-links a {
            font-size: 0.825rem;
            color: rgba(255, 255, 255, 0.5);
            transition: color var(--transition);
        }

        .footer-bottom-links a:hover {
            color: var(--white);
        }

        @media (max-width: 1024px) {
            .footer-grid {
                grid-template-columns: 1fr 1fr;
            }
        }

        @media (max-width: 768px) {

            .nav-links,
            .nav-actions {
                display: none;
            }

            .menu-toggle {
                display: flex;
            }

            .mobile-nav {
                display: flex;
            }

            .footer-grid {
                grid-template-columns: 1fr;
            }

            .footer-bottom {
                flex-direction: column;
                text-align: center;
            }
        }

        /* legal.css */
        .legal-page {
            padding: 120px 0 80px;
            min-height: 100vh;
            background: var(--bg-section);
        }

        .legal-card {
            background: var(--white);
            border-radius: var(--radius-lg);
            box-shadow: 0 4px 32px var(--shadow);
            padding: 56px 64px;
            max-width: 860px;
            margin: 0 auto;
        }

        .legal-header {
            margin-bottom: 40px;
            padding-bottom: 32px;
            border-bottom: 2px solid var(--border);
        }

        .legal-badge {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: linear-gradient(135deg, var(--primary-light), var(--accent-light));
            color: var(--primary-dark);
            font-family: var(--font-heading);
            font-size: 13px;
            font-weight: 700;
            letter-spacing: .5px;
            padding: 6px 16px;
            border-radius: var(--radius-full);
            margin-bottom: 20px;
        }

        .legal-title {
            font-family: var(--font-heading);
            font-size: 2.2rem;
            font-weight: 900;
            color: var(--text-dark);
            margin-bottom: 12px;
        }

        .legal-meta {
            font-size: 14px;
            color: var(--text-light);
        }

        .lgpd-badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            background: #D1FAE5;
            color: #065F46;
            font-size: 13px;
            font-weight: 700;
            padding: 6px 14px;
            border-radius: var(--radius-full);
            margin-top: 12px;
        }

        .legal-toc {
            background: var(--bg-section);
            border: 1px solid var(--border);
            border-radius: var(--radius-md);
            padding: 24px 32px;
            margin-bottom: 40px;
        }

        .legal-toc h3 {
            font-family: var(--font-heading);
            font-size: 15px;
            font-weight: 800;
            color: var(--primary-dark);
            margin-bottom: 14px;
        }

        .legal-toc ol {
            list-style: decimal;
            padding-left: 20px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 6px 24px;
        }

        .legal-toc a {
            color: var(--primary);
            font-size: 14px;
            font-weight: 600;
            text-decoration: none;
            transition: color var(--transition);
        }

        .legal-toc a:hover {
            color: var(--primary-dark);
        }

        .legal-highlight {
            border-left: 4px solid;
            border-radius: 0 var(--radius-sm) var(--radius-sm) 0;
            padding: 16px 20px;
            margin: 16px 0;
            font-size: 14px;
            font-weight: 600;
        }

        .legal-highlight--warning {
            background: #FFF7ED;
            border-color: var(--secondary);
            color: #92400E;
        }

        .legal-highlight--info {
            background: #EFF6FF;
            border-color: var(--primary);
            color: #1E40AF;
        }

        .legal-section {
            margin-bottom: 40px;
        }

        .legal-section h2 {
            font-family: var(--font-heading);
            font-size: 1.25rem;
            font-weight: 800;
            color: var(--primary-dark);
            margin-bottom: 14px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .section-num {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 32px;
            height: 32px;
            background: linear-gradient(135deg, var(--primary), var(--accent));
            color: #fff;
            border-radius: 50%;
            font-size: 14px;
            font-weight: 900;
            flex-shrink: 0;
        }

        .legal-section p {
            color: var(--text-medium);
            font-size: 15px;
            line-height: 1.8;
            margin-bottom: 12px;
        }

        .legal-section ul,
        .legal-section ol {
            color: var(--text-medium);
            font-size: 15px;
            line-height: 1.8;
            padding-left: 24px;
            margin-bottom: 12px;
        }

        .legal-section ul {
            list-style: disc;
        }

        .legal-section ol {
            list-style: decimal;
        }

        .legal-section li {
            margin-bottom: 6px;
        }

        .rights-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
            margin: 16px 0;
        }

        .rights-item {
            background: var(--bg-section);
            border: 1px solid var(--border);
            border-radius: var(--radius-md);
            padding: 16px 20px;
        }

        .rights-item strong {
            display: block;
            color: var(--primary-dark);
            font-family: var(--font-heading);
            font-size: 14px;
            margin-bottom: 4px;
        }

        .rights-item span {
            color: var(--text-medium);
            font-size: 13px;
            line-height: 1.6;
        }

        .legal-contact-box {
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            color: #fff;
            border-radius: var(--radius-md);
            padding: 32px 40px;
            margin-top: 48px;
            text-align: center;
        }

        .legal-contact-box h3 {
            font-family: var(--font-heading);
            font-size: 1.3rem;
            font-weight: 800;
            margin-bottom: 10px;
        }

        .legal-contact-box p {
            opacity: .9;
            font-size: 15px;
            margin-bottom: 4px;
        }

        .legal-contact-box a {
            color: var(--secondary-light);
            font-weight: 700;
        }

        .legal-back {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            color: var(--primary);
            font-weight: 700;
            font-size: 15px;
            text-decoration: none;
            margin-bottom: 32px;
            transition: gap var(--transition);
        }

        .legal-back:hover {
            gap: 12px;
        }

        @media (max-width: 768px) {
            .legal-card {
                padding: 32px 24px;
            }

            .legal-title {
                font-size: 1.7rem;
            }

            .legal-toc ol {
                grid-template-columns: 1fr;
            }

            .rights-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>

    <!-- NAVBAR -->
    <nav class="navbar" id="navbar">
        <div class="container navbar-inner">
            <a href="${pageContext.request.contextPath}/" class="nav-logo">
                <div class="logo-icon">🎭</div>
                MagicFest
            </a>
            <ul class="nav-links">
                <li><a href="${pageContext.request.contextPath}/#como-funciona">Como Funciona</a></li>
                <li><a href="${pageContext.request.contextPath}/#personagens">Personagens</a></li>
                <li><a href="${pageContext.request.contextPath}/#diferenciais">Diferenciais</a></li>
                <li><a href="${pageContext.request.contextPath}/#depoimentos">Depoimentos</a></li>
            </ul>
            <div class="nav-actions">
                <a href="${pageContext.request.contextPath}/auth?acao=login" class="nav-btn-outline">Entrar</a>
                <a href="${pageContext.request.contextPath}/auth?acao=cadastro" class="nav-btn-filled">Criar
                    conta</a>
            </div>
            <button class="menu-toggle" id="menuToggle" aria-label="Abrir menu">
                <span></span><span></span><span></span>
            </button>
        </div>
    </nav>
    <nav class="mobile-nav" id="mobileNav">
        <a href="${pageContext.request.contextPath}/#como-funciona">Como Funciona</a>
        <a href="${pageContext.request.contextPath}/#personagens">Personagens</a>
        <a href="${pageContext.request.contextPath}/#diferenciais">Diferenciais</a>
        <a href="${pageContext.request.contextPath}/#depoimentos">Depoimentos</a>
        <div class="mobile-nav-actions">
            <a href="${pageContext.request.contextPath}/auth?acao=login" class="btn btn-outline">Entrar</a>
            <a href="${pageContext.request.contextPath}/auth?acao=cadastro" class="btn btn-primary">Criar
                conta</a>
        </div>
    </nav>
    <div class="overlay" id="overlay"></div>

    <!-- CONTEÚDO -->
    <main class="legal-page">
        <div class="container">

            <a href="${pageContext.request.contextPath}/" class="legal-back">← Voltar para o início</a>

            <div class="legal-card">

                <div class="legal-header">
                    <div class="legal-badge">🔒 Privacidade &amp; LGPD</div>
                    <h1 class="legal-title">Política de Privacidade</h1>
                    <p class="legal-meta">Última atualização: 27 de abril de 2026 &nbsp;·&nbsp; Versão 1.0</p>
                    <div class="lgpd-badge">✔ Em conformidade com a Lei Geral de Proteção de Dados (Lei nº
                        13.709/2018)</div>
                </div>

                <nav class="legal-toc">
                    <h3>Sumário</h3>
                    <ol>
                        <li><a href="#p1">Quem somos</a></li>
                        <li><a href="#p2">Dados que coletamos</a></li>
                        <li><a href="#p3">Finalidades do tratamento</a></li>
                        <li><a href="#p4">Base legal</a></li>
                        <li><a href="#p5">Compartilhamento de dados</a></li>
                        <li><a href="#p6">Retenção e exclusão</a></li>
                        <li><a href="#p7">Seus direitos (LGPD)</a></li>
                        <li><a href="#p8">Segurança</a></li>
                        <li><a href="#p9">Cookies</a></li>
                        <li><a href="#p10">Links externos</a></li>
                        <li><a href="#p11">Alterações nesta política</a></li>
                        <li><a href="#p12">Contato e DPO</a></li>
                    </ol>
                </nav>

                <div class="legal-highlight legal-highlight--info">
                    A MagicFest respeita sua privacidade. Esta Política explica, de forma transparente, quais
                    dados pessoais coletamos, por que os utilizamos e quais são seus direitos como titular dos
                    dados, em conformidade com a LGPD.
                </div>

                <div class="legal-section" id="p1">
                    <h2><span class="section-num">1</span> Quem somos (Controlador)</h2>
                    <p>O controlador responsável pelo tratamento dos seus dados pessoais é:</p>
                    <ul>
                        <li><strong>Razão Social:</strong> MagicFest Entretenimento Ltda.</li>
                        <li><strong>CNPJ:</strong> [00.000.000/0001-00]</li>
                        <li><strong>Endereço:</strong> [Rua, Número — Cidade/Estado — CEP]</li>
                        <li><strong>E-mail do DPO:</strong> privacidade@magicfest.com.br</li>
                    </ul>
                </div>

                <div class="legal-section" id="p2">
                    <h2><span class="section-num">2</span> Dados que coletamos</h2>
                    <p><strong>2.1 Dados fornecidos diretamente por você:</strong></p>
                    <ul>
                        <li>Nome completo;</li>
                        <li>Endereço de e-mail;</li>
                        <li>Número de telefone (opcional no cadastro);</li>
                        <li>Senha (armazenada de forma criptografada, nunca em texto puro);</li>
                        <li>Tipo de conta (cliente ou personagem) e dados profissionais quando aplicável (tipo
                            de personagem, valor por hora);</li>
                        <li>Informações de pagamento — processadas diretamente pelo gateway de pagamento; a
                            MagicFest não armazena dados de cartão de crédito.</li>
                    </ul>
                    <p><strong>2.2 Dados coletados automaticamente:</strong></p>
                    <ul>
                        <li>Endereço IP e localização aproximada;</li>
                        <li>Tipo de dispositivo, sistema operacional e navegador;</li>
                        <li>Páginas visitadas, tempo de sessão e cliques (via cookies e tecnologias similares);
                        </li>
                        <li>Data e horário de acesso.</li>
                    </ul>
                    <p><strong>2.3 Dados de terceiros:</strong> Podemos receber dados de provedores de
                        autenticação social (Google, Facebook) se você optar por criar conta por esse meio,
                        limitados ao nome, e-mail e foto de perfil.</p>
                </div>

                <div class="legal-section" id="p3">
                    <h2><span class="section-num">3</span> Finalidades do tratamento</h2>
                    <p>Utilizamos seus dados para as seguintes finalidades:</p>
                    <ul>
                        <li><strong>Criação e gestão de conta:</strong> autenticar seu acesso e personalizar sua
                            experiência;</li>
                        <li><strong>Processamento de reservas:</strong> gerenciar pedidos, confirmações e
                            comunicações relacionadas;</li>
                        <li><strong>Comunicações essenciais:</strong> enviar confirmações, alertas de segurança
                            e notificações do sistema;</li>
                        <li><strong>Atendimento ao cliente:</strong> responder a dúvidas, reclamações e
                            solicitações;</li>
                        <li><strong>Melhoria da Plataforma:</strong> analisar uso de funcionalidades para
                            aprimorar a experiência;</li>
                        <li><strong>Cumprimento legal:</strong> atender obrigações fiscais, contábeis e
                            regulatórias;</li>
                        <li><strong>Marketing (com consentimento):</strong> enviar novidades e promoções — você
                            pode cancelar a qualquer momento.</li>
                    </ul>
                </div>

                <div class="legal-section" id="p4">
                    <h2><span class="section-num">4</span> Base legal para o tratamento</h2>
                    <p>Nos termos da LGPD (art. 7º e 11), tratamos seus dados com as seguintes bases legais:</p>
                    <ul>
                        <li><strong>Execução de contrato</strong> — para processar reservas e gerir sua conta;
                        </li>
                        <li><strong>Consentimento</strong> — para envio de comunicações de marketing;</li>
                        <li><strong>Legítimo interesse</strong> — para melhorias da Plataforma e prevenção a
                            fraudes;</li>
                        <li><strong>Cumprimento de obrigação legal</strong> — para retenção de registros exigida
                            por lei.</li>
                    </ul>
                </div>

                <div class="legal-section" id="p5">
                    <h2><span class="section-num">5</span> Compartilhamento de dados</h2>
                    <p>A MagicFest não vende seus dados pessoais. Podemos compartilhá-los apenas nas seguintes
                        situações:</p>
                    <ul>
                        <li><strong>Com o personagem contratado:</strong> nome e telefone do cliente são
                            compartilhados após confirmação da reserva, para viabilizar o serviço;</li>
                        <li><strong>Gateways de pagamento:</strong> dados necessários para processar transações
                            financeiras com segurança;</li>
                        <li><strong>Prestadores de serviço de TI:</strong> serviços de hospedagem, e-mail
                            transacional e análise — vinculados por contratos de confidencialidade e proteção de
                            dados;</li>
                        <li><strong>Autoridades públicas:</strong> quando exigido por lei, ordem judicial ou
                            regulamentação aplicável.</li>
                    </ul>
                    <p>Todos os terceiros com quem compartilhamos dados estão sujeitos a obrigações contratuais
                        de sigilo e segurança compatíveis com a LGPD.</p>
                </div>

                <div class="legal-section" id="p6">
                    <h2><span class="section-num">6</span> Retenção e exclusão de dados</h2>
                    <p>Mantemos seus dados pelo tempo necessário para cumprir as finalidades descritas nesta
                        Política, observando os seguintes critérios:</p>
                    <ul>
                        <li><strong>Dados de conta ativa:</strong> enquanto a conta estiver ativa ou pelo prazo
                            mínimo exigido por lei;</li>
                        <li><strong>Registros de transações:</strong> 5 anos, conforme exigências fiscais e do
                            Código de Defesa do Consumidor;</li>
                        <li><strong>Logs de acesso:</strong> 6 meses, conforme o Marco Civil da Internet (Lei nº
                            12.965/2014);</li>
                        <li><strong>Dados de marketing:</strong> até o cancelamento do consentimento.</li>
                    </ul>
                    <p>Após o término do prazo de retenção, os dados são eliminados de forma segura ou
                        anonimizados.</p>
                </div>

                <div class="legal-section" id="p7">
                    <h2><span class="section-num">7</span> Seus direitos como titular (LGPD)</h2>
                    <p>Nos termos do art. 18 da LGPD, você possui os seguintes direitos sobre seus dados
                        pessoais:</p>
                    <div class="rights-grid">
                        <div class="rights-item">
                            <strong>Acesso</strong>
                            <span>Saber quais dados temos sobre você e como os utilizamos.</span>
                        </div>
                        <div class="rights-item">
                            <strong>Correção</strong>
                            <span>Corrigir dados incompletos, inexatos ou desatualizados.</span>
                        </div>
                        <div class="rights-item">
                            <strong>Anonimização ou Exclusão</strong>
                            <span>Solicitar o bloqueio ou eliminação de dados desnecessários ou
                                excessivos.</span>
                        </div>
                        <div class="rights-item">
                            <strong>Portabilidade</strong>
                            <span>Receber seus dados em formato estruturado e interoperável.</span>
                        </div>
                        <div class="rights-item">
                            <strong>Revogação do Consentimento</strong>
                            <span>Retirar seu consentimento a qualquer momento, sem penalidade.</span>
                        </div>
                        <div class="rights-item">
                            <strong>Oposição</strong>
                            <span>Opor-se a tratamentos baseados em legítimo interesse.</span>
                        </div>
                        <div class="rights-item">
                            <strong>Eliminação</strong>
                            <span>Solicitar a exclusão de dados tratados com base no consentimento.</span>
                        </div>
                        <div class="rights-item">
                            <strong>Reclamação</strong>
                            <span>Peticionar à ANPD (Autoridade Nacional de Proteção de Dados).</span>
                        </div>
                    </div>
                    <p>Para exercer qualquer um desses direitos, entre em contato pelo e-mail
                        <strong>privacidade@magicfest.com.br</strong>. Responderemos em até <strong>15 dias
                            úteis</strong>.</p>
                </div>

                <div class="legal-section" id="p8">
                    <h2><span class="section-num">8</span> Segurança dos dados</h2>
                    <p>Adotamos medidas técnicas e organizacionais adequadas para proteger seus dados contra
                        acesso não autorizado, alteração, divulgação ou destruição, incluindo:</p>
                    <ul>
                        <li>Criptografia de senhas com algoritmos de hash seguros (bcrypt);</li>
                        <li>Transmissão de dados via protocolo HTTPS (TLS);</li>
                        <li>Controle de acesso por perfis com privilégio mínimo;</li>
                        <li>Monitoramento de acessos e tentativas de intrusão;</li>
                        <li>Backups regulares e procedimentos de recuperação de desastres.</li>
                    </ul>
                    <p>Em caso de incidente de segurança que possa afetar seus direitos, notificaremos você e a
                        ANPD dentro dos prazos legais aplicáveis.</p>
                </div>

                <div class="legal-section" id="p9">
                    <h2><span class="section-num">9</span> Cookies e tecnologias similares</h2>
                    <p>Utilizamos cookies para melhorar a experiência de uso da Plataforma. Os tipos de cookies
                        que empregamos são:</p>
                    <ul>
                        <li><strong>Essenciais:</strong> necessários para o funcionamento básico da Plataforma
                            (sessão de login, preferências de segurança). Não podem ser desativados.</li>
                        <li><strong>Analíticos:</strong> coletam informações de uso de forma anônima para nos
                            ajudar a entender como a Plataforma é utilizada.</li>
                        <li><strong>Funcionais:</strong> memorizam suas preferências para personalizar a
                            experiência.</li>
                    </ul>
                    <p>Você pode gerenciar ou desativar cookies nas configurações do seu navegador. A
                        desativação de cookies essenciais pode impactar funcionalidades da Plataforma.</p>
                </div>

                <div class="legal-section" id="p10">
                    <h2><span class="section-num">10</span> Links externos</h2>
                    <p>A Plataforma pode conter links para sites de terceiros. Esta Política de Privacidade
                        aplica-se exclusivamente à MagicFest. Não somos responsáveis pelas práticas de
                        privacidade de sites externos e recomendamos que você leia as políticas de cada site que
                        visitar.</p>
                </div>

                <div class="legal-section" id="p11">
                    <h2><span class="section-num">11</span> Alterações nesta Política</h2>
                    <p>Podemos atualizar esta Política periodicamente para refletir mudanças em nossas práticas
                        ou na legislação aplicável. Alterações relevantes serão comunicadas por e-mail e/ou
                        aviso destacado na Plataforma.</p>
                    <p>A data da "Última atualização" no topo deste documento indica quando a versão vigente foi
                        publicada. O uso continuado da Plataforma após a publicação das alterações implica na
                        aceitação da nova versão.</p>
                </div>

                <div class="legal-section" id="p12">
                    <h2><span class="section-num">12</span> Contato e Encarregado (DPO)</h2>
                    <p>Para exercer seus direitos, esclarecer dúvidas ou fazer reclamações sobre o tratamento de
                        dados pessoais, entre em contato com nosso Encarregado de Proteção de Dados (DPO):</p>
                    <ul>
                        <li><strong>E-mail do DPO:</strong> privacidade@magicfest.com.br</li>
                        <li><strong>Atendimento geral:</strong> contato@magicfest.com.br</li>
                        <li><strong>Prazo de resposta:</strong> até 15 dias úteis</li>
                    </ul>
                    <p>Caso não esteja satisfeito com nossa resposta, você pode apresentar reclamação à
                        <strong>Autoridade Nacional de Proteção de Dados (ANPD)</strong> pelo site
                        <strong>www.gov.br/anpd</strong>.</p>
                </div>

                <div class="legal-contact-box">
                    <h3>Sua privacidade é nossa prioridade</h3>
                    <p>Entre em contato com nosso DPO sempre que necessário.</p>
                    <p><a href="mailto:privacidade@magicfest.com.br">privacidade@magicfest.com.br</a></p>
                </div>

            </div>
        </div>
    </main>

    <!-- FOOTER -->
    <footer class="footer">
        <div class="container">
            <div class="footer-grid">
                <div class="footer-brand">
                    <a href="${pageContext.request.contextPath}/" class="nav-logo"
                        style="margin-bottom:16px;display:inline-flex;">
                        <div class="logo-icon">🎭</div>
                        MagicFest
                    </a>
                    <p class="footer-desc">Transformamos festas em memórias eternas. Personagens de qualidade,
                        atendimento humanizado e uma experiência que toda criança merece.</p>
                    <div class="footer-social">
                        <span class="social-link" title="Instagram">📸</span>
                        <span class="social-link" title="Facebook">👍</span>
                        <span class="social-link" title="WhatsApp">💬</span>
                        <span class="social-link" title="YouTube">▶️</span>
                    </div>
                </div>
                <div>
                    <div class="footer-col-title">Navegação</div>
                    <ul class="footer-links">
                        <li><a href="${pageContext.request.contextPath}/">Início</a></li>
                        <li><a href="${pageContext.request.contextPath}/#como-funciona">Como Funciona</a></li>
                        <li><a href="${pageContext.request.contextPath}/#depoimentos">Depoimentos</a></li>
                    </ul>
                </div>
                <div>
                    <div class="footer-col-title">Conta</div>
                    <ul class="footer-links">
                        <li><a href="${pageContext.request.contextPath}/auth?acao=cadastro">Criar conta</a></li>
                        <li><a href="${pageContext.request.contextPath}/auth?acao=login">Entrar</a></li>
                    </ul>
                </div>
                <div>
                    <div class="footer-col-title">Contato</div>
                    <div class="footer-contact-item"><span
                            class="icon">📧</span><span>contato@magicfest.com.br</span></div>
                    <div class="footer-contact-item"><span class="icon">📞</span><span>(00) 0 0000-0000</span>
                    </div>
                    <div class="footer-contact-item"><span class="icon">⏰</span><span>Seg–Sáb, 8h–20h</span>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <p class="footer-copyright">&copy;
                    <fmt:formatDate value="${now}" pattern="yyyy" /> MagicFest. Todos os direitos reservados.
                </p>
                <div class="footer-bottom-links">
                    <a href="${pageContext.request.contextPath}/politica-de-privacidade">Política de
                        Privacidade</a>
                    <a href="${pageContext.request.contextPath}/termos-de-uso">Termos de Uso</a>
                </div>
            </div>
        </div>
    </footer>

    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>

</html>