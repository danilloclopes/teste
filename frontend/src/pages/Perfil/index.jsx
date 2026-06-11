import { useState, useEffect } from 'react'
import { Link } from 'react-router-dom'
import { api } from '../../services/api'
import Header from '../../components/Header'
import Footer from '../../components/Footer'
import PageHeader from '../../components/PageHeader'
import Alert from '../../components/Alert'
import styles from './styles.module.css'

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
      <main className="pageWrapper">
        <PageHeader
          title="👤 Meu Perfil"
          subtitle="Veja e gerencie as informações da sua conta."
        />

        <div className="page-content">
          <div className="container formContainer">
            {erro && <Alert type="error">⚠️ {erro}</Alert>}

            {usuario && (
              <div className="card">
                <section className={styles.avatarSection}>
                  <span className={styles.avatarIcon}>
                    {usuario.nome?.[0]?.toUpperCase()}
                  </span>
                  <h2 className={styles.userName}>{usuario.nome}</h2>
                </section>

                <table className={styles.infoTable}>
                  <tbody>
                    {[
                      ['E-mail', usuario.email],
                      ['CPF',   mascaraCpf(usuario.cpf)],
                    ].map(([label, val]) => (
                      <tr key={label}>
                        <td className={styles.infoLabel}>{label}</td>
                        <td className={styles.infoValue}>{val}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>

                <nav className={styles.actions}>
                  <Link to="/perfil/editar" className="btn btn-primary actionBtn">
                    ✏️ Editar perfil
                  </Link>
                  <Link to="/dashboard" className="btn btn-outline actionBtn">
                    📅 Agendamentos
                  </Link>
                </nav>
              </div>
            )}
          </div>
        </div>
      </main>
      <Footer />
    </>
  )
}
