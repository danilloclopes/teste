<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        

<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Termos de Uso — MagicFest</title>
    <meta name="description"
        content="Termos de Uso da plataforma MagicFest — Aluguel de personagens para festas." />
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
                    <div class="legal-badge">📄 Documento Legal</div>
                    <h1 class="legal-title">Termos de Uso</h1>
                    <p class="legal-meta">Última atualização: 27 de abril de 2026 &nbsp;·&nbsp; Versão 1.0</p>
                </div>

                <nav class="legal-toc">
                    <h3>Sumário</h3>
                    <ol>
                        <li><a href="#s1">Aceitação dos Termos</a></li>
                        <li><a href="#s2">Descrição do Serviço</a></li>
                        <li><a href="#s3">Cadastro e Conta</a></li>
                        <li><a href="#s4">Uso da Plataforma</a></li>
                        <li><a href="#s5">Reservas e Contratação</a></li>
                        <li><a href="#s6">Cancelamento e Reembolso</a></li>
                        <li><a href="#s7">Responsabilidades</a></li>
                        <li><a href="#s8">Propriedade Intelectual</a></li>
                        <li><a href="#s9">Conduta Proibida</a></li>
                        <li><a href="#s10">Alterações nos Termos</a></li>
                        <li><a href="#s11">Lei Aplicável</a></li>
                        <li><a href="#s12">Contato</a></li>
                    </ol>
                </nav>

                <div class="legal-highlight legal-highlight--warning">
                    Leia este documento com atenção antes de utilizar a plataforma MagicFest. Ao criar uma conta
                    ou realizar uma reserva, você concorda com todos os termos aqui descritos.
                </div>

                <div class="legal-section" id="s1">
                    <h2><span class="section-num">1</span> Aceitação dos Termos</h2>
                    <p>Estes Termos de Uso ("Termos") regulam o acesso e o uso da plataforma MagicFest
                        ("Plataforma"), operada por MagicFest Entretenimento Ltda., com sede em [Cidade,
                        Estado], CNPJ nº [00.000.000/0001-00].</p>
                    <p>Ao acessar ou usar a Plataforma de qualquer forma — seja criando uma conta, realizando
                        uma reserva ou simplesmente navegando — você ("Usuário") declara ter lido, compreendido
                        e concordado integralmente com estes Termos e com nossa <a
                            href="${pageContext.request.contextPath}/politica-de-privacidade"
                            style="color:var(--primary);font-weight:700;">Política de Privacidade</a>.</p>
                    <p>Se você não concordar com qualquer disposição aqui contida, não utilize a Plataforma.</p>
                </div>

                <div class="legal-section" id="s2">
                    <h2><span class="section-num">2</span> Descrição do Serviço</h2>
                    <p>A MagicFest é uma plataforma de intermediação que conecta <strong>clientes</strong>
                        (contratantes de personagens para festas) a <strong>personagens</strong> (artistas e
                        animadores que oferecem seus serviços). A Plataforma permite:</p>
                    <ul>
                        <li>Pesquisar e visualizar perfis de personagens disponíveis;</li>
                        <li>Verificar disponibilidade e valores por hora;</li>
                        <li>Realizar reservas com data, horário e duração definidos;</li>
                        <li>Gerenciar pedidos e histórico de contratações;</li>
                        <li>Avaliar e receber avaliações após a prestação do serviço.</li>
                    </ul>
                    <p>A MagicFest atua como intermediária e não é parte do contrato de prestação de serviços
                        firmado entre cliente e personagem. As obrigações relativas à execução do serviço são
                        exclusivas das partes contratantes.</p>
                </div>

                <div class="legal-section" id="s3">
                    <h2><span class="section-num">3</span> Cadastro e Conta</h2>
                    <p><strong>3.1 Elegibilidade.</strong> Para criar uma conta, o Usuário deve ter no mínimo 18
                        anos de idade ou ser representado por seu responsável legal. Menores de 18 anos somente
                        podem utilizar a Plataforma com supervisão e autorização dos pais ou responsáveis.</p>
                    <p><strong>3.2 Veracidade das Informações.</strong> O Usuário compromete-se a fornecer
                        informações verídicas, completas e atualizadas no momento do cadastro e a mantê-las
                        atualizadas ao longo do tempo. O fornecimento de informações falsas pode resultar no
                        cancelamento imediato da conta.</p>
                    <p><strong>3.3 Segurança da Senha.</strong> O Usuário é o único responsável pela guarda e
                        sigilo de suas credenciais de acesso. Qualquer uso não autorizado da conta deve ser
                        comunicado imediatamente à MagicFest pelo e-mail
                        <strong>contato@magicfest.com.br</strong>.</p>
                    <p><strong>3.4 Unicidade da Conta.</strong> É permitido apenas um cadastro por CPF/CNPJ. O
                        compartilhamento de contas entre diferentes usuários é proibido.</p>
                </div>

                <div class="legal-section" id="s4">
                    <h2><span class="section-num">4</span> Uso da Plataforma</h2>
                    <p>O Usuário compromete-se a utilizar a Plataforma de forma lícita, respeitando a legislação
                        brasileira vigente, estes Termos e os direitos de terceiros. É vedado:</p>
                    <ul>
                        <li>Usar a Plataforma para finalidades ilegais ou fraudulentas;</li>
                        <li>Tentar contornar, desabilitar ou interferir em funcionalidades de segurança;</li>
                        <li>Publicar conteúdo ofensivo, discriminatório, difamatório ou de cunho sexual;</li>
                        <li>Realizar reservas sem intenção de contratação (reservas fictícias);</li>
                        <li>Coletar dados de outros usuários sem autorização;</li>
                        <li>Utilizar meios automatizados (bots, scrapers) para acessar a Plataforma.</li>
                    </ul>
                </div>

                <div class="legal-section" id="s5">
                    <h2><span class="section-num">5</span> Reservas e Contratação</h2>
                    <p><strong>5.1 Confirmação.</strong> Uma reserva é considerada confirmada somente após o
                        processamento do pagamento e o envio da confirmação por e-mail ao cliente.</p>
                    <p><strong>5.2 Prazo Mínimo.</strong> As reservas devem ser realizadas com antecedência
                        mínima de <strong>48 horas</strong> antes do horário de início do evento, salvo quando
                        disponibilidade imediata for indicada pelo personagem.</p>
                    <p><strong>5.3 Informações do Evento.</strong> O cliente é responsável por fornecer
                        informações precisas sobre o endereço, data, horário e perfil do público. Alterações
                        realizadas após a confirmação estão sujeitas à aceitação do personagem e podem gerar
                        custos adicionais.</p>
                    <p><strong>5.4 Pagamento.</strong> Os pagamentos são processados de forma segura por meio
                        dos gateways de pagamento integrados à Plataforma. A MagicFest repassa ao personagem o
                        valor acordado, deduzida a taxa de serviço da Plataforma, após a conclusão confirmada do
                        evento.</p>
                </div>

                <div class="legal-section" id="s6">
                    <h2><span class="section-num">6</span> Cancelamento e Reembolso</h2>
                    <p><strong>6.1 Cancelamento pelo Cliente:</strong></p>
                    <ul>
                        <li><strong>Mais de 72 horas antes do evento:</strong> reembolso integral.</li>
                        <li><strong>Entre 24 e 72 horas antes do evento:</strong> reembolso de 50% do valor
                            pago.</li>
                        <li><strong>Menos de 24 horas antes do evento:</strong> sem reembolso.</li>
                    </ul>
                    <p><strong>6.2 Cancelamento pelo Personagem.</strong> Caso o personagem cancele a reserva
                        confirmada, o cliente receberá reembolso integral e será auxiliado na busca de um
                        substituto disponível na Plataforma, sem qualquer custo adicional.</p>
                    <p><strong>6.3 Força Maior.</strong> Situações de força maior devidamente comprovadas
                        (desastres naturais, emergências médicas) poderão ser analisadas caso a caso pela equipe
                        MagicFest para definição de reembolso proporcional.</p>
                    <p><strong>6.4 Prazo de Reembolso.</strong> Os reembolsos são processados em até <strong>10
                            dias úteis</strong>, via o mesmo meio de pagamento utilizado na contratação.</p>
                </div>

                <div class="legal-section" id="s7">
                    <h2><span class="section-num">7</span> Responsabilidades</h2>
                    <p><strong>7.1 Limitação da MagicFest.</strong> A MagicFest não se responsabiliza por danos
                        causados durante a execução dos serviços, conflitos entre cliente e personagem, atrasos
                        decorrentes de força maior, nem por conteúdo publicado por usuários na Plataforma.</p>
                    <p><strong>7.2 Responsabilidade do Personagem.</strong> O personagem é inteiramente
                        responsável pela qualidade, pontualidade e segurança do serviço prestado, bem como por
                        manter-se apto física e legalmente para exercer a atividade.</p>
                    <p><strong>7.3 Responsabilidade do Cliente.</strong> O cliente é responsável por garantir um
                        ambiente seguro para a realização do evento e por informar eventuais restrições ou
                        necessidades especiais com antecedência.</p>
                    <p><strong>7.4 Disponibilidade.</strong> A MagicFest envida seus melhores esforços para
                        manter a Plataforma disponível 24 horas por dia, 7 dias por semana, mas não garante
                        disponibilidade ininterrupta e se reserva o direito de realizar manutenções programadas.
                    </p>
                </div>

                <div class="legal-section" id="s8">
                    <h2><span class="section-num">8</span> Propriedade Intelectual</h2>
                    <p>Todos os elementos da Plataforma MagicFest — incluindo logotipo, nome, layout,
                        código-fonte, textos, imagens e funcionalidades — são de propriedade exclusiva da
                        MagicFest Entretenimento Ltda. e protegidos pela legislação brasileira de propriedade
                        intelectual (Lei nº 9.610/1998).</p>
                    <p>É vedada a reprodução, distribuição, modificação ou uso comercial de qualquer elemento da
                        Plataforma sem autorização prévia e por escrito da MagicFest.</p>
                    <p>Os personagens referenciados na Plataforma são marcas registradas de seus respectivos
                        detentores. A MagicFest não possui vínculo com as empresas detentoras dessas marcas.</p>
                </div>

                <div class="legal-section" id="s9">
                    <h2><span class="section-num">9</span> Conduta Proibida e Suspensão</h2>
                    <p>A MagicFest reserva-se o direito de suspender ou encerrar, temporária ou permanentemente,
                        contas de usuários que:</p>
                    <ul>
                        <li>Violem estes Termos de Uso;</li>
                        <li>Pratiquem assédio, discriminação ou atos de violência contra outros usuários;</li>
                        <li>Realizem fraudes ou tentativas de fraude;</li>
                        <li>Publiquem informações falsas sobre serviços ou avaliações;</li>
                        <li>Tentem burlar o sistema de pagamento da Plataforma.</li>
                    </ul>
                    <p>Em casos de suspeita de ilicitude, a MagicFest poderá cooperar com autoridades
                        competentes e fornecer informações nos limites legalmente permitidos.</p>
                </div>

                <div class="legal-section" id="s10">
                    <h2><span class="section-num">10</span> Alterações nos Termos</h2>
                    <p>A MagicFest poderá atualizar estes Termos a qualquer momento. Alterações relevantes serão
                        comunicadas por e-mail e/ou por aviso em destaque na Plataforma com antecedência mínima
                        de <strong>15 dias corridos</strong>.</p>
                    <p>O uso continuado da Plataforma após a entrada em vigor das alterações implica na
                        aceitação dos novos Termos. Caso o Usuário não concorde com as modificações, deverá
                        encerrar sua conta antes da data de vigência.</p>
                </div>

                <div class="legal-section" id="s11">
                    <h2><span class="section-num">11</span> Lei Aplicável e Foro</h2>
                    <p>Estes Termos são regidos e interpretados de acordo com as leis da República Federativa do
                        Brasil, em especial o Código Civil (Lei nº 10.406/2002), o Código de Defesa do
                        Consumidor (Lei nº 8.078/1990) e o Marco Civil da Internet (Lei nº 12.965/2014).</p>
                    <p>Fica eleito o foro da Comarca de [Cidade], Estado de [Estado], para dirimir quaisquer
                        controvérsias decorrentes destes Termos, com renúncia de qualquer outro, por mais
                        privilegiado que seja.</p>
                </div>

                <div class="legal-section" id="s12">
                    <h2><span class="section-num">12</span> Contato</h2>
                    <p>Para dúvidas, solicitações ou reclamações relacionadas a estes Termos, entre em contato
                        com nossa equipe:</p>
                    <ul>
                        <li><strong>E-mail:</strong> juridico@magicfest.com.br</li>
                        <li><strong>Atendimento:</strong> contato@magicfest.com.br</li>
                        <li><strong>Horário:</strong> Segunda a Sábado, das 8h às 20h</li>
                    </ul>
                </div>

                <div class="legal-contact-box">
                    <h3>Ficou com alguma dúvida?</h3>
                    <p>Nossa equipe está pronta para ajudar.</p>
                    <p><a href="mailto:contato@magicfest.com.br">contato@magicfest.com.br</a></p>
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