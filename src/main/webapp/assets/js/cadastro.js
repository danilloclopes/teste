(function () {
	"use strict";

	/* ── Seletor de tipo de conta ── */
	var roleCards = document.querySelectorAll(".role-card");
	var personagemSection = document.getElementById("personagemSection");

	document
		.querySelectorAll('input[name="tipoConta"]')
		.forEach(function (radio) {
			radio.addEventListener("change", function () {
				roleCards.forEach(function (c) {
					c.classList.remove("role-card--selected");
				});
				this.closest(".role-card").classList.add("role-card--selected");

				if (this.value === "personagem") {
					personagemSection.classList.add(
						"personagem-section--visible",
					);
				} else {
					personagemSection.classList.remove(
						"personagem-section--visible",
					);
					setInvalid(
						document.getElementById("tipoPersonagem"),
						"tipoPersonagemError",
						false,
					);
					setInvalid(
						document.getElementById("valorHora"),
						"valorHoraError",
						false,
					);
				}
			});
		});

	function isPersonagemSelected() {
		var checked = document.querySelector('input[name="tipoConta"]:checked');
		return checked && checked.value === "personagem";
	}

	/* ── Máscara de CPF ── */
	var cpfEl = document.getElementById("cpf");
	cpfEl.addEventListener("input", function () {
		var v = this.value.replace(/\D/g, "").substring(0, 11);
		v = v.replace(/^(\d{3})(\d)/, "$1.$2");
		v = v.replace(/^(\d{3})\.(\d{3})(\d)/, "$1.$2.$3");
		v = v.replace(/\.(\d{3})(\d)/, ".$1-$2");
		this.value = v;
	});

	/* ── Máscara de telefone ── */
	var telefoneEl = document.getElementById("telefone");
	telefoneEl.addEventListener("input", function () {
		var v = this.value.replace(/\D/g, "").substring(0, 11);
		if (v.length <= 10) {
			v = v.replace(/^(\d{2})(\d{4})(\d{0,4})/, "($1) $2-$3");
		} else {
			v = v.replace(/^(\d{2})(\d{5})(\d{0,4})/, "($1) $2-$3");
		}
		this.value = v;
	});

	/* ── Máscara de valor por hora (R$) ── */
	var valorHoraEl = document.getElementById("valorHora");
	valorHoraEl.addEventListener("input", function () {
		var digits = this.value.replace(/\D/g, "");
		if (digits === "") {
			this.value = "";
			return;
		}
		var cents = parseInt(digits, 10);
		var reais = (cents / 100).toFixed(2);
		this.value =
			"R$ " +
			reais.replace(".", ",").replace(/\B(?=(\d{3})+(?!\d))/g, ".");
	});

	/* ── Força da senha ── */
	var senhaEl = document.getElementById("senha");
	var fillEl = document.getElementById("strengthFill");
	var textEl = document.getElementById("strengthText");

	function avaliarSenha(senha) {
		var score = 0;
		if (senha.length >= 8) score++;
		if (senha.length >= 12) score++;
		if (/[A-Z]/.test(senha)) score++;
		if (/[0-9]/.test(senha)) score++;
		if (/[^A-Za-z0-9]/.test(senha)) score++;
		return score;
	}

	senhaEl.addEventListener("input", function () {
		var val = this.value;
		var score = avaliarSenha(val);
		var pct = val.length === 0 ? 0 : Math.min(100, score * 20);
		var color, label;

		if (val.length === 0) {
			color = "transparent";
			label = "";
		} else if (score <= 1) {
			color = "#ef4444";
			label = "Muito fraca";
		} else if (score === 2) {
			color = "#f97316";
			label = "Fraca";
		} else if (score === 3) {
			color = "#eab308";
			label = "Média";
		} else if (score === 4) {
			color = "#22c55e";
			label = "Forte";
		} else {
			color = "#16a34a";
			label = "Muito forte";
		}

		fillEl.style.width = pct + "%";
		fillEl.style.background = color;
		textEl.textContent = label;
		textEl.style.color = color;
	});

	/* ── Helpers de validação ── */
	function setInvalid(input, errorId, show) {
		var err = document.getElementById(errorId);
		if (show) {
			input.classList.add("invalid");
			input.classList.remove("valid");
			err.classList.add("visible");
		} else {
			input.classList.remove("invalid");
			if (input.value && input.value.trim() !== "")
				input.classList.add("valid");
			err.classList.remove("visible");
		}
		return !show;
	}

	function validateEmail(v) {
		return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(v.trim());
	}

	function parseValorHora(v) {
		var digits = v.replace(/\D/g, "");
		return digits.length > 0 ? parseInt(digits, 10) : 0;
	}

	/* ── Validação em tempo real ── */
	var nomeEl = document.getElementById("nome");
	var emailEl = document.getElementById("email");
	var confirmarSenhaEl = document.getElementById("confirmarSenha");
	var termosEl = document.getElementById("termos");
	var tipoPersonagemEl = document.getElementById("tipoPersonagem");

	nomeEl.addEventListener("input", function () {
		setInvalid(
			nomeEl,
			"nomeError",
			this.value.trim().split(/\s+/).filter(Boolean).length < 2,
		);
	});

	emailEl.addEventListener("input", function () {
		setInvalid(emailEl, "emailError", !validateEmail(this.value));
	});

	senhaEl.addEventListener("input", function () {
		setInvalid(senhaEl, "senhaError", this.value.length < 8);
		if (confirmarSenhaEl.value !== "") {
			setInvalid(
				confirmarSenhaEl,
				"confirmarSenhaError",
				confirmarSenhaEl.value !== this.value,
			);
		}
	});

	confirmarSenhaEl.addEventListener("input", function () {
		setInvalid(
			confirmarSenhaEl,
			"confirmarSenhaError",
			this.value !== senhaEl.value,
		);
	});

	tipoPersonagemEl.addEventListener("change", function () {
		if (isPersonagemSelected()) {
			setInvalid(
				tipoPersonagemEl,
				"tipoPersonagemError",
				this.value === "",
			);
		}
	});

	valorHoraEl.addEventListener("input", function () {
		if (isPersonagemSelected()) {
			setInvalid(
				valorHoraEl,
				"valorHoraError",
				parseValorHora(this.value) <= 0,
			);
		}
	});

	/* ── Validação de CPF ── */
	cpfEl.addEventListener("input", function () {
		setInvalid(
			cpfEl,
			"cpfError",
			this.value.replace(/\D/g, "").length !== 11,
		);
	});

	function cpfValido(val) {
		return val.replace(/\D/g, "").length === 11;
	}

	/* ── Submit ── */
	document
		.getElementById("cadastroForm")
		.addEventListener("submit", function (e) {
			var nomeOk = setInvalid(
				nomeEl,
				"nomeError",
				nomeEl.value.trim().split(/\s+/).filter(Boolean).length < 2,
			);
			var emailOk = setInvalid(
				emailEl,
				"emailError",
				!validateEmail(emailEl.value),
			);
			var cpfOk = setInvalid(cpfEl, "cpfError", !cpfValido(cpfEl.value));
			var senhaOk = setInvalid(
				senhaEl,
				"senhaError",
				senhaEl.value.length < 8,
			);
			var confOk = setInvalid(
				confirmarSenhaEl,
				"confirmarSenhaError",
				confirmarSenhaEl.value !== senhaEl.value,
			);
			var termosOk = setInvalid(
				termosEl,
				"termosError",
				!termosEl.checked,
			);

			var personagemOk = true;
			var valorOk = true;
			if (isPersonagemSelected()) {
				personagemOk = setInvalid(
					tipoPersonagemEl,
					"tipoPersonagemError",
					tipoPersonagemEl.value === "",
				);
				valorOk = setInvalid(
					valorHoraEl,
					"valorHoraError",
					parseValorHora(valorHoraEl.value) <= 0,
				);
			}

			if (
				!nomeOk ||
				!emailOk ||
				!cpfOk ||
				!senhaOk ||
				!confOk ||
				!termosOk ||
				!personagemOk ||
				!valorOk
			) {
				e.preventDefault();
				var firstInvalid = document.querySelector(
					".form-control.invalid",
				);
				if (firstInvalid) firstInvalid.focus();
			}
		});

	/* ── Toggle visibilidade de senhas ── */
	document.querySelectorAll(".toggle-password").forEach(function (btn) {
		btn.addEventListener("click", function () {
			var input = document.getElementById(
				this.getAttribute("data-target"),
			);
			if (input.type === "password") {
				input.type = "text";
				this.textContent = "🙈";
			} else {
				input.type = "password";
				this.textContent = "👁️";
			}
		});
	});
})();
