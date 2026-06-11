import Header from "../../components/Header";
import Footer from "../../components/Footer";
import PageHeader from "../../components/PageHeader";
import styles from "./styles.module.css";
import { TERMOSDEUSO } from "../../util/base-elements";
import DescriptionBox from "../../components/DescriptionBox";

export default function TermosUso() {
	return (
		<>
			<Header />
			<main className="pageWrapper">
				<PageHeader
					title="📋 Termos de Uso"
					subtitle="Última atualização: Janeiro de 2025"
				/>
				<div className="page-content">
					<div className={`container ${styles.contentContainer}`}>
						<article className={`card ${styles.contentCard}`}>
							{TERMOSDEUSO.map(([title, text]) => (
								<DescriptionBox
									key={title}
									text={text}
									title={title}
								/>
							))}
						</article>
					</div>
				</div>
			</main>
			<Footer />
		</>
	);
}
