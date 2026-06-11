import Header from '../../components/Header'
import Footer from '../../components/Footer'
import PageHeader from '../../components/PageHeader'
import styles from './styles.module.css'
import { TERMOSDEUSO } from '../../util/base-elements'

export default function TermosUso() {
  return (
    <>
      <Header />
      <main className="pageWrapper">
        <PageHeader
          title="📋 Termos de Uso"
          subtitle="Última atualização: Janeiro de 2025"
        />
        <div className="page-content">
          <div className={`container ${styles.contentContainer}`}>
            <article className={`card ${styles.contentCard}`}>
              {TERMOSDEUSO.map(([title, text]) => (
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
