<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:set var="tipoConta" value="${not empty param.tipoConta ? param.tipoConta : 'cliente'}" />
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Criar Conta — MagicFest</title>
    <meta name="description" content="Crie sua conta MagicFest e comece a reservar personagens para sua festa.">
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
            max-width: 480px;
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
            margin-bottom: .4rem;
        }

        .auth-subtitle {
            font-family: 'Poppins', sans-serif;
            font-size: .85rem;
            color: var(--text-medium);
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

        .form-row-2 {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: .9rem;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        .form-group label {
            display: block;
            font-family: 'Poppins', sans-serif;
            font-size: .82rem;
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: .4rem;
        }

        .label-optional {
            font-size: .75rem;
            color: var(--text-light);
            font-weight: 400;
            margin-left: .3rem;
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

        .form-control.valid {
            border-color: #22c55e;
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

        .password-strength {
            margin-top: .5rem;
        }

        .strength-bar {
            height: 4px;
            border-radius: 4px;
            background: var(--border);
            overflow: hidden;
            margin-bottom: .3rem;
        }

        .strength-fill {
            height: 100%;
            border-radius: 4px;
            width: 0;
            transition: width .3s, background .3s;
        }

        .strength-text {
            font-family: 'Poppins', sans-serif;
            font-size: .72rem;
            color: var(--text-light);
        }

        .terms-group {
            margin-bottom: 1.4rem;
        }

        .checkbox-label {
            display: flex;
            align-items: flex-start;
            gap: .5rem;
            font-family: 'Poppins', sans-serif;
            font-size: .83rem;
            color: var(--text-medium);
            cursor: pointer;
            line-height: 1.4;
        }

        .checkbox-label input[type="checkbox"] {
            accent-color: var(--primary);
            width: 15px;
            height: 15px;
            cursor: pointer;
            margin-top: .15rem;
            flex-shrink: 0;
        }

        .checkbox-label a {
            color: var(--primary);
            font-weight: 600;
            text-decoration: none;
        }

        .checkbox-label a:hover {
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

        .benefits-mini {
            display: flex;
            justify-content: center;
            gap: 1.2rem;
            margin-bottom: 1.5rem;
            flex-wrap: wrap;
        }

        .benefit-item {
            display: flex;
            align-items: center;
            gap: .35rem;
            font-family: 'Poppins', sans-serif;
            font-size: .78rem;
            color: var(--text-medium);
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

        .role-group {
            margin-bottom: 1.25rem;
        }

        .role-group-label {
            display: block;
            font-family: 'Poppins', sans-serif;
            font-size: .82rem;
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: .6rem;
        }

        .role-cards {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: .75rem;
        }

        .role-card {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            gap: .3rem;
            padding: 1rem .75rem;
            border: 2px solid var(--border);
            border-radius: 12px;
            cursor: pointer;
            transition: border-color .2s, background .2s, box-shadow .2s;
            background: #faf9ff;
            position: relative;
            user-select: none;
        }

        .role-card input[type="radio"] {
            position: absolute;
            opacity: 0;
            width: 0;
            height: 0;
        }

        .role-card__icon {
            font-size: 1.8rem;
            line-height: 1;
        }

        .role-card__title {
            font-family: 'Nunito', sans-serif;
            font-size: .9rem;
            font-weight: 800;
            color: var(--text-dark);
            transition: color .2s;
        }

        .role-card__desc {
            font-family: 'Poppins', sans-serif;
            font-size: .72rem;
            color: var(--text-medium);
            line-height: 1.3;
        }

        .role-card:hover {
            border-color: var(--primary);
            background: #f5f0ff;
        }

        .role-card--selected {
            border-color: var(--primary);
            background: linear-gradient(135deg, rgba(124, 58, 237, .06), rgba(139, 92, 246, .06));
            box-shadow: 0 0 0 3px rgba(124, 58, 237, .12);
        }

        .role-card--selected .role-card__title {
            color: var(--primary);
        }

        .personagem-section {
            overflow: hidden;
            max-height: 0;
            opacity: 0;
            transition: max-height .38s ease, opacity .28s ease;
            margin-bottom: 0;
        }

        .personagem-section--visible {
            max-height: 500px;
            opacity: 1;
        }

        .personagem-section__header {
            display: flex;
            align-items: center;
            gap: .5rem;
            font-family: 'Nunito', sans-serif;
            font-size: .85rem;
            font-weight: 800;
            color: var(--primary);
            background: linear-gradient(135deg, rgba(124, 58, 237, .06), rgba(139, 92, 246, .06));
            border: 1px solid rgba(124, 58, 237, .2);
            border-radius: 10px;
            padding: .6rem .9rem;
            margin-bottom: .9rem;
        }

        select.form-control {
            appearance: none;
            -webkit-appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='8' viewBox='0 0 12 8'%3E%3Cpath d='M1 1l5 5 5-5' stroke='%237c3aed' stroke-width='1.5' fill='none' stroke-linecap='round' stroke-linejoin='round'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right .9rem center;
            padding-right: 2.4rem;
            cursor: pointer;
        }

        @media (max-width: 520px) {
            .form-row-2 {
                grid-template-columns: 1fr;
                gap: 0;
            }

            .auth-card {
                padding: 2rem 1.25rem;
            }
        }

        @media (max-width: 480px) {
            .role-cards {
                grid-template-columns: 1fr;
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

            <h1 class="auth-title">Crie sua conta</h1>
            <p class="auth-subtitle">É rápido, gratuito e sem complicação!</p>

            <div class="benefits-mini">
                <span class="benefit-item">✅ Gratuito</span>
                <span class="benefit-item">🔒 Seguro</span>
                <span class="benefit-item">⚡ Rápido</span>
            </div>

            <c:if test="${not empty requestScope.erro}">
                <div class="alert alert-error" role="alert">
                    <span>⚠️</span>
                    <c:out value="${requestScope.erro}" />
                </div>
            </c:if>

            <form id="cadastroForm" action="${pageContext.request.contextPath}/auth" method="post" novalidate>
                <input type="hidden" name="acao" value="cadastro">

                <%-- Tipo de conta --%>
                    <div class="form-group role-group">
                        <span class="role-group-label">Tipo de conta</span>
                        <div class="role-cards" id="roleCards">

                            <label class="role-card ${tipoConta == 'cliente' ? 'role-card--selected' : ''}"
                                onclick="selecionarTipo(this)">
                                <input type="radio" name="tipoConta" value="cliente" ${tipoConta=='cliente'
                                    ? 'checked' : '' }>
                                <span class="role-card__icon">👤</span>
                                <span class="role-card__title">Cliente</span>
                                <span class="role-card__desc">Quero contratar personagens para minha
                                    festa</span>
                            </label>

                            <label class="role-card ${tipoConta == 'personagem' ? 'role-card--selected' : ''}"
                                onclick="selecionarTipo(this)">
                                <input type="radio" name="tipoConta" value="personagem"
                                    ${tipoConta=='personagem' ? 'checked' : '' }>
                                <span class="role-card__icon">🎭</span>
                                <span class="role-card__title">Personagem</span>
                                <span class="role-card__desc">Quero oferecer meus serviços como
                                    personagem</span>
                            </label>

                        </div>
                    </div>

                <%-- Dados extras visíveis apenas para quem se cadastra como personagem --%>
                    <div id="personagemSection"
                        class="personagem-section ${tipoConta == 'personagem' ? 'personagem-section--visible' : ''}">
                        <div class="personagem-section__header">
                            <span>🎭</span>
                            <span>Dados do personagem</span>
                        </div>

                        <div class="form-group">
                            <label for="tipoPersonagem">Personagem que você interpreta</label>
                            <div class="input-wrapper">
                                <span class="input-icon">🎭</span>
                                <select id="tipoPersonagem" name="tipoPersonagem" class="form-control">
                                    <option value="">Selecione um personagem...</option>
                                    <optgroup label="👸 Princesas">
                                        <option value="CINDERELA" ${param.tipoPersonagem=='CINDERELA'
                                            ? 'selected' : '' }>Cinderela</option>
                                        <option value="BRANCA_NEVE" ${param.tipoPersonagem=='BRANCA_NEVE'
                                            ? 'selected' : '' }>Branca de Neve</option>
                                        <option value="AURORA" ${param.tipoPersonagem=='AURORA' ? 'selected'
                                            : '' }>Aurora — Bela Adormecida</option>
                                        <option value="ARIEL" ${param.tipoPersonagem=='ARIEL' ? 'selected'
                                            : '' }>Ariel — Pequena Sereia</option>
                                        <option value="BELA" ${param.tipoPersonagem=='BELA' ? 'selected'
                                            : '' }>Bela — A Bela e a Fera</option>
                                        <option value="RAPUNZEL" ${param.tipoPersonagem=='RAPUNZEL'
                                            ? 'selected' : '' }>Rapunzel</option>
                                        <option value="MOANA" ${param.tipoPersonagem=='MOANA' ? 'selected'
                                            : '' }>Moana</option>
                                        <option value="ELSA" ${param.tipoPersonagem=='ELSA' ? 'selected'
                                            : '' }>Elsa — Frozen</option>
                                        <option value="ANA" ${param.tipoPersonagem=='ANA' ? 'selected' : ''
                                            }>Ana — Frozen</option>
                                    </optgroup>
                                    <optgroup label="🦸 Super-Heróis">
                                        <option value="HOMEM_ARANHA" ${param.tipoPersonagem=='HOMEM_ARANHA'
                                            ? 'selected' : '' }>Homem-Aranha</option>
                                        <option value="BATMAN" ${param.tipoPersonagem=='BATMAN' ? 'selected'
                                            : '' }>Batman</option>
                                        <option value="SUPERMAN" ${param.tipoPersonagem=='SUPERMAN'
                                            ? 'selected' : '' }>Superman</option>
                                        <option value="CAPITAO_AMERICA"
                                            ${param.tipoPersonagem=='CAPITAO_AMERICA' ? 'selected' : '' }>
                                            Capitão América</option>
                                        <option value="MULHER_MARAVILHA"
                                            ${param.tipoPersonagem=='MULHER_MARAVILHA' ? 'selected' : '' }>
                                            Mulher-Maravilha</option>
                                        <option value="HOMEM_FERRO" ${param.tipoPersonagem=='HOMEM_FERRO'
                                            ? 'selected' : '' }>Homem de Ferro</option>
                                        <option value="THOR" ${param.tipoPersonagem=='THOR' ? 'selected'
                                            : '' }>Thor</option>
                                        <option value="HULK" ${param.tipoPersonagem=='HULK' ? 'selected'
                                            : '' }>Hulk</option>
                                        <option value="PANTERA_NEGRA"
                                            ${param.tipoPersonagem=='PANTERA_NEGRA' ? 'selected' : '' }>
                                            Pantera Negra</option>
                                    </optgroup>
                                    <optgroup label="🐭 Personagens Clássicos">
                                        <option value="MICKEY" ${param.tipoPersonagem=='MICKEY' ? 'selected'
                                            : '' }>Mickey Mouse</option>
                                        <option value="MINNIE" ${param.tipoPersonagem=='MINNIE' ? 'selected'
                                            : '' }>Minnie Mouse</option>
                                        <option value="PATO_DONALD" ${param.tipoPersonagem=='PATO_DONALD'
                                            ? 'selected' : '' }>Pato Donald</option>
                                        <option value="PATETA" ${param.tipoPersonagem=='PATETA' ? 'selected'
                                            : '' }>Pateta</option>
                                        <option value="PEPPA_PIG" ${param.tipoPersonagem=='PEPPA_PIG'
                                            ? 'selected' : '' }>Peppa Pig</option>
                                        <option value="BOB_ESPONJA" ${param.tipoPersonagem=='BOB_ESPONJA'
                                            ? 'selected' : '' }>Bob Esponja</option>
                                    </optgroup>
                                    <optgroup label="🎪 Outros">
                                        <option value="PALHACO" ${param.tipoPersonagem=='PALHACO'
                                            ? 'selected' : '' }>Palhaço</option>
                                        <option value="FADA" ${param.tipoPersonagem=='FADA' ? 'selected'
                                            : '' }>Fada</option>
                                        <option value="COWBOY" ${param.tipoPersonagem=='COWBOY' ? 'selected'
                                            : '' }>Cowboy</option>
                                        <option value="PIRATA" ${param.tipoPersonagem=='PIRATA' ? 'selected'
                                            : '' }>Pirata</option>
                                        <option value="MAGO" ${param.tipoPersonagem=='MAGO' ? 'selected'
                                            : '' }>Mago</option>
                                    </optgroup>
                                </select>
                            </div>
                            <span class="field-error" id="tipoPersonagemError">Selecione o personagem que
                                você interpreta.</span>
                        </div>

                        <div class="form-group">
                            <label for="valorHora">Valor por hora</label>
                            <div class="input-wrapper">
                                <span class="input-icon">💰</span>
                                <input type="text" id="valorHora" name="valorHora" class="form-control"
                                    placeholder="R$ 0,00" inputmode="numeric"
                                    value="<c:out value='${param.valorHora}'/>">
                            </div>
                            <span class="field-error" id="valorHoraError">Informe um valor por hora
                                válido.</span>
                        </div>
                    </div>

                <%-- Nome completo --%>
                    <div class="form-group">
                        <label for="nome">Nome completo</label>
                        <div class="input-wrapper">
                            <span class="input-icon">👤</span>
                            <input type="text" id="nome" name="nome" class="form-control"
                                placeholder="Seu nome completo" autocomplete="name"
                                value="<c:out value='${param.nome}'/>">
                        </div>
                        <span class="field-error" id="nomeError">Informe seu nome completo.</span>
                    </div>

                <%-- E-mail e Telefone --%>
                    <div class="form-row-2">
                        <div class="form-group">
                            <label for="email">E-mail</label>
                            <div class="input-wrapper">
                                <span class="input-icon">📧</span>
                                <input type="email" id="email" name="email" class="form-control"
                                    placeholder="seu@email.com" autocomplete="email"
                                    value="<c:out value='${param.email}'/>">
                            </div>
                            <span class="field-error" id="emailError">E-mail inválido.</span>
                        </div>

                        <div class="form-group">
                            <label for="telefone">
                                Telefone
                                <span class="label-optional">(opcional)</span>
                            </label>
                            <div class="input-wrapper">
                                <span class="input-icon">📱</span>
                                <input type="tel" id="telefone" name="telefone" class="form-control"
                                    placeholder="(00) 00000-0000" autocomplete="tel" maxlength="15"
                                    value="<c:out value='${param.telefone}'/>">
                            </div>
                        </div>
                    </div>

                <%-- CPF --%>
                    <div class="form-group">
                        <label for="cpf">CPF</label>
                        <div class="input-wrapper">
                            <span class="input-icon">🪪</span>
                            <input type="text" id="cpf" name="cpf" class="form-control"
                                placeholder="000.000.000-00" maxlength="14" autocomplete="off"
                                value="<c:out value='${param.cpf}'/>">
                        </div>
                        <span class="field-error" id="cpfError">Informe um CPF válido.</span>
                    </div>

                <%-- Senha --%>
                    <div class="form-group">
                        <label for="senha">Senha</label>
                        <div class="input-wrapper">
                            <span class="input-icon">🔒</span>
                            <input type="password" id="senha" name="senha"
                                class="form-control" placeholder="Mínimo 8 caracteres"
                                autocomplete="new-password">
                            <button type="button" class="toggle-password"
                                aria-label="Mostrar ou ocultar senha"
                                data-target="senha">👁️</button>
                        </div>
                        <div class="password-strength">
                            <div class="strength-bar">
                                <div class="strength-fill" id="strengthFill"></div>
                            </div>
                            <span class="strength-text" id="strengthText"></span>
                        </div>
                        <span class="field-error" id="senhaError">A senha deve ter pelo
                            menos 8 caracteres.</span>
                    </div>

                <%-- Confirmar senha --%>
                    <div class="form-group">
                        <label for="confirmarSenha">Confirmar senha</label>
                        <div class="input-wrapper">
                            <span class="input-icon">🔑</span>
                            <input type="password" id="confirmarSenha"
                                name="confirmarSenha" class="form-control"
                                placeholder="Repita a senha"
                                autocomplete="new-password">
                            <button type="button" class="toggle-password"
                                aria-label="Mostrar ou ocultar confirmação de senha"
                                data-target="confirmarSenha">👁️</button>
                        </div>
                        <span class="field-error" id="confirmarSenhaError">As senhas não
                            coincidem.</span>
                    </div>

                <%-- Termos --%>
                    <div class="terms-group">
                        <label class="checkbox-label">
                            <input type="checkbox" id="termos" name="termos">
                            Li e concordo com os
                            <a href="${pageContext.request.contextPath}/termos-de-uso"
                                target="_blank">Termos de Uso</a>
                            e a
                            <a href="${pageContext.request.contextPath}/politica-de-privacidade"
                                target="_blank">Política de Privacidade</a>.
                        </label>
                        <span class="field-error" id="termosError">Você precisa
                            aceitar os termos para continuar.</span>
                    </div>

                <button type="submit" class="btn-auth" id="btnCadastrar">Criar minha conta</button>
            </form>

            <div class="divider">já tem conta?</div>

            <p class="auth-footer-text">
                <a href="${pageContext.request.contextPath}/auth?acao=login">Entrar na minha conta</a>
            </p>

            <a href="${pageContext.request.contextPath}/" class="back-link">← Voltar para a página inicial</a>

        </div>
    </main>

    <script>
        function selecionarTipo(card) {
            document.querySelectorAll('.role-card').forEach(function (c) {
                c.classList.remove('role-card--selected');
            });
            card.classList.add('role-card--selected');
            var radio = card.querySelector('input[type="radio"]');
            radio.checked = true;
            var section = document.getElementById('personagemSection');
            if (radio.value === 'personagem') {
                section.classList.add('personagem-section--visible');
            } else {
                section.classList.remove('personagem-section--visible');
            }
        }
    </script>
    <script src="${pageContext.request.contextPath}/assets/js/cadastro.js"></script>

</body>

</html>