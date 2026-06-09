import { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { api } from '../services/api'
import Header from '../components/Header'
import Footer from '../components/Footer'

export default function Agendar() {
  const [animadores, setAnimadores] = useState([])
  const [animadorId, setAnimadorId] = useState('')
  const [dataHora, setDataHora]     = useState('')
  const [erro, setErro]             = useState('')
  const [sucesso, setSucesso]       = useState(false)
  const [loading, setLoading]       = useState(false)
  const navigate = useNavigate()

  useEffect(() => {
    api.get('/animadores').then(setAnimadores).catch(() => {})
  }, [])

  async function handleSubmit(e) {
    e.preventDefault()
    setErro('')
    setLoading(true)
    try {
      await api.post('/agendamentos', {
        animadorId: Number(animadorId),
        dataHora,
      })
      setSucesso(true)
      setTimeout(() => navigate('/dashboard'), 1500)
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
            <h1>✨ Novo Agendamento</h1>
            <p>Escolha o personagem e confirme a data da festa.</p>
          </div>
        </div>

        <div className="page-content">
          <div className="container" style={{ maxWidth: 520 }}>
            {sucesso && (
              <div className="alert alert-success">
                ✅ Agendamento criado com sucesso! Redirecionando…
              </div>
            )}

            {erro && <div className="alert alert-error">⚠️ {erro}</div>}

            <div className="card">
              <form onSubmit={handleSubmit}>
                <div className="form-group">
                  <label>Personagem / Animador</label>
                  <select
                    className="form-control"
                    value={animadorId}
                    onChange={e => setAnimadorId(e.target.value)}
                    required
                  >
                    <option value="">Selecione um personagem</option>
                    {animadores.map(a => (
                      <option key={a.id} value={a.id}>
                        {a.personagem.nome} — {a.usuario.nome}
                      </option>
                    ))}
                  </select>
                </div>

                <div className="form-group">
                  <label>Data e Hora</label>
                  <input
                    type="datetime-local"
                    className="form-control"
                    value={dataHora}
                    onChange={e => setDataHora(e.target.value)}
                    required
                    style={{ paddingLeft: '0.9rem' }}
                  />
                </div>

                <button type="submit" className="btn-auth" disabled={loading || sucesso}>
                  {loading ? 'Agendando…' : '🎉 Confirmar Agendamento'}
                </button>
              </form>
            </div>
          </div>
        </div>
      </div>
      <Footer />
    </>
  )
}
