import { useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { api } from '../../services/api'
import styles from './styles.module.css'

export default function Cadastro() {
  const [form, setForm]     = useState({ nome: '', email: '', senha: '', cpf: '' })
  const [erro, setErro]     = useState('')
  const [loading, setLoading] = useState(false)
  const navigate = useNavigate()

  function handleChange(e) {
    setForm(prev => ({ ...prev, [e.target.name]: e.target.value }))
  }

  async function handleSubmit(e) {
    e.preventDefault()
    setErro('')
    setLoading(true)
    try {
      await api.post('/auth/cadastro', form)
      navigate('/login?sucesso=1')
    } catch (err) {
      setErro(err.message)
    } finally {
      setLoading(false)
    }
  }

  return (
    <main className={styles.authPage}>
      <div className={styles.authCard}>
        <div className={styles.authLogo}>
          <span className={styles.logoIcon}>🎭</span>
          <span className={styles.logoText}>MagicFest</span>
          <p className={styles.logoSub}>Personagens que encantam festas</p>
        </div>

        <h1 className={styles.authTitle}>Criar minha conta</h1>

        {erro && (
          <div className="alert alert-error" role="alert">
            <span>⚠️</span> {erro}
          </div>
        )}

        <form onSubmit={handleSubmit} noValidate>
          <div className="form-group">
            <label>Nome completo</label>
            <div className="input-wrapper">
              <span className="input-icon">👤</span>
              <input name="nome" type="text" className="form-control" placeholder="Seu nome"
                value={form.nome} onChange={handleChange} required />
            </div>
          </div>

          <div className="form-group">
            <label>E-mail</label>
            <div className="input-wrapper">
              <span className="input-icon">📧</span>
              <input name="email" type="email" className="form-control" placeholder="seu@email.com"
                value={form.email} onChange={handleChange} required />
            </div>
          </div>

          <div className="form-group">
            <label>CPF</label>
            <div className="input-wrapper">
              <span className="input-icon">🪪</span>
              <input name="cpf" type="text" className="form-control" placeholder="000.000.000-00"
                value={form.cpf} onChange={handleChange} required />
            </div>
          </div>

          <div className="form-group">
            <label>Senha</label>
            <div className="input-wrapper">
              <span className="input-icon">🔒</span>
              <input name="senha" type="password" className="form-control" placeholder="Crie uma senha"
                value={form.senha} onChange={handleChange} required />
            </div>
          </div>

          <button type="submit" className="btn-auth" disabled={loading}>
            {loading ? 'Criando conta…' : 'Criar conta grátis'}
          </button>
        </form>

        <div className={styles.divider}>ou</div>

        <p className={styles.authFooterText}>
          Já tem uma conta? <Link to="/login">Entrar</Link>
        </p>
        <Link to="/" className={styles.backLink}>← Voltar para a página inicial</Link>
      </div>
    </main>
  )
}
