import { useNavigate } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import Header from '../components/Header'
import Footer from '../components/Footer'
import './Home.css'

const CHARS = [
  { emoji: '👸', name: 'Cinderela',     cat: 'Princesas',    price: 250, badge: 'Popular', filter: 'princesa' },
  { emoji: '🕷️', name: 'Homem-Aranha', cat: 'Super-heróis', price: 280, badge: 'Top',     filter: 'heroi'    },
  { emoji: '🐭', name: 'Mickey Mouse',  cat: 'Animados',     price: 260, badge: null,      filter: 'animado'  },
  { emoji: '❄️', name: 'Elsa — Frozen', cat: 'Princesas',    price: 290, badge: null,      filter: 'princesa' },
  { emoji: '🦇', name: 'Batman',        cat: 'Super-heróis', price: 270, badge: null,      filter: 'heroi'    },
  { emoji: '🧙', name: 'Mago Encantador', cat: 'Fantasia',   price: 320, badge: 'Novo',    filter: 'fantasia' },
]

const BENEFITS = [
  { icon: '🎭', title: 'Fantasias de Alta Qualidade',  desc: 'Figurinos profissionais, detalhados e idênticos aos personagens originais.' },
  { icon: '⏰', title: 'Pontualidade Garantida',       desc: 'Nossos personagens chegam no horário combinado, sempre.' },
  { icon: '🛡️', title: 'Profissionais Qualificados',  desc: 'Atores treinados em interação infantil com verificação de antecedentes.' },
  { icon: '💰', title: 'Melhor Custo-Benefício',      desc: 'Pacotes para todos os orçamentos, sem taxas escondidas.' },
]

const TESTIMONIALS = [
  { stars: 5, text: '"A Cinderela foi simplesmente perfeita! Minha filha ficou com os olhos brilhando o tempo todo."', name: 'Ana Martins', role: 'Mãe da Maria Eduarda, 5 anos', initials: 'AM' },
  { stars: 5, text: '"O Homem-Aranha chegou 15 minutos antes, super animado! As crianças enlouqueceram. Valeu cada centavo."', name: 'Ricardo Carvalho', role: 'Pai do Bernardo, 7 anos', initials: 'RC' },
  { stars: 5, text: '"Contratei a Elsa para a festa temática de Frozen. Superou todas as expectativas!"', name: 'Lúcia Ferreira', role: 'Vovó da Sofia, 6 anos', initials: 'LF' },
]

