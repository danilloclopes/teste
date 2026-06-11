import { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import { api } from "../../services/api";
import Header from "../../components/Header";
import Footer from "../../components/Footer";
import PageHeader from "../../components/PageHeader";
import Alert from "../../components/Alert";
import styles from "./styles.module.css";

export default function Agendar() {
	const [animadores, setAnimadores] = useState([]);
	const [animadorId, setAnimadorId] = useState("");
	const [dataHora, setDataHora] = useState("");
	const [erro, setErro] = useState("");
	const [sucesso, setSucesso] = useState(false);
	const [loading, setLoading] = useState(false);
	const navigate = useNavigate();

	useEffect(() => {
		api.get("/animadores")
			.then(setAnimadores)
			.catch(() => {});
	}, []);

	async function handleSubmit(e) {
		e.preventDefault();
		setErro("");
		setLoading(true);
		try {
			await api.post("/agendamentos", {
				animadorId: Number(animadorId),
				dataHora,
			});
			setSucesso(true);
			setTimeout(() => navigate("/dashboard"), 1500);
		} catch (err) {
			setErro(err.message);
		} finally {
			setLoading(false);
		}
	}

	return (
		<>
			<Header />
			<main className="pageWrapper">
				<PageHeader
					title="✨ Novo Agendamento"
					subtitle="Escolha o personagem e confirme a data da festa."
				/>

				<div className="page-content">
					<div className="container formContainer">
						{sucesso && (
							<Alert type="success">
								✅ Agendamento criado com sucesso!
								Redirecionando…
							</Alert>
						)}
						{erro && <Alert type="error">⚠️ {erro}</Alert>}

						<div className="card">
							<form onSubmit={handleSubmit}>
								<div className="form-group">
									<label>Personagem / Animador</label>
									<select
										className="form-control"
										value={animadorId}
										onChange={(e) =>
											setAnimadorId(e.target.value)
										}
										required
									>
										<option value="">
											Selecione um personagem
										</option>
										{animadores.map((a) => (
											<option
												key={a.id}
												value={a.id}
											>
												{a.personagem.nome} —{" "}
												{a.usuario.nome}
											</option>
										))}
									</select>
								</div>

								<div className="form-group">
									<label>Data e Hora</label>
									<input
										type="datetime-local"
										className={`form-control ${styles.dateInput}`}
										value={dataHora}
										onChange={(e) =>
											setDataHora(e.target.value)
										}
										required
									/>
								</div>

								<button
									type="submit"
									className="btn-auth"
									disabled={loading || sucesso}
								>
									{loading
										? "Agendando…"
										: "🎉 Confirmar Agendamento"}
								</button>
							</form>
						</div>
					</div>
				</div>
			</main>
			<Footer />
		</>
	);
}
