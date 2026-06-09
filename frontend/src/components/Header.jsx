import { useState, useEffect } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import './Header.css'

export default function Header() {
  const { usuario, logout } = useAuth()
  const navigate = useNavigate()
  const [scrolled, setScrolled] = useState(false)
  const [menuOpen, setMenuOpen] = useState(false)

  useEffect(() => {
    const onScroll = () => setScrolled(window.scrollY > 30)
    window.addEventListener('scroll', onScroll)
    return () => window.removeEventListener('scroll', onScroll)
  }, [])

  async function handleLogout() {
    await logout()
    navigate('/')
  }

  return (
    <>
      <nav className={`navbar${scrolled ? ' scrolled' : ''}`}>
        <div className="container navbar-inner">
          <Link to="/" className="nav-logo">
            <div className="logo-icon">🎭</div>
            MagicFest
          </Link>

          <ul className="nav-links">
            <li><a href="/#como-funciona">Como Funciona</a></li>
            <li><a href="/#personagens">Personagens</a></li>
            <li><a href="/#diferenciais">Diferenciais</a></li>
            <li><a href="/#depoimentos">Depoimentos</a></li>
          </ul>

          <div className="nav-actions">
            {usuario ? (
              <>
                <Link to="/dashboard" className="nav-btn-outline">Meus Agendamentos</Link>
                <Link to="/perfil"    className="nav-btn-outline">Ver Perfil</Link>
                <button onClick={handleLogout} className="nav-btn-filled">Sair</button>
              </>
            ) : (
              <>
                <Link to="/login"    className="nav-btn-outline">Entrar</Link>
                <Link to="/cadastro" className="nav-btn-filled">Criar conta</Link>
              </>
            )}
          </div>

          <button
            className={`menu-toggle${menuOpen ? ' open' : ''}`}
            onClick={() => setMenuOpen(v => !v)}
            aria-label="Abrir menu"
          >
            <span /><span /><span />
          </button>
        </div>
      </nav>

      <nav className={`mobile-nav${menuOpen ? ' open' : ''}`}>
        <a href="/#como-funciona" onClick={() => setMenuOpen(false)}>Como Funciona</a>
        <a href="/#personagens"   onClick={() => setMenuOpen(false)}>Personagens</a>
        <a href="/#diferenciais"  onClick={() => setMenuOpen(false)}>Diferenciais</a>
        <a href="/#depoimentos"   onClick={() => setMenuOpen(false)}>Depoimentos</a>
        <div className="mobile-nav-actions">
          {usuario ? (
            <>
              <Link to="/dashboard" className="btn btn-outline" onClick={() => setMenuOpen(false)}>Agendamentos</Link>
              <button onClick={() => { handleLogout(); setMenuOpen(false) }} className="btn btn-primary">Sair</button>
            </>
          ) : (
            <>
              <Link to="/login"    className="btn btn-outline"  onClick={() => setMenuOpen(false)}>Entrar</Link>
              <Link to="/cadastro" className="btn btn-primary"  onClick={() => setMenuOpen(false)}>Criar conta</Link>
            </>
          )}
        </div>
      </nav>

      {menuOpen && <div className="overlay open" onClick={() => setMenuOpen(false)} />}
    </>
  )
}
