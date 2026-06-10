import Header from '../../components/Header'
import Footer from '../../components/Footer'

export default function TermosUso() {
  return (
    <>
      <Header />
      <div className="pageWrapper">
        <div className="page-header">
          <div className="container">
            <h1>📋 Termos de Uso</h1>
            <p>Última atualização: Janeiro de 2025</p>
          </div>
        </div>
        <div className="page-content">
          <div className="container contentContainer">
            <div className="card contentCard">
              {[
                ['1. Aceitação dos Termos', 'Ao utilizar a plataforma MagicFest, você concorda com estes termos. Caso não concorde, não utilize os serviços.'],
                ['2. Cadastro e Conta', 'Para realizar agendamentos é necessário criar uma conta com informações verdadeiras. Você é responsável pela segurança das suas credenciais.'],
                ['3. Agendamentos', 'Os agendamentos estão sujeitos à disponibilidade dos animadores. A MagicFest não se responsabiliza por cancelamentos causados por força maior.'],
                ['4. Conduta', 'É proibido utilizar a plataforma para fins ilícitos, tentativas de fraude ou qualquer atividade que prejudique outros usuários.'],
                ['5. Modificações', 'Estes termos podem ser alterados a qualquer momento. As alterações entram em vigor imediatamente após publicação.'],
                ['6. Contato', 'Para dúvidas sobre estes termos, entre em contato: contato@magicfest.com.br'],
              ].map(([title, text]) => (
                <div key={title} className="section">
                  <h2 className="sectionTitle">{title}</h2>
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
