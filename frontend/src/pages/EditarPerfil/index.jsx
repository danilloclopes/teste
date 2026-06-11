import { useState, useEffect } from "react";
import { Link, useNavigate } from "react-router-dom";
import { api } from "../../services/api";
import Header from "../../components/Header";
import Footer from "../../components/Footer";
import PageHeader from "../../components/PageHeader";
import Alert from "../../components/Alert";
import InputField from "../../components/InputField";
import styles from "./styles.module.css";

export default function EditarPerfil() {
	const [form, setForm] = useState({ nome: "", email: "", senha: "" });
	const [erro, setErro] = useState("");
	const [sucesso, setSucesso] = useState(false);
	const [loading, setLoading] = useState(false);
	const navigate = useNavigate();

	useEffect(() => {
		api.get("/usuarios/perfil").then((u) =>
			setForm((prev) => ({ ...prev, nome: u.nome, email: u.email })),
		);
	}, []);

	function handleChange(e) {
		setForm((prev) => ({ ...prev, [e.target.name]: e.target.value }));
	}

	async function handleSubmit(e) {
		e.preventDefault();
		setErro("");
		setLoading(true);
		try {
			await api.put("/usuarios/perfil", form);
			setSucesso(true);
			setTimeout(() => navigate("/perfil"), 1200);
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
					title="✏️ Editar Perfil"
					subtitle="Atualize suas informações pessoais."
				/>

				<div className="page-content">
					<div className="container formContainer">
						{sucesso && (
							<Alert type="success">
								✅ Perfil atualizado! Redirecionando…
							</Alert>
						)}
						{erro && <Alert type="error">⚠️ {erro}</Alert>}

						<div className="card">
							<form onSubmit={handleSubmit}>
								<InputField
									label="Nome completo"
									icon="👤"
									name="nome"
									type="text"
									value={form.nome}
									onChange={handleChange}
									required
								/>
								<InputField
									label="E-mail"
									icon="📧"
									name="email"
									type="email"
									value={form.email}
									onChange={handleChange}
									required
								/>
								<InputField
									label={
										<>
											Nova senha{" "}
											<span className={styles.senhaHint}>
												(deixe em branco para manter)
											</span>
										</>
									}
									icon="🔒"
									name="senha"
									type="password"
									placeholder="Nova senha"
									value={form.senha}
									onChange={handleChange}
								/>

								<div className={styles.formActions}>
									<button
										type="submit"
										className="btn btn-primary btn-lg actionBtn"
										disabled={loading || sucesso}
									>
										{loading
											? "Salvando…"
											: "Salvar alterações"}
									</button>
									<Link
										to="/perfil"
										className="btn btn-outline btn-lg actionBtn"
									>
										Cancelar
									</Link>
								</div>
							</form>
						</div>
					</div>
				</div>
			</main>
			<Footer />
		</>
	);
}
