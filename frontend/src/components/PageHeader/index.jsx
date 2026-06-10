import styles from './styles.module.css'

export default function PageHeader({ title, subtitle }) {
  return (
    <div className={styles.pageHeader}>
      <div className="container">
        <h1>{title}</h1>
        {subtitle && <p>{subtitle}</p>}
      </div>
    </div>
  )
}
