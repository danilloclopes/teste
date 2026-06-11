import { useState } from "react";
import { useNavigate } from "react-router-dom";
import { useAuth } from "../../context/AuthContext";
import AuthCard from "../../components/AuthCard";
import Alert from "../../components/Alert";
import InputField from "../../components/InputField";

export default function Login() {
	const [email, setEmail] = useState("");
	const [senha, setSenha] = useState("");
	const [erro, setErro] = useState("");
	const [loading, setLoading] = useState(false);
	const { login } = useAuth();
	const navigate = useNavigate();

	async function handleSubmit(e) {
		e.preventDefault();
		setErro("");
		setLoading(true);
		try {
			await login(email, senha);
			navigate("/dashboard");
		} catch (err) {
			setErro(err.message);
		} finally {
			setLoading(false);
		}
	}

	return (
		<AuthCard
			title="Bem-vindo de volta!"
			footerText="Ainda não tem conta?"
			footerLink="/cadastro"
			footerLinkText="Criar conta grátis"
		>
			{erro && <Alert type="error">⚠️ {erro}</Alert>}

			<form
				onSubmit={handleSubmit}
				noValidate
			>
				<InputField
					label="E-mail"
					icon="📧"
					id="email"
					type="email"
					placeholder="seu@email.com"
					value={email}
					onChange={(e) => setEmail(e.target.value)}
					required
				/>
				<InputField
					label="Senha"
					icon="🔒"
					id="senha"
					type="password"
					placeholder="Sua senha"
					value={senha}
					onChange={(e) => setSenha(e.target.value)}
					required
				/>
				<button
					type="submit"
					className="btn-auth"
					disabled={loading}
				>
					{loading ? "Entrando…" : "Entrar na minha conta"}
				</button>
			</form>
		</AuthCard>
	);
}
