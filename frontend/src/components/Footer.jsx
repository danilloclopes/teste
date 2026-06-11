import { Link } from "react-router-dom";
import SocialDisplay from './SocialDisplay'
import FooterInfoText from "./FooterInfoText";

export default function Footer() {
	const year = new Date().getFullYear();

	return (
		<footer className="footer">
			<div className="container">
				<section className="footer-grid">
					<div className="footer-brand">
						<Link
							to="/"
							className="nav-logo footer-logo">
							<span className="logo-icon">🎭</span>
							MagicFest
						</Link>
						<p className="footer-desc">
							Transformamos festas em memórias eternas.
							Personagens de qualidade, atendimento humanizado e
							uma experiência que toda criança merece.
						</p>
						<div className="footer-social">
                            <SocialDisplay title={"Instagram"} icon={"📸"}/>
                            <SocialDisplay title={"Facebook"} icon={"👍"}/>
                            <SocialDisplay title={"WhatsApp"} icon={"💬"}/>
						</div>
					</div>

					<div>
						<h3 className="footer-col-title">Navegação</h3>
						<nav className="footer-links">
                            <Link to="/">Início</Link>
                            <Link to="/#como-funciona">Como Funciona</Link>
                            <Link to="/#depoimentos">Depoimentos</Link>
						</nav>
					</div>

					<div>
						<h3 className="footer-col-title">Conta</h3>
						<nav className="footer-links">
                            <Link to="/cadastro">Criar conta</Link>
                            <Link to="/login">Entrar</Link>
                            <Link to="/agendar">Fazer reserva</Link>
                            <Link to="/perfil">Meu perfil</Link>
						</nav>
					</div>

					<div>
						<h3 className="footer-col-title">Contato</h3>
                        <FooterInfoText icon={"📍"} text={"Sua Cidade, Estado"}/>
                        <FooterInfoText icon={"📧"} text={"contato@magicfest.com.br"}/>
                        <FooterInfoText icon={"📞"} text={"(00) 0 0000-0000"}/>
                        <FooterInfoText icon={"⏰"} text={"Seg–Sáb, 8h–20h"}/>
					</div>
				</section>

				<div className="footer-bottom">
					<p className="footer-copyright">© {year} MagicFest. Todos os direitos reservados.</p>
					<nav className="footer-bottom-links">
						<Link to="/politica-de-privacidade">Política de Privacidade</Link>
						<Link to="/termos-de-uso">Termos de Uso</Link>
					</nav>
				</div>
			</div>
		</footer>
	);
}
