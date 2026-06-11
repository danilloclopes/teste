import { useNavigate } from "react-router-dom";
import { useAuth } from "../../context/AuthContext";
import Header from "../../components/Header";
import Footer from "../../components/Footer";
import styles from "./styles.module.css";
import { CHARS, BENEFITS, TESTIMONIALS, HEROSTATS, HEROCARDS, HOWTO } from "../../util/base-elements";
import StepByStep from "../../components/StepByStep";
import CharacterHomeBox from "../../components/CharacterHomeBox";
import TestimonialHomeBox from "../../components/TestimonialHomeBox";

export default function Home() {
	const { usuario } = useAuth();
	const navigate = useNavigate();

	function handleReservar() {
		navigate(usuario ? "/agendar" : "/login");
	}

	return (
		<>
			<Header />

			{/* Hero */}
			<section className={styles.hero}>

                {/* Bolinhas dançarinas */}
				<div className={styles.heroBgShapes}>
					<div className={`${styles.heroShape} ${styles.heroShape1}`}/>
					<div className={`${styles.heroShape} ${styles.heroShape2}`}/>
					<div className={`${styles.heroShape} ${styles.heroShape3}`}/>
				</div>

				<div className="container">
					<div className={styles.heroInner}>
						<div className={styles.heroContent}>

							<span className={styles.heroBadge}>
								<span className={styles.dot} />
								Mais de 500 festas realizadas
							</span>

							<h1 className={styles.heroTitle}>
								Transforme a festa
								<span className={styles.highlight}>em um sonho</span>
								inesquecível!
							</h1>

							<p className={styles.heroDescription}>
								Alugue personagens incríveis para a festa do seu
								filho. Princesas, super-heróis, animados e muito
								mais — entregamos magia, alegria e memórias
								eternas.
							</p>

							<div className={styles.heroActions}>
								<button
									className="btn btn-secondary btn-lg"
									onClick={handleReservar}>
									✨ Ver Personagens
								</button>
								<a
									href="#como-funciona"
									className={`btn btn-lg ${styles.heroOutlineBtn}`}>
									Como funciona
								</a>
							</div>

							<div className={styles.heroStats}>
								{HEROSTATS.map(([n, l]) => (
									<div
										className={styles.heroStat}
										key={l}
									>
										<span className={styles.heroStatNumber}>
											{n}
										</span>
										<span className={styles.heroStatLabel}>
											{l}
										</span>
									</div>
								))}
							</div>
						</div>

						<div className={styles.heroVisual}>

							<div className={styles.heroCardsGrid}>
								{HEROCARDS.map(([icon, role, theme]) => (
									<div
										className={styles.heroCharCard}
										key={role}
									>
										<span className={styles.heroCharEmoji}> {icon} </span>
										<p className={styles.heroCharName}> {role} </p>
										<span className={styles.heroCharTag}> {theme} </span>
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
						<h2 className={styles.sectionTitle}>
							Simples, rápido e <span>mágico</span>
						</h2>
						<p className={styles.sectionSubtitle}>
							Em apenas 3 passos você garante o personagem
							favorito do seu filho.
						</p>
					</div>

					<div className={styles.stepsGrid}>
						{HOWTO.map((s) => (
                            <StepByStep
                                key={s.n}
                                step={s.n}
                                icon={s.icon}
                                title={s.title}
                                description={s.desc}
                            />
						))}
					</div>
				</div>
			</section>

			{/* Personagens */}
			<section
				className={styles.characters}
				id="personagens"
			>
				<div className="container">
					<div className={styles.textCenter}>
						<span className={styles.sectionTag}>Catálogo</span>
						<h2 className={styles.sectionTitle}>
							Personagens em <span>destaque</span>
						</h2>
						<p className={styles.sectionSubtitle}>
							Mais de 50 personagens disponíveis para tornar
							qualquer festa inesquecível.
						</p>
					</div>
					<div className={styles.charsGrid}>
						{CHARS.map((character) => (
                            <CharacterHomeBox
                                name={character.name}
                                emoji={character.emoji}
                                badge={character.namebadge}
                                cat={character.cat}
                                price={character.price}
                            />
						))}
					</div>
					<div className={styles.charsCta}>
						<button
							className="btn btn-primary btn-lg"
							onClick={handleReservar}
						>
							Ver todos os personagens →
						</button>
					</div>
				</div>
			</section>

			{/* Diferenciais */}
			<section
				className={styles.benefits}
				id="diferenciais"
			>
				<div className="container">
					<div className={styles.textCenter}>
						<span
							className={`${styles.sectionTag} ${styles.benefitsSectionTag}`}
						>
							Nossos diferenciais
						</span>
						<h2
							className={`${styles.sectionTitle} ${styles.benefitsSectionTitle}`}
						>
							Por que escolher a{" "}
							<span className={styles.benefitsTitleAccent}>
								MagicFest?
							</span>
						</h2>
						<p
							className={`${styles.sectionSubtitle} ${styles.benefitsSectionSubtitle}`}
						>
							Cada detalhe é pensado para que a festa seja
							perfeita.
						</p>
					</div>
					<div className={styles.benefitsGrid}>
						{BENEFITS.map((b) => (
							<article
								className={styles.benefitCard}
								key={b.title}
							>
								<span className={styles.benefitIcon}>
									{b.icon}
								</span>
								<h3 className={styles.benefitTitle}>
									{b.title}
								</h3>
								<p className={styles.benefitDesc}>{b.desc}</p>
							</article>
						))}
					</div>
				</div>
			</section>

			{/* Depoimentos */}
			<section
				className={styles.testimonials}
				id="depoimentos"
			>
				<div className="container">
					<div className={styles.textCenter}>
						<span className={styles.sectionTag}>Depoimentos</span>
						<h2 className={styles.sectionTitle}>
							O que as famílias <span>dizem</span>
						</h2>
						<p className={styles.sectionSubtitle}>
							Centenas de famílias já confiaram na MagicFest para
							momentos especiais.
						</p>
					</div>
					<div className={styles.testimonialsGrid}>
						{TESTIMONIALS.map((t) => (
                            <TestimonialHomeBox
                                name={t.name}
                                stars={t.stars}
                                text={t.text}
                                initials={t.initials}
                                role={t.role}
                            />
						))}
					</div>
				</div>
			</section>

			{/* CTA */}
			<section className={styles.ctaSection}>
				<div className="container">
					<div className={styles.ctaBox}>
						<h2 className={styles.ctaTitle}>
							A festa dos sonhos começa aqui 🎉
						</h2>
						<p className={styles.ctaDesc}>
							Não deixe para última hora! Reserve agora o
							personagem favorito do seu filho.
						</p>
						<div className={styles.ctaActions}>
							<button
								className={styles.btnWhite}
								onClick={handleReservar}
							>
								✨ Fazer minha reserva
							</button>
						</div>
					</div>
				</div>
			</section>

			<Footer />
		</>
	);
}
