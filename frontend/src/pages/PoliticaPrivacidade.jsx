import Header from '../components/Header'
import Footer from '../components/Footer'

export default function PoliticaPrivacidade() {
  return (
    <>
      <Header />
      <div style={{ paddingTop: 80 }}>
        <div className="page-header">
          <div className="container">
            <h1>🛡️ Política de Privacidade</h1>
            <p>Última atualização: Janeiro de 2025</p>
          </div>
        </div>
        <div className="page-content">
          <div className="container" style={{ maxWidth: 760 }}>
            <div className="card" style={{ lineHeight: 1.8, color: 'var(--text-medium)' }}>
              {[
                ['1. Coleta de Dados', 'Coletamos apenas os dados necessários para o funcionamento do serviço: nome, e-mail e CPF. Não compartilhamos suas informações com terceiros sem sua autorização explícita.'],
                ['2. Uso dos Dados', 'Seus dados são utilizados exclusivamente para criar e gerenciar sua conta, processar agendamentos e enviar comunicações relacionadas ao serviço.'],
                ['3. Segurança', 'Utilizamos criptografia SHA-256 para armazenamento de senhas. Sessões são protegidas por cookies HttpOnly. Aplicamos controle de acesso em todas as rotas autenticadas.'],
                ['4. Cookies', 'Utilizamos cookies de sessão (JSESSIONID) para manter você autenticado. Não utilizamos cookies de rastreamento ou publicidade.'],
                ['5. Seus Direitos', 'Você pode solicitar a exclusão ou atualização dos seus dados a qualquer momento através da página de perfil ou pelo e-mail contato@magicfest.com.br.'],
                ['6. Contato', 'Para dúvidas sobre privacidade, entre em contato: contato@magicfest.com.br'],
              ].map(([title, text]) => (
                <div key={title} style={{ marginBottom: 28 }}>
                  <h2 style={{ fontFamily: 'var(--font-heading)', color: 'var(--text-dark)', marginBottom: 8 }}>{title}</h2>
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
