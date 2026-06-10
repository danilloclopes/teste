import Header from '../../components/Header'
import Footer from '../../components/Footer'
import PageHeader from '../../components/PageHeader'
import styles from './styles.module.css'

export default function PoliticaPrivacidade() {
  return (
    <>
      <Header />
      <div className="pageWrapper">
        <PageHeader
          title="🛡️ Política de Privacidade"
          subtitle="Última atualização: Janeiro de 2025"
        />
        <div className="page-content">
          <div className={`container ${styles.contentContainer}`}>
            <div className={`card ${styles.contentCard}`}>
              {[
                ['1. Coleta de Dados', 'Coletamos apenas os dados necessários para o funcionamento do serviço: nome, e-mail e CPF. Não compartilhamos suas informações com terceiros sem sua autorização explícita.'],
                ['2. Uso dos Dados', 'Seus dados são utilizados exclusivamente para criar e gerenciar sua conta, processar agendamentos e enviar comunicações relacionadas ao serviço.'],
                ['3. Segurança', 'Utilizamos criptografia SHA-256 para armazenamento de senhas. Sessões são protegidas por cookies HttpOnly. Aplicamos controle de acesso em todas as rotas autenticadas.'],
                ['4. Cookies', 'Utilizamos cookies de sessão (JSESSIONID) para manter você autenticado. Não utilizamos cookies de rastreamento ou publicidade.'],
                ['5. Seus Direitos', 'Você pode solicitar a exclusão ou atualização dos seus dados a qualquer momento através da página de perfil ou pelo e-mail contato@magicfest.com.br.'],
                ['6. Contato', 'Para dúvidas sobre privacidade, entre em contato: contato@magicfest.com.br'],
              ].map(([title, text]) => (
                <div key={title} className={styles.section}>
                  <h2 className={styles.sectionTitle}>{title}</h2>
                  <p>{text}</p>
                </div>
              ))}
            </div>
          </div>
        </div>
      </div>
      <Footer />
    </>
  )
}
