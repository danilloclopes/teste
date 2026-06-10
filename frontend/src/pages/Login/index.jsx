import { useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { useAuth } from '../../context/AuthContext'

export default function Login() {
  const [email, setEmail]   = useState('')
  const [senha, setSenha]   = useState('')
  const [erro, setErro]     = useState('')
  const [loading, setLoading] = useState(false)
  const { login } = useAuth()
  const navigate  = useNavigate()

  async function handleSubmit(e) {
    e.preventDefault()
    setErro('')
    setLoading(true)
    try {
      await login(email, senha)
      navigate('/dashboard')
    } catch (err) {
      setErro(err.message)
    } finally {
      setLoading(false)
    }
  }

  return (
    <main className="auth-page">
      <div className="auth-card">
        <div className="auth-logo">
          <span className="logo-icon">🎭</span>
          <span className="logo-text">MagicFest</span>
          <p className="logo-sub">Personagens que encantam festas</p>
        </div>

        <h1 className="auth-title">Bem-vindo de volta!</h1>

        {erro && (
          <div className="alert alert-error" role="alert">
            <span>⚠️</span> {erro}
          </div>
        )}

        <form onSubmit={handleSubmit} noValidate>
          <div className="form-group">
            <label htmlFor="email">E-mail</label>
            <div className="input-wrapper">
              <span className="input-icon">📧</span>
              <input
                id="email"
                type="email"
                className="form-control"
                placeholder="seu@email.com"
                value={email}
                onChange={e => setEmail(e.target.value)}
                required
              />
            </div>
          </div>

          <div className="form-group">
            <label htmlFor="senha">Senha</label>
            <div className="input-wrapper">
              <span className="input-icon">🔒</span>
              <input
                id="senha"
                type="password"
                className="form-control"
                placeholder="Sua senha"
                value={senha}
                onChange={e => setSenha(e.target.value)}
                required
              />
            </div>
          </div>

          <button type="submit" className="btn-auth" disabled={loading}>
            {loading ? 'Entrando…' : 'Entrar na minha conta'}
          </button>
        </form>

        <div className="divider">ou</div>

        <p className="auth-footer-text">
          Ainda não tem conta? <Link to="/cadastro">Criar conta grátis</Link>
        </p>
        <Link to="/" className="back-link">← Voltar para a página inicial</Link>
      </div>
    </main>
  )
}
