import Header from "../../components/Header";
import Footer from "../../components/Footer";
import PageHeader from "../../components/PageHeader";
import styles from "./styles.module.css";
import { POLITICAPRIVACIDADE } from "../../util/base-elements";
import DescriptionBox from "../../components/DescriptionBox";

export default function PoliticaPrivacidade() {
	return (
		<>
			<Header />
			<main className="pageWrapper">
				<PageHeader
					title="🛡️ Política de Privacidade"
					subtitle="Última atualização: Janeiro de 2025"
				/>
				<div className="page-content">
					<div className={`container ${styles.contentContainer}`}>
						<article className={`card ${styles.contentCard}`}>
							{POLITICAPRIVACIDADE.map(([title, text]) => (
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
