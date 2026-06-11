import { Link } from 'react-router-dom'

export default function Footer() {
  const year = new Date().getFullYear()

  return (
    <footer className="footer">
      <div className="container">
        <div className="footer-grid">
          <div className="footer-brand">
            <Link to="/" className="nav-logo footer-logo">
              <span className="logo-icon">🎭</span>
              MagicFest
            </Link>
            <p className="footer-desc">
              Transformamos festas em memórias eternas. Personagens de qualidade, atendimento
              humanizado e uma experiência que toda criança merece.
            </p>
            <div className="footer-social">
              <span className="social-link" title="Instagram">📸</span>
              <span className="social-link" title="Facebook">👍</span>
              <span className="social-link" title="WhatsApp">💬</span>
            </div>
          </div>

          <div>
            <h3 className="footer-col-title">Navegação</h3>
            <ul className="footer-links">
              <li><Link to="/">Início</Link></li>
              <li><a href="/#como-funciona">Como Funciona</a></li>
              <li><a href="/#depoimentos">Depoimentos</a></li>
            </ul>
          </div>

          <div>
            <h3 className="footer-col-title">Conta</h3>
            <ul className="footer-links">
              <li><Link to="/cadastro">Criar conta</Link></li>
              <li><Link to="/login">Entrar</Link></li>
              <li><Link to="/agendar">Fazer reserva</Link></li>
              <li><Link to="/perfil">Meu perfil</Link></li>
            </ul>
          </div>

          <div>
            <h3 className="footer-col-title">Contato</h3>
            <p className="footer-contact-item"><span>📍</span><span>Sua Cidade, Estado</span></p>
            <p className="footer-contact-item"><span>📧</span><span>contato@magicfest.com.br</span></p>
            <p className="footer-contact-item"><span>📞</span><span>(00) 0 0000-0000</span></p>
            <p className="footer-contact-item"><span>⏰</span><span>Seg–Sáb, 8h–20h</span></p>
          </div>
        </div>

        <div className="footer-bottom">
          <p className="footer-copyright">© {year} MagicFest. Todos os direitos reservados.</p>
          <nav className="footer-bottom-links">
            <Link to="/politica-de-privacidade">Política de Privacidade</Link>
            <Link to="/termos-de-uso">Termos de Uso</Link>
          </nav>
        </div>
      </div>
    </footer>
  )
}
