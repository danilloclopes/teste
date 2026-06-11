import Header from '../../components/Header'
import Footer from '../../components/Footer'
import PageHeader from '../../components/PageHeader'
import styles from './styles.module.css'
import { POLITICAPRIVACIDADE } from '../../util/base-elements'

export default function PoliticaPrivacidade() {
  return (
    <>
      <Header />
      <main className="pageWrapper">
        <PageHeader
          title="🛡️ Política de Privacidade"
          subtitle="Última atualização: Janeiro de 2025"
        />
        <div className="page-content">
          <div className={`container ${styles.contentContainer}`}>
            <article className={`card ${styles.contentCard}`}>
              {POLITICAPRIVACIDADE.map(([title, text]) => (
                <section key={title} className={styles.section}>
                  <h2 className={styles.sectionTitle}>{title}</h2>
                  <p>{text}</p>
                </section>
              ))}
            </article>
          </div>
        </div>
      </main>
      <Footer />
    </>
  )
}
