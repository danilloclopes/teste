import styles from "./styles.module.css";

export default function CharacterHomeBox({ name, emoji, badge, cat, price }) {

	function handleReservar() {
		navigate(usuario ? "/agendar" : "/login");
	}

	return (
        <article
            className={styles.charCard}
            key={name}
        >
            <figure className={styles.charCardImg}>
                <span className={styles.charEmoji}>
                    {emoji}
                </span>
                {badge && (
                    <span className={styles.charBadge}>
                        {badge}
                    </span>
                )}
            </figure>
            <div className={styles.charCardBody}>
                <p className={styles.charCategory}>
                    {cat}
                </p>
                <h3 className={styles.charName}>
                    {name}
                </h3>
                <footer className={styles.charCardFooter}>
                    <p className={styles.charPrice}>
                        <span className={styles.charPriceLabel}>
                            A partir de
                        </span>
                        <span className={styles.charPriceValue}>
                            R$ {price}
                        </span>
                    </p>
                    <button
                        className={styles.charBtn}
                        onClick={handleReservar}>
                        Reservar
                    </button>
                </footer>
            </div>
        </article>
	);
}
