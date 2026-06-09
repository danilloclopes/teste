import { useState, useEffect } from 'react'
import { Link } from 'react-router-dom'
import { api } from '../services/api'
import Header from '../components/Header'
import Footer from '../components/Footer'

export default function Perfil() {
  const [usuario, setUsuario] = useState(null)
  const [erro, setErro]       = useState('')

  useEffect(() => {
    api.get('/usuarios/perfil')
      .then(setUsuario)
      .catch(err => setErro(err.message))
  }, [])

  function mascaraCpf(cpf = '') {
    return cpf.replace(/(\d{3})(\d{3})(\d{3})(\d{2})/, '$1.$2.$3-$4')
  }

  return (
    <>
      <Header />
      <div style={{ paddingTop: 80 }}>
        <div className="page-header">
          <div className="container">
            <h1>👤 Meu Perfil</h1>
            <p>Veja e gerencie as informações da sua conta.</p>
          </div>
        </div>

        <div className="page-content">
          <div className="container" style={{ maxWidth: 520 }}>
            {erro && <div className="alert alert-error">⚠️ {erro}</div>}

            {usuario && (
              <div className="card">
                <div style={{ textAlign: 'center', marginBottom: 32 }}>
                  <div style={{
                    width: 80, height: 80, borderRadius: '50%', margin: '0 auto 12px',
                    background: 'linear-gradient(135deg, var(--primary-light), var(--accent-light))',
                    display: 'flex', alignItems: 'center', justifyContent: 'center',
                    fontSize: '2rem', fontWeight: 900, color: 'var(--primary-dark)',
                    fontFamily: 'var(--font-heading)'
                  }}>
                    {usuario.nome?.[0]?.toUpperCase()}
                  </div>
                  <h2 style={{ fontFamily: 'var(--font-heading)', fontWeight: 900 }}>{usuario.nome}</h2>
                </div>

                <table style={{ width: '100%' }}>
                  <tbody>
                    {[
                      ['E-mail', usuario.email],
                      ['CPF',   mascaraCpf(usuario.cpf)],
                    ].map(([label, val]) => (
                      <tr key={label}>
                        <td style={{ fontWeight: 600, paddingBottom: 12, width: 80, color: 'var(--text-medium)', fontSize: '0.85rem' }}>{label}</td>
                        <td style={{ paddingBottom: 12 }}>{val}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>

                <div style={{ display: 'flex', gap: 12, marginTop: 24 }}>
                  <Link to="/perfil/editar" className="btn btn-primary" style={{ flex: 1, justifyContent: 'center' }}>
                    ✏️ Editar perfil
                  </Link>
                  <Link to="/dashboard" className="btn btn-outline" style={{ flex: 1, justifyContent: 'center' }}>
                    📅 Agendamentos
                  </Link>
                </div>
              </div>
            )}
          </div>
        </div>
      </div>
      <Footer />
    </>
  )
}
