<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta name="description"
        content="MagicFest — Aluguel de personagens para festas infantis, temáticas e eventos. Princesas, super-heróis, animados e muito mais!" />
    <title>MagicFest | Aluguel de Personagens para Festas</title>

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

        .btn-secondary {
            background: linear-gradient(135deg, var(--secondary), #D97706);
            color: var(--white);
            box-shadow: 0 4px 20px rgba(245, 158, 11, 0.3);
        }

        .btn-secondary:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 30px rgba(245, 158, 11, 0.45);
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

        .btn-lg {
            padding: 16px 36px;
            font-size: 1.05rem;
        }

        .fade-in {
            transition: opacity 0.6s ease, transform 0.6s ease;
        }

        .js-anim .fade-in {
            opacity: 0;
            transform: translateY(30px);
        }

        .js-anim .fade-in.visible {
            opacity: 1;
            transform: translateY(0);
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

        .hero {
            position: relative;
            min-height: 100vh;
            display: flex;
            align-items: center;
            overflow: hidden;
            background: linear-gradient(135deg, #4C1D95 0%, #7C3AED 40%, #A855F7 70%, #EC4899 100%);
            padding-top: 80px;
        }

        .hero-bg-shapes {
            position: absolute;
            inset: 0;
            pointer-events: none;
            overflow: hidden;
        }

        .hero-shape {
            position: absolute;
            border-radius: 50%;
            opacity: 0.15;
            animation: float 6s ease-in-out infinite;
        }

        .hero-shape-1 {
            width: 400px;
            height: 400px;
            background: var(--secondary);
            top: -100px;
            right: -100px;
            animation-delay: 0s;
        }

        .hero-shape-2 {
            width: 250px;
            height: 250px;
            background: var(--accent-light);
            bottom: -50px;
            left: -50px;
            animation-delay: 2s;
        }

        .hero-shape-3 {
            width: 150px;
            height: 150px;
            background: var(--secondary-light);
            top: 30%;
            left: 10%;
            animation-delay: 4s;
        }

        @keyframes float {

            0%,
            100% {
                transform: translateY(0) scale(1);
            }

            50% {
                transform: translateY(-20px) scale(1.05);
            }
        }

        .hero-inner {
            position: relative;
            z-index: 2;
            display: grid;
            grid-template-columns: 1fr 1fr;
            align-items: center;
            gap: 60px;
            width: 100%;
        }

        .hero-content {
            color: var(--white);
        }

        .hero-badge {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: rgba(255, 255, 255, 0.15);
            border: 1px solid rgba(255, 255, 255, 0.25);
            border-radius: var(--radius-full);
            padding: 8px 18px;
            font-family: var(--font-heading);
            font-weight: 700;
            font-size: 0.85rem;
            color: var(--secondary-light);
            margin-bottom: 24px;
            backdrop-filter: blur(8px);
        }

        .hero-badge .dot {
            width: 8px;
            height: 8px;
            background: var(--secondary);
            border-radius: 50%;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {

            0%,
            100% {
                transform: scale(1);
                opacity: 1;
            }

            50% {
                transform: scale(1.4);
                opacity: 0.7;
            }
        }

        .hero-title {
            font-family: var(--font-heading);
            font-weight: 900;
            font-size: clamp(2.2rem, 5vw, 3.6rem);
            line-height: 1.1;
            margin-bottom: 20px;
            color: var(--white);
        }

        .hero-title .highlight {
            display: block;
            background: linear-gradient(135deg, var(--secondary-light), var(--secondary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .hero-description {
            font-size: 1.05rem;
            color: rgba(255, 255, 255, 0.85);
            margin-bottom: 36px;
            max-width: 480px;
            line-height: 1.7;
        }

        .hero-actions {
            display: flex;
            align-items: center;
            gap: 16px;
            flex-wrap: wrap;
            margin-bottom: 48px;
        }

        .hero-stats {
            display: flex;
            gap: 36px;
            flex-wrap: wrap;
        }

        .hero-stat {
            display: flex;
            flex-direction: column;
        }

        .hero-stat-number {
            font-family: var(--font-heading);
            font-weight: 900;
            font-size: 1.8rem;
            color: var(--secondary-light);
            line-height: 1;
        }

        .hero-stat-label {
            font-size: 0.8rem;
            color: rgba(255, 255, 255, 0.7);
            font-weight: 500;
        }

        .hero-visual {
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .hero-cards-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
            max-width: 400px;
        }

        .hero-char-card {
            background: rgba(255, 255, 255, 0.12);
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: var(--radius-lg);
            padding: 24px 16px;
            text-align: center;
            color: var(--white);
            transition: transform 0.3s ease;
            animation: cardFloat var(--delay, 4s) ease-in-out infinite;
        }

        .hero-char-card:hover {
            transform: translateY(-8px) scale(1.03);
        }

        .hero-char-card:nth-child(1) {
            --delay: 4s;
        }

        .hero-char-card:nth-child(2) {
            --delay: 5s;
            animation-delay: 0.5s;
        }

        .hero-char-card:nth-child(3) {
            --delay: 4.5s;
            animation-delay: 1s;
        }

        .hero-char-card:nth-child(4) {
            --delay: 5.5s;
            animation-delay: 1.5s;
        }

        @keyframes cardFloat {

            0%,
            100% {
                transform: translateY(0);
            }

            50% {
                transform: translateY(-10px);
            }
        }

        .hero-char-emoji {
            font-size: 3rem;
            margin-bottom: 8px;
            display: block;
        }

        .hero-char-name {
            font-family: var(--font-heading);
            font-weight: 800;
            font-size: 0.85rem;
        }

        .hero-char-tag {
            display: inline-block;
            background: rgba(255, 255, 255, 0.15);
            border-radius: var(--radius-full);
            padding: 2px 10px;
            font-size: 0.7rem;
            margin-top: 4px;
            color: var(--secondary-light);
        }

        .how-it-works {
            padding: 96px 0;
            background: var(--white);
        }

        .steps-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 32px;
            margin-top: 56px;
        }

        .step-card {
            position: relative;
            text-align: center;
            padding: 40px 28px;
            border-radius: var(--radius-lg);
            background: var(--bg-section);
            border: 1px solid var(--border);
            transition: transform var(--transition), box-shadow var(--transition);
        }

        .step-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 16px 40px var(--shadow);
        }

        .step-number {
            position: absolute;
            top: -20px;
            left: 50%;
            transform: translateX(-50%);
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, var(--primary), var(--accent));
            color: var(--white);
            border-radius: 50%;
            font-family: var(--font-heading);
            font-weight: 900;
            font-size: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 16px var(--shadow);
        }

        .step-icon {
            width: 72px;
            height: 72px;
            background: linear-gradient(135deg, var(--primary-light), var(--accent-light));
            border-radius: var(--radius-md);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            margin: 0 auto 20px;
        }

        .step-title {
            font-family: var(--font-heading);
            font-weight: 800;
            font-size: 1.15rem;
            color: var(--text-dark);
            margin-bottom: 10px;
        }

        .step-desc {
            font-size: 0.9rem;
            color: var(--text-medium);
            line-height: 1.65;
        }

        .steps-grid .step-card:not(:last-child)::after {
            content: '→';
            position: absolute;
            right: -24px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 1.5rem;
            color: var(--primary-light);
            z-index: 1;
        }

        .characters {
            padding: 96px 0;
            background: var(--bg-section);
        }

        .chars-filter {
            display: flex;
            justify-content: center;
            gap: 12px;
            margin-bottom: 48px;
            flex-wrap: wrap;
        }

        .filter-btn {
            padding: 9px 22px;
            border-radius: var(--radius-full);
            border: 2px solid var(--border);
            background: var(--white);
            color: var(--text-medium);
            font-family: var(--font-heading);
            font-weight: 700;
            font-size: 0.85rem;
            cursor: pointer;
            transition: var(--transition);
        }

        .filter-btn:hover,
        .filter-btn.active {
            background: var(--primary);
            border-color: var(--primary);
            color: var(--white);
        }

        .chars-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 24px;
        }

        .char-card {
            background: var(--white);
            border-radius: var(--radius-lg);
            overflow: hidden;
            box-shadow: 0 4px 20px var(--shadow);
            transition: transform var(--transition), box-shadow var(--transition);
            cursor: pointer;
        }

        .char-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 50px var(--shadow-hover);
        }

        .char-card-img {
            height: 200px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 5rem;
            position: relative;
            overflow: hidden;
        }

        .char-card:nth-child(1) .char-card-img {
            background: linear-gradient(135deg, #FFF0F9, #FFD6F0);
        }

        .char-card:nth-child(2) .char-card-img {
            background: linear-gradient(135deg, #EFF6FF, #DBEAFE);
        }

        .char-card:nth-child(3) .char-card-img {
            background: linear-gradient(135deg, #F0FDF4, #DCFCE7);
        }

        .char-card:nth-child(4) .char-card-img {
            background: linear-gradient(135deg, #FFF7ED, #FED7AA);
        }

        .char-card:nth-child(5) .char-card-img {
            background: linear-gradient(135deg, #F5F3FF, #EDE9FE);
        }

        .char-card:nth-child(6) .char-card-img {
            background: linear-gradient(135deg, #FFFBEB, #FEF3C7);
        }

        .char-badge {
            position: absolute;
            top: 12px;
            right: 12px;
            background: var(--accent);
            color: var(--white);
            font-family: var(--font-heading);
            font-weight: 800;
            font-size: 0.7rem;
            padding: 4px 10px;
            border-radius: var(--radius-full);
        }

        .char-card-body {
            padding: 20px;
        }

        .char-category {
            font-size: 0.75rem;
            font-weight: 600;
            color: var(--primary-light);
            text-transform: uppercase;
            letter-spacing: 0.05em;
            margin-bottom: 4px;
        }

        .char-name {
            font-family: var(--font-heading);
            font-weight: 900;
            font-size: 1.15rem;
            color: var(--text-dark);
            margin-bottom: 6px;
        }

        .char-desc {
            font-size: 0.85rem;
            color: var(--text-medium);
            margin-bottom: 16px;
            line-height: 1.5;
        }

        .char-card-footer {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .char-price {
            display: flex;
            flex-direction: column;
        }

        .char-price-label {
            font-size: 0.7rem;
            color: var(--text-light);
        }

        .char-price-value {
            font-family: var(--font-heading);
            font-weight: 900;
            font-size: 1.25rem;
            color: var(--primary);
        }

        .char-btn {
            padding: 8px 18px;
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            color: var(--white);
            border: none;
            border-radius: var(--radius-full);
            font-family: var(--font-heading);
            font-weight: 700;
            font-size: 0.85rem;
            cursor: pointer;
            transition: var(--transition);
        }

        .char-btn:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 16px var(--shadow);
        }

        .chars-cta {
            text-align: center;
            margin-top: 48px;
        }

        .benefits {
            padding: 96px 0;
            background: linear-gradient(135deg, #4C1D95 0%, #7C3AED 60%, #A855F7 100%);
            color: var(--white);
            position: relative;
            overflow: hidden;
        }

        .benefits::before {
            content: '';
            position: absolute;
            top: -80px;
            right: -80px;
            width: 360px;
            height: 360px;
            background: rgba(245, 158, 11, 0.12);
            border-radius: 50%;
        }

        .benefits::after {
            content: '';
            position: absolute;
            bottom: -80px;
            left: -80px;
            width: 280px;
            height: 280px;
            background: rgba(236, 72, 153, 0.12);
            border-radius: 50%;
        }

        .benefits .section-tag {
            background: rgba(255, 255, 255, 0.15);
            color: var(--secondary-light);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .benefits .section-title {
            color: var(--white);
        }

        .benefits .section-subtitle {
            color: rgba(255, 255, 255, 0.75);
        }

        .benefits-grid {
            position: relative;
            z-index: 1;
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 24px;
        }

        .benefit-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.18);
            border-radius: var(--radius-lg);
            padding: 32px 24px;
            text-align: center;
            transition: transform var(--transition), background var(--transition);
        }

        .benefit-card:hover {
            transform: translateY(-6px);
            background: rgba(255, 255, 255, 0.18);
        }

        .benefit-icon {
            font-size: 2.5rem;
            margin-bottom: 16px;
            display: block;
        }

        .benefit-title {
            font-family: var(--font-heading);
            font-weight: 800;
            font-size: 1rem;
            color: var(--white);
            margin-bottom: 8px;
        }

        .benefit-desc {
            font-size: 0.85rem;
            color: rgba(255, 255, 255, 0.75);
            line-height: 1.6;
        }

        .testimonials {
            padding: 96px 0;
            background: var(--white);
        }

        .testimonials-slider {
            position: relative;
            overflow: hidden;
        }

        .testimonials-track {
            display: flex;
            transition: transform 0.5s ease;
            gap: 24px;
        }

        .testimonial-card {
            flex: 0 0 calc(33.333% - 16px);
            background: var(--bg-section);
            border: 1px solid var(--border);
            border-radius: var(--radius-lg);
            padding: 32px;
            position: relative;
        }

        .testimonial-card::before {
            content: '"';
            position: absolute;
            top: -10px;
            left: 24px;
            font-family: var(--font-heading);
            font-size: 5rem;
            color: var(--primary-light);
            line-height: 1;
            opacity: 0.4;
        }

        .stars {
            display: flex;
            gap: 4px;
            margin-bottom: 14px;
            color: var(--secondary);
            font-size: 1rem;
        }

        .testimonial-text {
            font-size: 0.9rem;
            color: var(--text-medium);
            line-height: 1.7;
            margin-bottom: 20px;
            font-style: italic;
        }

        .testimonial-author {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .author-avatar {
            width: 44px;
            height: 44px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--primary-light), var(--accent-light));
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: var(--font-heading);
            font-weight: 900;
            font-size: 1rem;
            color: var(--primary-dark);
            flex-shrink: 0;
        }

        .author-name {
            font-family: var(--font-heading);
            font-weight: 800;
            font-size: 0.9rem;
            color: var(--text-dark);
        }

        .author-role {
            font-size: 0.78rem;
            color: var(--text-light);
        }

        .slider-controls {
            display: flex;
            justify-content: center;
            gap: 8px;
            margin-top: 36px;
        }

        .slider-dot {
            width: 10px;
            height: 10px;
            border-radius: 50%;
            background: var(--border);
            cursor: pointer;
            transition: var(--transition);
            border: none;
        }

        .slider-dot.active {
            background: var(--primary);
            width: 28px;
            border-radius: var(--radius-full);
        }

        .cta-section {
            padding: 96px 0;
            background: var(--bg-section);
        }

        .cta-box {
            background: linear-gradient(135deg, var(--primary-dark), var(--primary), var(--accent));
            border-radius: var(--radius-lg);
            padding: 64px 48px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .cta-box::before {
            content: '🎉';
            position: absolute;
            font-size: 8rem;
            top: -20px;
            left: -20px;
            opacity: 0.08;
            line-height: 1;
        }

        .cta-box::after {
            content: '🎊';
            position: absolute;
            font-size: 8rem;
            bottom: -20px;
            right: -20px;
            opacity: 0.08;
            line-height: 1;
        }

        .cta-title {
            font-family: var(--font-heading);
            font-weight: 900;
            font-size: clamp(1.8rem, 3.5vw, 2.8rem);
            color: var(--white);
            margin-bottom: 16px;
        }

        .cta-desc {
            font-size: 1rem;
            color: rgba(255, 255, 255, 0.85);
            max-width: 520px;
            margin: 0 auto 36px;
            line-height: 1.7;
        }

        .cta-actions {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 16px;
            flex-wrap: wrap;
        }

        .btn-white {
            background: var(--white);
            color: var(--primary-dark);
            padding: 14px 32px;
            border-radius: var(--radius-full);
            font-family: var(--font-heading);
            font-weight: 800;
            font-size: 1rem;
            cursor: pointer;
            border: none;
            transition: var(--transition);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
        }

        .btn-white:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.3);
        }

        .btn-ghost {
            background: transparent;
            color: var(--white);
            padding: 14px 32px;
            border-radius: var(--radius-full);
            border: 2px solid rgba(255, 255, 255, 0.6);
            font-family: var(--font-heading);
            font-weight: 800;
            font-size: 1rem;
            cursor: pointer;
            transition: var(--transition);
        }

        .btn-ghost:hover {
            background: rgba(255, 255, 255, 0.1);
            border-color: var(--white);
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

        .footer-contact-item .icon {
            font-size: 1rem;
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

        .scroll-top {
            position: fixed;
            bottom: 32px;
            right: 32px;
            width: 46px;
            height: 46px;
            background: linear-gradient(135deg, var(--primary), var(--accent));
            color: var(--white);
            border: none;
            border-radius: 50%;
            font-size: 1.2rem;
            cursor: pointer;
            box-shadow: 0 4px 20px var(--shadow);
            transition: var(--transition);
            opacity: 0;
            pointer-events: none;
            z-index: 100;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .scroll-top.visible {
            opacity: 1;
            pointer-events: all;
        }

        .scroll-top:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 28px var(--shadow-hover);
        }

        @media (max-width: 1024px) {
            .benefits-grid {
                grid-template-columns: repeat(2, 1fr);
            }

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

            .hero-inner {
                grid-template-columns: 1fr;
                text-align: center;
                gap: 40px;
            }

            .hero-description {
                margin-left: auto;
                margin-right: auto;
            }

            .hero-actions {
                justify-content: center;
            }

            .hero-stats {
                justify-content: center;
            }

            .hero-visual {
                order: -1;
            }

            .hero-cards-grid {
                max-width: 320px;
                margin: 0 auto;
                gap: 12px;
            }

            .steps-grid {
                grid-template-columns: 1fr;
                max-width: 420px;
                margin-left: auto;
                margin-right: auto;
            }

            .steps-grid .step-card::after {
                display: none;
            }

            .chars-grid {
                grid-template-columns: 1fr 1fr;
            }

            .benefits-grid {
                grid-template-columns: 1fr 1fr;
            }

            .testimonial-card {
                flex: 0 0 calc(100% - 0px);
            }

            .cta-box {
                padding: 48px 24px;
            }

            .footer-grid {
                grid-template-columns: 1fr;
            }

            .footer-bottom {
                flex-direction: column;
                text-align: center;
            }
        }

        @media (max-width: 480px) {
            .chars-grid {
                grid-template-columns: 1fr;
            }

            .benefits-grid {
                grid-template-columns: 1fr;
            }

            .hero-cards-grid {
                grid-template-columns: 1fr 1fr;
                gap: 10px;
            }

            .hero-char-emoji {
                font-size: 2.2rem;
            }
        }

        @media (max-width: 640px) {
            .hero {
                align-items: flex-start;
                padding-top: 96px;
                padding-bottom: 60px;
                min-height: 100vh;
            }
        }
    </style>
</head>

<body>

    <nav class="navbar" id="navbar">
        <div class="container navbar-inner">

            <!-- Logo -->
            <a href="${pageContext.request.contextPath}/" class="nav-logo">
                <div class="logo-icon">🎭</div>
                MagicFest
            </a>

            <!-- Desktop links -->
            <ul class="nav-links">
                <li><a href="#como-funciona">Como Funciona</a></li>
                <li><a href="#personagens">Personagens</a></li>
                <li><a href="#diferenciais">Diferenciais</a></li>
                <li><a href="#depoimentos">Depoimentos</a></li>
            </ul>

            <!-- Desktop actions -->
            <div class="nav-actions">
                <c:choose>
                    <c:when test="${not empty sessionScope.usuarioLogado}">
                        <a href="${pageContext.request.contextPath}/agendamento?acao=dashboard-cliente"
                            class="nav-btn-outline">Meus Agendamentos</a>
                        <a href="${pageContext.request.contextPath}/usuario?acao=perfil"
                            class="nav-btn-outline">Ver Perfil</a>
                        <form action="${pageContext.request.contextPath}/auth" method="post"
                            style="display:inline;">
                            <input type="hidden" name="acao" value="logout">
                            <button type="submit" class="nav-btn-filled"
                                style="cursor:pointer;border:none;">Sair</button>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/auth?acao=login"
                            class="nav-btn-outline">Entrar</a>
                        <a href="${pageContext.request.contextPath}/auth?acao=cadastro"
                            class="nav-btn-filled">Criar conta</a>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- Mobile toggle -->
            <button class="menu-toggle" id="menuToggle" aria-label="Abrir menu">
                <span></span>
                <span></span>
                <span></span>
            </button>

        </div>
    </nav>

    <!-- Mobile nav drawer -->
    <nav class="mobile-nav" id="mobileNav">
        <a href="#como-funciona">Como Funciona</a>
        <a href="#personagens">Personagens</a>
        <a href="#diferenciais">Diferenciais</a>
        <a href="#depoimentos">Depoimentos</a>
        <div class="mobile-nav-actions">
            <c:choose>
                <c:when test="${not empty sessionScope.usuarioLogado}">
                    <a href="${pageContext.request.contextPath}/agendamento?acao=dashboard-cliente"
                        class="btn btn-outline">Agendamentos</a>
                    <form action="${pageContext.request.contextPath}/auth" method="post"
                        style="display:inline;">
                        <input type="hidden" name="acao" value="logout">
                        <button type="submit" class="btn btn-primary"
                            style="cursor:pointer;border:none;">Sair</button>
                    </form>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/auth?acao=login"
                        class="btn btn-outline">Entrar</a>
                    <a href="${pageContext.request.contextPath}/auth?acao=cadastro"
                        class="btn btn-primary">Criar conta</a>
                </c:otherwise>
            </c:choose>
        </div>
    </nav>
    <div class="overlay" id="overlay"></div>

    <section class="hero">
        <div class="hero-bg-shapes">
            <div class="hero-shape hero-shape-1"></div>
            <div class="hero-shape hero-shape-2"></div>
            <div class="hero-shape hero-shape-3"></div>
        </div>

        <div class="container">
            <div class="hero-inner">

                <!-- Content -->
                <div class="hero-content">
                    <div class="hero-badge">
                        <span class="dot"></span>
                        Mais de 500 festas realizadas
                    </div>

                    <h1 class="hero-title">
                        Transforme a festa
                        <span class="highlight">em um sonho</span>
                        inesquecível!
                    </h1>

                    <p class="hero-description">
                        Alugue personagens incríveis para a festa do seu filho. Princesas, super-heróis,
                        animados e muito mais — entregamos magia, alegria e memórias eternas.
                    </p>

                    <div class="hero-actions">
                        <button class="btn btn-secondary btn-lg" data-action="reservar">
                            ✨ Ver Personagens
                        </button>
                        <a href="#como-funciona" class="btn btn-outline btn-lg"
                            style="border-color:rgba(255,255,255,.6);color:#fff;">
                            Como funciona
                        </a>
                    </div>

                    <div class="hero-stats">
                        <div class="hero-stat">
                            <span class="hero-stat-number">500+</span>
                            <span class="hero-stat-label">Festas realizadas</span>
                        </div>
                        <div class="hero-stat">
                            <span class="hero-stat-number">50+</span>
                            <span class="hero-stat-label">Personagens</span>
                        </div>
                        <div class="hero-stat">
                            <span class="hero-stat-number">4.9★</span>
                            <span class="hero-stat-label">Avaliação média</span>
                        </div>
                    </div>
                </div>

                <!-- Visual cards -->
                <div class="hero-visual">
                    <div class="hero-cards-grid">
                        <div class="hero-char-card">
                            <span class="hero-char-emoji">👸</span>
                            <div class="hero-char-name">Princesa</div>
                            <span class="hero-char-tag">Infantil</span>
                        </div>
                        <div class="hero-char-card">
                            <span class="hero-char-emoji">🦸</span>
                            <div class="hero-char-name">Super-herói</div>
                            <span class="hero-char-tag">Ação</span>
                        </div>
                        <div class="hero-char-card">
                            <span class="hero-char-emoji">🐭</span>
                            <div class="hero-char-name">Animados</div>
                            <span class="hero-char-tag">Kids</span>
                        </div>
                        <div class="hero-char-card">
                            <span class="hero-char-emoji">🧙</span>
                            <div class="hero-char-name">Fantasia</div>
                            <span class="hero-char-tag">Temático</span>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <section class="how-it-works" id="como-funciona">
        <div class="container">
            <div class="text-center fade-in">
                <span class="section-tag">Como funciona</span>
                <h2 class="section-title">Simples, rápido e <span>mágico</span></h2>
                <p class="section-subtitle">
                    Em apenas 3 passos você garante o personagem favorito do seu filho na festa mais
                    especial da vida dele.
                </p>
            </div>

            <div class="steps-grid">

                <div class="step-card fade-in">
                    <div class="step-number">1</div>
                    <div class="step-icon">🔍</div>
                    <h3 class="step-title">Escolha o personagem</h3>
                    <p class="step-desc">
                        Navegue pelo nosso catálogo com dezenas de personagens e encontre o favorito da
                        criança — princesas, heróis, animados e mais.
                    </p>
                </div>

                <div class="step-card fade-in" style="transition-delay:.12s;">
                    <div class="step-number">2</div>
                    <div class="step-icon">📅</div>
                    <h3 class="step-title">Faça a reserva</h3>
                    <p class="step-desc">
                        Selecione a data, horário e duração. Confirme sua reserva com segurança pelo nosso
                        sistema e receba a confirmação por e-mail.
                    </p>
                </div>

                <div class="step-card fade-in" style="transition-delay:.24s;">
                    <div class="step-number">3</div>
                    <div class="step-icon">🎉</div>
                    <h3 class="step-title">Curta a magia!</h3>
                    <p class="step-desc">
                        Nosso personagem chega na hora certa, fantasiado e pronto para encantar todas as
                        crianças com brincadeiras e sorrisos!
                    </p>
                </div>

            </div>
        </div>
    </section>

    <section class="characters" id="personagens">
        <div class="container">
            <div class="text-center fade-in">
                <span class="section-tag">Catálogo</span>
                <h2 class="section-title">Personagens em <span>destaque</span></h2>
                <p class="section-subtitle">
                    Mais de 50 personagens disponíveis para tornar qualquer festa inesquecível.
                </p>
            </div>

            <!-- Filter buttons -->
            <div class="chars-filter fade-in">
                <button class="filter-btn active" data-filter="all">Todos</button>
                <button class="filter-btn" data-filter="princesa">Princesas</button>
                <button class="filter-btn" data-filter="heroi">Super-heróis</button>
                <button class="filter-btn" data-filter="animado">Animados</button>
                <button class="filter-btn" data-filter="fantasia">Fantasia</button>
            </div>

            <!-- Cards grid -->
            <div class="chars-grid">

                <div class="char-card fade-in" data-category="princesa">
                    <div class="char-card-img">
                        👸
                        <span class="char-badge">Popular</span>
                    </div>
                    <div class="char-card-body">
                        <div class="char-category">Princesas</div>
                        <h3 class="char-name">Cinderela</h3>
                        <p class="char-desc">A clássica princesa que conquistou o coração de todas as
                            crianças com seu vestido azul e sapatinho de cristal.</p>
                        <div class="char-card-footer">
                            <div class="char-price">
                                <span class="char-price-label">A partir de</span>
                                <span class="char-price-value">R$ 250</span>
                            </div>
                            <button class="char-btn">Reservar</button>
                        </div>
                    </div>
                </div>

                <div class="char-card fade-in" data-category="heroi" style="transition-delay:.08s;">
                    <div class="char-card-img">
                        🕷️
                        <span class="char-badge">Top</span>
                    </div>
                    <div class="char-card-body">
                        <div class="char-category">Super-heróis</div>
                        <h3 class="char-name">Homem-Aranha</h3>
                        <p class="char-desc">O herói amigável da vizinhança vai animar a festa com
                            acrobacias e interações cheias de energia!</p>
                        <div class="char-card-footer">
                            <div class="char-price">
                                <span class="char-price-label">A partir de</span>
                                <span class="char-price-value">R$ 280</span>
                            </div>
                            <button class="char-btn">Reservar</button>
                        </div>
                    </div>
                </div>

                <div class="char-card fade-in" data-category="animado" style="transition-delay:.16s;">
                    <div class="char-card-img">
                        🐭
                    </div>
                    <div class="char-card-body">
                        <div class="char-category">Animados</div>
                        <h3 class="char-name">Mickey Mouse</h3>
                        <p class="char-desc">O rato mais famoso do mundo! Clássico garantido para deixar
                            qualquer criança com um sorriso enorme.</p>
                        <div class="char-card-footer">
                            <div class="char-price">
                                <span class="char-price-label">A partir de</span>
                                <span class="char-price-value">R$ 260</span>
                            </div>
                            <button class="char-btn">Reservar</button>
                        </div>
                    </div>
                </div>

                <div class="char-card fade-in" data-category="princesa" style="transition-delay:.08s;">
                    <div class="char-card-img">
                        ❄️
                    </div>
                    <div class="char-card-body">
                        <div class="char-category">Princesas</div>
                        <h3 class="char-name">Elsa — Frozen</h3>
                        <p class="char-desc">A rainha do gelo vai encantar a festa com sua magia e uma
                            apresentação incrível cheia de brilho.</p>
                        <div class="char-card-footer">
                            <div class="char-price">
                                <span class="char-price-label">A partir de</span>
                                <span class="char-price-value">R$ 290</span>
                            </div>
                            <button class="char-btn">Reservar</button>
                        </div>
                    </div>
                </div>

                <div class="char-card fade-in" data-category="heroi" style="transition-delay:.16s;">
                    <div class="char-card-img">
                        🦇
                    </div>
                    <div class="char-card-body">
                        <div class="char-category">Super-heróis</div>
                        <h3 class="char-name">Batman</h3>
                        <p class="char-desc">O cavaleiro das trevas em versão kids! Fantasia elaborada e
                            muita interação com os pequenos convidados.</p>
                        <div class="char-card-footer">
                            <div class="char-price">
                                <span class="char-price-label">A partir de</span>
                                <span class="char-price-value">R$ 270</span>
                            </div>
                            <button class="char-btn">Reservar</button>
                        </div>
                    </div>
                </div>

                <div class="char-card fade-in" data-category="fantasia" style="transition-delay:.24s;">
                    <div class="char-card-img">
                        🧙
                        <span class="char-badge">Novo</span>
                    </div>
                    <div class="char-card-body">
                        <div class="char-category">Fantasia</div>
                        <h3 class="char-name">Mago Encantador</h3>
                        <p class="char-desc">Mágicas, truques e muita fantasia! Perfeito para festas
                            temáticas e eventos corporativos infantis.</p>
                        <div class="char-card-footer">
                            <div class="char-price">
                                <span class="char-price-label">A partir de</span>
                                <span class="char-price-value">R$ 320</span>
                            </div>
                            <button class="char-btn">Reservar</button>
                        </div>
                    </div>
                </div>

            </div>

            <div class="chars-cta fade-in">
                <a href="${pageContext.request.contextPath}/personagem/lista.jsp"
                    class="btn btn-primary btn-lg">
                    Ver todos os personagens &rarr;
                </a>
            </div>
        </div>
    </section>

    <section class="benefits" id="diferenciais">
        <div class="container">
            <div class="text-center fade-in">
                <span class="section-tag">Nossos diferenciais</span>
                <h2 class="section-title">Por que escolher a <span>MagicFest?</span></h2>
                <p class="section-subtitle">
                    Cada detalhe é pensado para que a festa seja perfeita — do início ao fim.
                </p>
            </div>

            <div class="benefits-grid">

                <div class="benefit-card fade-in">
                    <span class="benefit-icon">🎭</span>
                    <h3 class="benefit-title">Fantasias de Alta Qualidade</h3>
                    <p class="benefit-desc">Figurinos profissionais, detalhados e idênticos aos personagens
                        originais, lavados e higienizados antes de cada uso.</p>
                </div>

                <div class="benefit-card fade-in" style="transition-delay:.08s;">
                    <span class="benefit-icon">⏰</span>
                    <h3 class="benefit-title">Pontualidade Garantida</h3>
                    <p class="benefit-desc">Nossos personagens chegam no horário combinado. Planejamento
                        rigoroso para que tudo ocorra conforme esperado.</p>
                </div>

                <div class="benefit-card fade-in" style="transition-delay:.16s;">
                    <span class="benefit-icon">🛡️</span>
                    <h3 class="benefit-title">Profissionais Qualificados</h3>
                    <p class="benefit-desc">Atores treinados em interação infantil, com verificação de
                        antecedentes e capacitação em primeiros socorros.</p>
                </div>

                <div class="benefit-card fade-in" style="transition-delay:.24s;">
                    <span class="benefit-icon">💰</span>
                    <h3 class="benefit-title">Melhor Custo-Benefício</h3>
                    <p class="benefit-desc">Pacotes para todos os orçamentos, sem taxas escondidas.
                        Transparência total do valor no momento da reserva.</p>
                </div>

            </div>
        </div>
    </section>

    <section class="testimonials" id="depoimentos">
        <div class="container">
            <div class="text-center fade-in">
                <span class="section-tag">Depoimentos</span>
                <h2 class="section-title">O que as famílias <span>dizem</span></h2>
                <p class="section-subtitle">
                    Centenas de famílias já confiaram na MagicFest para tornar momentos especiais ainda mais
                    mágicos.
                </p>
            </div>

            <div class="testimonials-slider fade-in">
                <div class="testimonials-track" id="testimonialsTrack">

                    <div class="testimonial-card">
                        <div class="stars">★★★★★</div>
                        <p class="testimonial-text">
                            "A Cinderela foi simplesmente perfeita! Minha filha ficou com os olhos brilhando
                            o tempo todo. O atendimento desde a reserva até o dia da festa foi impecável.
                            Com certeza vou usar novamente!"
                        </p>
                        <div class="testimonial-author">
                            <div class="author-avatar">AM</div>
                            <div>
                                <div class="author-name">Ana Martins</div>
                                <div class="author-role">Mãe da Maria Eduarda, 5 anos</div>
                            </div>
                        </div>
                    </div>

                    <div class="testimonial-card">
                        <div class="stars">★★★★★</div>
                        <p class="testimonial-text">
                            "O Homem-Aranha chegou 15 minutos antes, super animado! As crianças
                            enlouqueceram. Valeu cada centavo. A plataforma de reserva é muito fácil de
                            usar, fiz tudo pelo celular em minutos."
                        </p>
                        <div class="testimonial-author">
                            <div class="author-avatar">RC</div>
                            <div>
                                <div class="author-name">Ricardo Carvalho</div>
                                <div class="author-role">Pai do Bernardo, 7 anos</div>
                            </div>
                        </div>
                    </div>

                    <div class="testimonial-card">
                        <div class="stars">★★★★★</div>
                        <p class="testimonial-text">
                            "Contratei a Elsa para a festa temática de Frozen da minha neta. Superou todas
                            as expectativas! A fantasia era lindíssima e a atriz ficou duas horas
                            interagindo com todas as crianças."
                        </p>
                        <div class="testimonial-author">
                            <div class="author-avatar">LF</div>
                            <div>
                                <div class="author-name">Lúcia Ferreira</div>
                                <div class="author-role">Vovó da Sofia, 6 anos</div>
                            </div>
                        </div>
                    </div>

                    <div class="testimonial-card">
                        <div class="stars">★★★★★</div>
                        <p class="testimonial-text">
                            "Organizo eventos infantis há 8 anos e a MagicFest é sem dúvida a melhor
                            parceira que tive. Profissionalismo, qualidade e preço justo. Indico a todos os
                            meus clientes!"
                        </p>
                        <div class="testimonial-author">
                            <div class="author-avatar">JS</div>
                            <div>
                                <div class="author-name">Juliana Santos</div>
                                <div class="author-role">Cerimonialista de eventos infantis</div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <!-- Slider dots -->
            <div class="slider-controls">
                <button class="slider-dot active"></button>
                <button class="slider-dot"></button>
                <button class="slider-dot"></button>
                <button class="slider-dot"></button>
            </div>

        </div>
    </section>

    <section class="cta-section">
        <div class="container">
            <div class="cta-box fade-in">
                <h2 class="cta-title">A festa dos sonhos começa aqui 🎉</h2>
                <p class="cta-desc">
                    Não deixe para última hora! Reserve agora o personagem favorito do seu filho e garanta
                    um dia inesquecível para toda a família.
                </p>
                <div class="cta-actions">
                    <button class="btn-white" data-action="reservar">✨ Fazer minha reserva</button>
                    <a href="tel:+5500000000000" class="btn-ghost">📞 Falar pelo WhatsApp</a>
                </div>
            </div>
        </div>
    </section>

    <footer class="footer">
        <div class="container">
            <div class="footer-grid">

                <!-- Brand -->
                <div class="footer-brand">
                    <a href="${pageContext.request.contextPath}/" class="nav-logo"
                        style="margin-bottom:16px;display:inline-flex;">
                        <div class="logo-icon">🎭</div>
                        MagicFest
                    </a>
                    <p class="footer-desc">
                        Transformamos festas em memórias eternas. Personagens de qualidade, atendimento
                        humanizado e uma experiência que toda criança merece.
                    </p>
                    <div class="footer-social">
                        <span class="social-link" title="Instagram">📸</span>
                        <span class="social-link" title="Facebook">👍</span>
                        <span class="social-link" title="WhatsApp">💬</span>
                        <span class="social-link" title="YouTube">▶️</span>
                    </div>
                </div>

                <!-- Links -->
                <div>
                    <div class="footer-col-title">Navegação</div>
                    <ul class="footer-links">
                        <li><a href="${pageContext.request.contextPath}/">Início</a></li>
                        <li><a href="#como-funciona">Como Funciona</a></li>
                        <li><a href="#depoimentos">Depoimentos</a></li>
                    </ul>
                </div>

                <!-- Account -->
                <div>
                    <div class="footer-col-title">Conta</div>
                    <ul class="footer-links">
                        <li><a href="${pageContext.request.contextPath}/auth?acao=cadastro">Criar conta</a>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/auth?acao=login">Entrar</a></li>
                        <li><a href="${pageContext.request.contextPath}/aluguel/novo.jsp">Fazer reserva</a>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/usuario?acao=perfil">Meu perfil</a>
                        </li>
                    </ul>
                </div>

                <!-- Contact -->
                <div>
                    <div class="footer-col-title">Contato</div>
                    <div class="footer-contact-item">
                        <span class="icon">📍</span>
                        <span>Sua Cidade, Estado</span>
                    </div>
                    <div class="footer-contact-item">
                        <span class="icon">📧</span>
                        <span>contato@magicfest.com.br</span>
                    </div>
                    <div class="footer-contact-item">
                        <span class="icon">📞</span>
                        <span>(00) 0 0000-0000</span>
                    </div>
                    <div class="footer-contact-item">
                        <span class="icon">⏰</span>
                        <span>Seg–Sáb, 8h–20h</span>
                    </div>
                </div>

            </div>

            <div class="footer-bottom">
                <p class="footer-copyright">
                    &copy;
                    <fmt:formatDate value="${now}" pattern="yyyy" /> MagicFest. Todos os direitos
                    reservados.
                </p>
                <div class="footer-bottom-links">
                    <a href="${pageContext.request.contextPath}/politica-de-privacidade">Política de
                        Privacidade</a>
                    <a href="${pageContext.request.contextPath}/termos-de-uso">Termos de Uso</a>
                </div>
            </div>
        </div>
    </footer>

    <!-- Scroll-to-top -->
    <button class="scroll-top" id="scrollTopBtn" aria-label="Voltar ao topo">&#8679;</button>

    <!-- Fade-in inline (não depende de arquivo externo) -->
    <script>
        (function () {
            if (!window.IntersectionObserver) {
                document.querySelectorAll('.fade-in').forEach(function (el) { el.style.opacity = '1'; el.style.transform = 'none'; });
                return;
            }
            document.documentElement.classList.add('js-anim');
            var obs = new IntersectionObserver(function (entries) {
                entries.forEach(function (e) {
                    if (e.isIntersecting) { e.target.classList.add('visible'); obs.unobserve(e.target); }
                });
            }, { threshold: 0.05 });
            document.querySelectorAll('.fade-in').forEach(function (el) { obs.observe(el); });
            setTimeout(function () {
                document.querySelectorAll('.fade-in:not(.visible)').forEach(function (el) { el.classList.add('visible'); });
            }, 800);
        })();
    </script>

    <!-- Main JS -->
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

</body>

</html>