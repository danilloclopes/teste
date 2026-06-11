import Header from '../../components/Header'
import Footer from '../../components/Footer'
import PageHeader from '../../components/PageHeader'
import styles from './styles.module.css'

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
              {[
                ['1. Aceitação dos Termos', 'Ao utilizar a plataforma MagicFest, você concorda com estes termos. Caso não concorde, não utilize os serviços.'],
                ['2. Cadastro e Conta', 'Para realizar agendamentos é necessário criar uma conta com informações verdadeiras. Você é responsável pela segurança das suas credenciais.'],
                ['3. Agendamentos', 'Os agendamentos estão sujeitos à disponibilidade dos animadores. A MagicFest não se responsabiliza por cancelamentos causados por força maior.'],
                ['4. Conduta', 'É proibido utilizar a plataforma para fins ilícitos, tentativas de fraude ou qualquer atividade que prejudique outros usuários.'],
                ['5. Modificações', 'Estes termos podem ser alterados a qualquer momento. As alterações entram em vigor imediatamente após publicação.'],
                ['6. Contato', 'Para dúvidas sobre estes termos, entre em contato: contato@magicfest.com.br'],
              ].map(([title, text]) => (
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
