import { useState, useEffect } from 'react'
import { Link } from 'react-router-dom'
import { api } from '../../services/api'
import Header from '../../components/Header'
import Footer from '../../components/Footer'
import PageHeader from '../../components/PageHeader'
import Alert from '../../components/Alert'
import styles from './styles.module.css'

const STATUS_LABEL = {
  PENDENTE:   { label: 'Pendente',   cls: 'badge-pendente'   },
  CONTRATADO: { label: 'Contratado', cls: 'badge-contratado' },
  CANCELADO:  { label: 'Cancelado',  cls: 'badge-cancelado'  },
  CONCLUIDO:  { label: 'Concluído',  cls: 'badge-concluido'  },
}

function formatDateTime(iso) {
  if (!iso) return '-'
  const d = new Date(iso)
  return d.toLocaleString('pt-BR', { dateStyle: 'short', timeStyle: 'short' })
}

export default function Dashboard() {
  const [agendamentos, setAgendamentos] = useState([])
  const [loading, setLoading]           = useState(true)
  const [erro, setErro]                 = useState('')

  useEffect(() => {
    api.get('/agendamentos')
      .then(setAgendamentos)
      .catch(err => setErro(err.message))
      .finally(() => setLoading(false))
  }, [])

  return (
    <>
      <Header />
      <main className="pageWrapper">
        <PageHeader
          title="📅 Meus Agendamentos"
          subtitle="Acompanhe o status das suas reservas de personagens."
        />

        <div className="page-content">
          <div className="container">
            <div className={styles.actionsRow}>
              <Link to="/agendar" className="btn btn-primary">✨ Novo agendamento</Link>
            </div>

            {loading && <div className="spinner"><span>⏳</span> Carregando…</div>}

            {erro && <Alert type="error">⚠️ {erro}</Alert>}

            {!loading && !erro && (
              <div className="card">
                {agendamentos.length === 0 ? (
                  <div className={styles.emptyState}>
                    <span className={styles.emptyStateIcon}>🎭</span>
                    <p>Nenhum agendamento encontrado.</p>
                    <Link to="/agendar" className={`btn btn-primary ${styles.emptyStateCta}`}>
                      Fazer minha primeira reserva
                    </Link>
                  </div>
                ) : (
                  <div className="table-wrap">
                    <table>
                      <thead>
                        <tr>
                          <th>#</th>
                          <th>Personagem</th>
                          <th>Animador</th>
                          <th>Data e Hora</th>
                          <th>Status</th>
                        </tr>
                      </thead>
                      <tbody>
                        {agendamentos.map(a => {
                          const st = STATUS_LABEL[a.status] || { label: a.status, cls: '' }
                          return (
                            <tr key={a.id}>
                              <td>#{a.id}</td>
                              <td>{a.animador?.personagem?.nome ?? '-'}</td>
                              <td>{a.animador?.usuario?.nome ?? '-'}</td>
                              <td>{formatDateTime(a.dataHora)}</td>
                              <td><span className={`badge ${st.cls}`}>{st.label}</span></td>
                            </tr>
                          )
                        })}
                      </tbody>
                    </table>
                  </div>
                )}
              </div>
            )}
          </div>
        </div>
      </main>
      <Footer />
    </>
  )
}
