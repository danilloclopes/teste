import styles from './styles.module.css'

export default function Alert({ type = 'error', children }) {
  return (
    <div className={`${styles.alert} ${styles[type]}`} role="alert">
      {children}
    </div>
  )
}
