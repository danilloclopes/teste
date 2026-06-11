import styles from "./styles.module.css";

export default function TestimonialHomeBox({ name, stars, text, initials, role }) {

	return (
        <article
            className={styles.testimonialCard}
            key={name}
        >
            <span className={styles.stars}>
                {"★".repeat(stars)}
            </span>
            <p className={styles.testimonialText}>
                {text}
            </p>
            <footer className={styles.testimonialAuthor}>
                <span className={styles.authorAvatar}>
                    {initials}
                </span>
                <div>
                    <p className={styles.authorName}>
                        {name}
                    </p>
                    <p className={styles.authorRole}>
                        {role}
                    </p>
                </div>
            </footer>
        </article>
	);
}
