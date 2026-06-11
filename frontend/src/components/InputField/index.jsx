import styles from "./styles.module.css";

export default function InputField({ label, icon, id, name, ...inputProps }) {
	const fieldId = id || name;
	return (
		<div className="form-group">
			<label htmlFor={fieldId}>{label}</label>
			<div className={styles.inputWrapper}>
				<span className={styles.inputIcon}>{icon}</span>
				<input
					id={fieldId}
					name={name}
					className="form-control"
					{...inputProps}
				/>
			</div>
		</div>
	);
}
