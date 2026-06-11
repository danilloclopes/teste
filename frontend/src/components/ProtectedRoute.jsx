import { Navigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext";

export default function ProtectedRoute({ children }) {
	const { usuario } = useAuth();

	if (usuario === undefined) {
		return (
			<div className="spinner">
				<span>⏳</span> Carregando...
			</div>
		);
	}

	if (!usuario) {
		return (
			<Navigate
				to="/login"
				replace
			/>
		);
	}

	return children;
}
