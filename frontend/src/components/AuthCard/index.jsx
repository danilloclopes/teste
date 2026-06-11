import { Link } from "react-router-dom";
import styles from "./styles.module.css";

export default function AuthCard({
	title,
	children,
	footerText,
	footerLink,
	footerLinkText,
}) {
	return (
		<main className={styles.authPage}>
			<article className={styles.authCard}>

				<header className={styles.authLogo}>
					<span className={styles.logoIcon}>🎭</span>
					<span className={styles.logoText}>MagicFest</span>
					<p className={styles.logoSub}>
						Personagens que encantam festas
					</p>
				</header>

				<h1 className={styles.authTitle}>{title}</h1>
				{children}
				<div className={styles.divider}>ou</div>

				<p className={styles.authFooterText}>
					{footerText} <Link to={footerLink}>{footerLinkText}</Link>
				</p>

				<Link
					to="/"
					className={styles.backLink}>
					← Voltar para a página inicial
				</Link>
			</article>
		</main>
	);
}
