import styles from "./styles.module.css";

export default function DescriptionBox({ title, text }) {
	return (
		<section
			key={title}
			className={styles.section}
		>
			<h2 className={styles.sectionTitle}>{title}</h2>
			<p>{text}</p>
		</section>
	);
}