export default function Home() {
  const { usuario } = useAuth()
  const navigate    = useNavigate()

  function handleReservar() {
    navigate(usuario ? '/agendar' : '/login')
  }

  return (
    <>
      <Header />

      {/* Hero */}
      <section className="hero">
        <div className="hero-bg-shapes">
          <div className="hero-shape hero-shape-1" />
          <div className="hero-shape hero-shape-2" />
          <div className="hero-shape hero-shape-3" />
        </div>
        <div className="container">
          <div className="hero-inner">
            <div className="hero-content">
              <div className="hero-badge"><span className="dot" />Mais de 500 festas realizadas</div>
              <h1 className="hero-title">
                Transforme a festa
                <span className="highlight">em um sonho</span>
                inesquecível!
              </h1>
              <p className="hero-description">
                Alugue personagens incríveis para a festa do seu filho. Princesas, super-heróis,
                animados e muito mais — entregamos magia, alegria e memórias eternas.
              </p>
              <div className="hero-actions">
                <button className="btn btn-secondary btn-lg" onClick={handleReservar}>✨ Ver Personagens</button>
                <a href="#como-funciona" className="btn btn-lg hero-outline-btn">Como funciona</a>
              </div>
              <div className="hero-stats">
                {[['500+','Festas realizadas'],['50+','Personagens'],['4.9★','Avaliação média']].map(([n,l]) => (
                  <div className="hero-stat" key={l}>
                    <span className="hero-stat-number">{n}</span>
                    <span className="hero-stat-label">{l}</span>
                  </div>
                ))}
              </div>
            </div>
            <div className="hero-visual">
              <div className="hero-cards-grid">
                {[['👸','Princesa','Infantil'],['🦸','Super-herói','Ação'],['🐭','Animados','Kids'],['🧙','Fantasia','Temático']].map(([e,n,t]) => (
                  <div className="hero-char-card" key={n}>
                    <span className="hero-char-emoji">{e}</span>
                    <div className="hero-char-name">{n}</div>
                    <span className="hero-char-tag">{t}</span>
                  </div>
                ))}
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Como Funciona */}
      <section className="how-it-works" id="como-funciona">
        <div className="container">
          <div className="text-center">
            <span className="section-tag">Como funciona</span>
            <h2 className="section-title">Simples, rápido e <span>mágico</span></h2>
            <p className="section-subtitle">Em apenas 3 passos você garante o personagem favorito do seu filho.</p>
          </div>
          <div className="steps-grid">
            {[
              { n: 1, icon: '🔍', title: 'Escolha o personagem', desc: 'Navegue pelo catálogo com dezenas de personagens e encontre o favorito da criança.' },
              { n: 2, icon: '📅', title: 'Faça a reserva',       desc: 'Selecione a data e horário. Confirme com segurança e receba a confirmação.' },
              { n: 3, icon: '🎉', title: 'Curta a magia!',       desc: 'Nosso personagem chega na hora certa e pronto para encantar todas as crianças!' },
            ].map(s => (
              <div className="step-card" key={s.n}>
                <div className="step-number">{s.n}</div>
                <div className="step-icon">{s.icon}</div>
                <h3 className="step-title">{s.title}</h3>
                <p className="step-desc">{s.desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Personagens */}
      <section className="characters" id="personagens">
        <div className="container">
          <div className="text-center">
            <span className="section-tag">Catálogo</span>
            <h2 className="section-title">Personagens em <span>destaque</span></h2>
            <p className="section-subtitle">Mais de 50 personagens disponíveis para tornar qualquer festa inesquecível.</p>
          </div>
          <div className="chars-grid">
            {CHARS.map(c => (
              <div className="char-card" key={c.name}>
                <div className="char-card-img" style={{ background: 'linear-gradient(135deg, var(--bg-section), var(--border))' }}>
                  <span style={{ fontSize: '4.5rem' }}>{c.emoji}</span>
                  {c.badge && <span className="char-badge">{c.badge}</span>}
                </div>
                <div className="char-card-body">
                  <div className="char-category">{c.cat}</div>
                  <h3 className="char-name">{c.name}</h3>
                  <div className="char-card-footer">
                    <div className="char-price">
                      <span className="char-price-label">A partir de</span>
                      <span className="char-price-value">R$ {c.price}</span>
                    </div>
                    <button className="char-btn" onClick={handleReservar}>Reservar</button>
                  </div>
                </div>
              </div>
            ))}
          </div>
          <div className="chars-cta">
            <button className="btn btn-primary btn-lg" onClick={handleReservar}>Ver todos os personagens →</button>
          </div>
        </div>
      </section>

      {/* Diferenciais */}
      <section className="benefits" id="diferenciais">
        <div className="container">
          <div className="text-center">
            <span className="section-tag" style={{ background: 'rgba(255,255,255,.15)', color: 'var(--secondary-light)', border: '1px solid rgba(255,255,255,.2)' }}>
              Nossos diferenciais
            </span>
            <h2 className="section-title" style={{ color: '#fff' }}>Por que escolher a <span style={{ color: 'var(--secondary-light)' }}>MagicFest?</span></h2>
            <p className="section-subtitle" style={{ color: 'rgba(255,255,255,.75)' }}>Cada detalhe é pensado para que a festa seja perfeita.</p>
          </div>
          <div className="benefits-grid">
            {BENEFITS.map(b => (
              <div className="benefit-card" key={b.title}>
                <span className="benefit-icon">{b.icon}</span>
                <h3 className="benefit-title">{b.title}</h3>
                <p className="benefit-desc">{b.desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Depoimentos */}
      <section className="testimonials" id="depoimentos">
        <div className="container">
          <div className="text-center">
            <span className="section-tag">Depoimentos</span>
            <h2 className="section-title">O que as famílias <span>dizem</span></h2>
            <p className="section-subtitle">Centenas de famílias já confiaram na MagicFest para momentos especiais.</p>
          </div>
          <div className="testimonials-grid">
            {TESTIMONIALS.map(t => (
              <div className="testimonial-card" key={t.name}>
                <div className="stars">{'★'.repeat(t.stars)}</div>
                <p className="testimonial-text">{t.text}</p>
                <div className="testimonial-author">
                  <div className="author-avatar">{t.initials}</div>
                  <div>
                    <div className="author-name">{t.name}</div>
                    <div className="author-role">{t.role}</div>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* CTA */}
      <section className="cta-section">
        <div className="container">
          <div className="cta-box">
            <h2 className="cta-title">A festa dos sonhos começa aqui 🎉</h2>
            <p className="cta-desc">Não deixe para última hora! Reserve agora o personagem favorito do seu filho.</p>
            <div className="cta-actions">
              <button className="btn-white" onClick={handleReservar}>✨ Fazer minha reserva</button>
            </div>
          </div>
        </div>
      </section>

      <Footer />
    </>
  )
}
