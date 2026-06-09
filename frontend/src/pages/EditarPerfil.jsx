import { useState, useEffect } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { api } from '../services/api'
import Header from '../components/Header'
import Footer from '../components/Footer'

export default function EditarPerfil() {
  const [form, setForm]     = useState({ nome: '', email: '', senha: '' })
  const [erro, setErro]     = useState('')
  const [sucesso, setSucesso] = useState(false)
  const [loading, setLoading] = useState(false)
  const navigate = useNavigate()

  useEffect(() => {
    api.get('/usuarios/perfil').then(u => setForm(prev => ({ ...prev, nome: u.nome, email: u.email })))
  }, [])

  function handleChange(e) {
    setForm(prev => ({ ...prev, [e.target.name]: e.target.value }))
  }

  async function handleSubmit(e) {
    e.preventDefault()
    setErro('')
    setLoading(true)
    try {
      await api.put('/usuarios/perfil', form)
      setSucesso(true)
      setTimeout(() => navigate('/perfil'), 1200)
    } catch (err) {
      setErro(err.message)
    } finally {
      setLoading(false)
    }
  }

  return (
    <>
      <Header />
      <div style={{ paddingTop: 80 }}>
        <div className="page-header">
          <div className="container">
            <h1>✏️ Editar Perfil</h1>
            <p>Atualize suas informações pessoais.</p>
          </div>
        </div>

        <div className="page-content">
          <div className="container" style={{ maxWidth: 520 }}>
            {sucesso && <div className="alert alert-success">✅ Perfil atualizado! Redirecionando…</div>}
            {erro    && <div className="alert alert-error">⚠️ {erro}</div>}

            <div className="card">
              <form onSubmit={handleSubmit}>
                <div className="form-group">
                  <label>Nome completo</label>
                  <div className="input-wrapper">
                    <span className="input-icon">👤</span>
                    <input name="nome" type="text" className="form-control"
                      value={form.nome} onChange={handleChange} required />
                  </div>
                </div>

                <div className="form-group">
                  <label>E-mail</label>
                  <div className="input-wrapper">
                    <span className="input-icon">📧</span>
                    <input name="email" type="email" className="form-control"
                      value={form.email} onChange={handleChange} required />
                  </div>
                </div>

                <div className="form-group">
                  <label>Nova senha <span style={{ color: 'var(--text-light)', fontWeight: 400 }}>(deixe em branco para manter)</span></label>
                  <div className="input-wrapper">
                    <span className="input-icon">🔒</span>
                    <input name="senha" type="password" className="form-control"
                      placeholder="Nova senha"
                      value={form.senha} onChange={handleChange} />
                  </div>
                </div>

                <div style={{ display: 'flex', gap: 12 }}>
                  <button type="submit" className="btn btn-primary btn-lg" disabled={loading || sucesso}
                    style={{ flex: 1, justifyContent: 'center' }}>
                    {loading ? 'Salvando…' : 'Salvar alterações'}
                  </button>
                  <Link to="/perfil" className="btn btn-outline btn-lg" style={{ flex: 1, justifyContent: 'center' }}>
                    Cancelar
                  </Link>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <Footer />
    </>
  )
}
