const BASE_URL = import.meta.env.VITE_API_URL || "/api";

async function request(path, options = {}) {
	const res = await fetch(`${BASE_URL}${path}`, {
		...options,
		credentials: "include",
		headers: {
			"Content-Type": "application/json",
			...options.headers,
		},
	});

	if (res.status === 204) return null;

	const data = await res.json().catch(() => ({}));

	if (!res.ok) {
		throw new Error(data.error || `Erro ${res.status}`);
	}

	return data;
}

export const api = {
	get: (path) => request(path, { method: "GET" }),
	post: (path, body) =>
		request(path, { method: "POST", body: JSON.stringify(body) }),
	put: (path, body) =>
		request(path, { method: "PUT", body: JSON.stringify(body) }),
	delete: (path) => request(path, { method: "DELETE" }),
};
