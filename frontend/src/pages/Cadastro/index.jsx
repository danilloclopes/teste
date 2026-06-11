import { useState } from "react";
import { useNavigate } from "react-router-dom";
import { api } from "../../services/api";
import AuthCard from "../../components/AuthCard";
import Alert from "../../components/Alert";
import InputField from "../../components/InputField";

export default function Cadastro() {
	const [form, setForm] = useState({
		nome: "",
		email: "",
		senha: "",
		cpf: "",
	});
	const [erro, setErro] = useState("");
	const [loading, setLoading] = useState(false);
	const navigate = useNavigate();

	function handleChange(e) {
		setForm((prev) => ({ ...prev, [e.target.name]: e.target.value }));
	}

	async function handleSubmit(e) {
		e.preventDefault();
		setErro("");
		setLoading(true);
		try {
			await api.post("/auth/cadastro", form);
			navigate("/login?sucesso=1");
		} catch (err) {
			setErro(err.message);
		} finally {
			setLoading(false);
		}
	}

	return (
		<AuthCard
			title="Criar minha conta"
			footerText="Já tem uma conta?"
			footerLink="/login"
			footerLinkText="Entrar"
		>
			{erro && <Alert type="error">⚠️ {erro}</Alert>}

			<form
				onSubmit={handleSubmit}
				noValidate
			>
				<InputField
					label="Nome completo"
					icon="👤"
					name="nome"
					type="text"
					placeholder="Seu nome"
					value={form.nome}
					onChange={handleChange}
					required
				/>
				<InputField
					label="E-mail"
					icon="📧"
					name="email"
					type="email"
					placeholder="seu@email.com"
					value={form.email}
					onChange={handleChange}
					required
				/>
				<InputField
					label="CPF"
					icon="🪪"
					name="cpf"
					type="text"
					placeholder="000.000.000-00"
					value={form.cpf}
					onChange={handleChange}
					required
				/>
				<InputField
					label="Senha"
					icon="🔒"
					name="senha"
					type="password"
					placeholder="Crie uma senha"
					value={form.senha}
					onChange={handleChange}
					required
				/>
				<button
					type="submit"
					className="btn-auth"
					disabled={loading}
				>
					{loading ? "Criando conta…" : "Criar conta grátis"}
				</button>
			</form>
		</AuthCard>
	);
}
