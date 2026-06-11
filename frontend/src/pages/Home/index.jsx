import { useNavigate } from 'react-router-dom'
import { useAuth } from '../../context/AuthContext'
import Header from '../../components/Header'
import Footer from '../../components/Footer'
import styles from './styles.module.css'
import { CHARS, BENEFITS, TESTIMONIALS } from '../../util/base-elements'


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
      <section className={styles.hero}>
        <div className={styles.heroBgShapes}>
          <div className={`${styles.heroShape} ${styles.heroShape1}`} />
          <div className={`${styles.heroShape} ${styles.heroShape2}`} />
          <div className={`${styles.heroShape} ${styles.heroShape3}`} />
        </div>
        <div className="container">
          <div className={styles.heroInner}>
            <div className={styles.heroContent}>
              <span className={styles.heroBadge}><span className={styles.dot} />Mais de 500 festas realizadas</span>
              <h1 className={styles.heroTitle}>
                Transforme a festa
                <span className={styles.highlight}>em um sonho</span>
                inesquecível!
              </h1>
              <p className={styles.heroDescription}>
                Alugue personagens incríveis para a festa do seu filho. Princesas, super-heróis,
                animados e muito mais — entregamos magia, alegria e memórias eternas.
              </p>
              <div className={styles.heroActions}>
                <button className="btn btn-secondary btn-lg" onClick={handleReservar}>✨ Ver Personagens</button>
                <a href="#como-funciona" className={`btn btn-lg ${styles.heroOutlineBtn}`}>Como funciona</a>
              </div>
              <div className={styles.heroStats}>
                {[['500+','Festas realizadas'],['50+','Personagens'],['4.9★','Avaliação média']].map(([n,l]) => (
                  <div className={styles.heroStat} key={l}>
                    <span className={styles.heroStatNumber}>{n}</span>
                    <span className={styles.heroStatLabel}>{l}</span>
                  </div>
                ))}
              </div>
            </div>
            <div className={styles.heroVisual}>
              <div className={styles.heroCardsGrid}>
                {[['👸','Princesa','Infantil'],['🦸','Super-herói','Ação'],['🐭','Animados','Kids'],['🧙','Fantasia','Temático']].map(([e,n,t]) => (
                  <div className={styles.heroCharCard} key={n}>
                    <span className={styles.heroCharEmoji}>{e}</span>
                    <p className={styles.heroCharName}>{n}</p>
                    <span className={styles.heroCharTag}>{t}</span>
                  </div>
                ))}
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Como Funciona */}
      <section className={styles.howItWorks} id="como-funciona">
        <div className="container">
          <div className={styles.textCenter}>
            <span className={styles.sectionTag}>Como funciona</span>
            <h2 className={styles.sectionTitle}>Simples, rápido e <span>mágico</span></h2>
            <p className={styles.sectionSubtitle}>Em apenas 3 passos você garante o personagem favorito do seu filho.</p>
          </div>
          <div className={styles.stepsGrid}>
            {[
              { n: 1, icon: '🔍', title: 'Escolha o personagem', desc: 'Navegue pelo catálogo com dezenas de personagens e encontre o favorito da criança.' },
              { n: 2, icon: '📅', title: 'Faça a reserva',       desc: 'Selecione a data e horário. Confirme com segurança e receba a confirmação.' },
              { n: 3, icon: '🎉', title: 'Curta a magia!',       desc: 'Nosso personagem chega na hora certa e pronto para encantar todas as crianças!' },
            ].map(s => (
              <div className={styles.stepCard} key={s.n}>
                <span className={styles.stepNumber}>{s.n}</span>
                <span className={styles.stepIcon}>{s.icon}</span>
                <h3 className={styles.stepTitle}>{s.title}</h3>
                <p className={styles.stepDesc}>{s.desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Personagens */}
      <section className={styles.characters} id="personagens">
        <div className="container">
          <div className={styles.textCenter}>
            <span className={styles.sectionTag}>Catálogo</span>
            <h2 className={styles.sectionTitle}>Personagens em <span>destaque</span></h2>
            <p className={styles.sectionSubtitle}>Mais de 50 personagens disponíveis para tornar qualquer festa inesquecível.</p>
          </div>
          <div className={styles.charsGrid}>
            {CHARS.map(c => (
              <article className={styles.charCard} key={c.name}>
                <figure className={styles.charCardImg}>
                  <span className={styles.charEmoji}>{c.emoji}</span>
                  {c.badge && <span className={styles.charBadge}>{c.badge}</span>}
                </figure>
                <div className={styles.charCardBody}>
                  <p className={styles.charCategory}>{c.cat}</p>
                  <h3 className={styles.charName}>{c.name}</h3>
                  <footer className={styles.charCardFooter}>
                    <p className={styles.charPrice}>
                      <span className={styles.charPriceLabel}>A partir de</span>
                      <span className={styles.charPriceValue}>R$ {c.price}</span>
                    </p>
                    <button className={styles.charBtn} onClick={handleReservar}>Reservar</button>
                  </footer>
                </div>
              </article>
            ))}
          </div>
          <div className={styles.charsCta}>
            <button className="btn btn-primary btn-lg" onClick={handleReservar}>Ver todos os personagens →</button>
          </div>
        </div>
      </section>

      {/* Diferenciais */}
      <section className={styles.benefits} id="diferenciais">
        <div className="container">
          <div className={styles.textCenter}>
            <span className={`${styles.sectionTag} ${styles.benefitsSectionTag}`}>
              Nossos diferenciais
            </span>
            <h2 className={`${styles.sectionTitle} ${styles.benefitsSectionTitle}`}>
              Por que escolher a <span className={styles.benefitsTitleAccent}>MagicFest?</span>
            </h2>
            <p className={`${styles.sectionSubtitle} ${styles.benefitsSectionSubtitle}`}>Cada detalhe é pensado para que a festa seja perfeita.</p>
          </div>
          <div className={styles.benefitsGrid}>
            {BENEFITS.map(b => (
              <article className={styles.benefitCard} key={b.title}>
                <span className={styles.benefitIcon}>{b.icon}</span>
                <h3 className={styles.benefitTitle}>{b.title}</h3>
                <p className={styles.benefitDesc}>{b.desc}</p>
              </article>
            ))}
          </div>
        </div>
      </section>

      {/* Depoimentos */}
      <section className={styles.testimonials} id="depoimentos">
        <div className="container">
          <div className={styles.textCenter}>
            <span className={styles.sectionTag}>Depoimentos</span>
            <h2 className={styles.sectionTitle}>O que as famílias <span>dizem</span></h2>
            <p className={styles.sectionSubtitle}>Centenas de famílias já confiaram na MagicFest para momentos especiais.</p>
          </div>
          <div className={styles.testimonialsGrid}>
            {TESTIMONIALS.map(t => (
              <article className={styles.testimonialCard} key={t.name}>
                <span className={styles.stars}>{'★'.repeat(t.stars)}</span>
                <p className={styles.testimonialText}>{t.text}</p>
                <footer className={styles.testimonialAuthor}>
                  <span className={styles.authorAvatar}>{t.initials}</span>
                  <div>
                    <p className={styles.authorName}>{t.name}</p>
                    <p className={styles.authorRole}>{t.role}</p>
                  </div>
                </footer>
              </article>
            ))}
          </div>
        </div>
      </section>

      {/* CTA */}
      <section className={styles.ctaSection}>
        <div className="container">
          <div className={styles.ctaBox}>
            <h2 className={styles.ctaTitle}>A festa dos sonhos começa aqui 🎉</h2>
            <p className={styles.ctaDesc}>Não deixe para última hora! Reserve agora o personagem favorito do seu filho.</p>
            <div className={styles.ctaActions}>
              <button className={styles.btnWhite} onClick={handleReservar}>✨ Fazer minha reserva</button>
            </div>
          </div>
        </div>
      </section>

      <Footer />
    </>
  )
}
