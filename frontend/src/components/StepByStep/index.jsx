import styles from "./styles.module.css";

export default function StepByStep({ step, icon, title, description }) {
	return (
        <div
            className={styles.stepCard}
            key={step}
        >
            <span className={styles.stepNumber}> {step}</span>
            <span className={styles.stepIcon}> {icon}</span>
            <h3 className={styles.stepTitle}>{title}</h3>
            <p className={styles.stepDesc}>{description}</p>
        </div>
	);
}
