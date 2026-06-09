(function () {
	"use strict";

	/* ── Validação do formulário de login ── */
	const form = document.getElementById("loginForm");
	const emailEl = document.getElementById("email");
	const senhaEl = document.getElementById("senha");

	function setInvalid(input, errorId, show) {
		const err = document.getElementById(errorId);
		if (show) {
			input.classList.add("invalid");
			err.classList.add("visible");
		} else {
			input.classList.remove("invalid");
			err.classList.remove("visible");
		}
		return !show;
	}

	function validateEmail(value) {
		return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value.trim());
	}

	emailEl.addEventListener("input", function () {
		setInvalid(emailEl, "emailError", !validateEmail(this.value));
	});

	senhaEl.addEventListener("input", function () {
		setInvalid(senhaEl, "senhaError", this.value.trim() === "");
	});

	form.addEventListener("submit", function (e) {
		const emailOk = setInvalid(
			emailEl,
			"emailError",
			!validateEmail(emailEl.value),
		);
		const senhaOk = setInvalid(
			senhaEl,
			"senhaError",
			senhaEl.value.trim() === "",
		);

		if (!emailOk || !senhaOk) {
			e.preventDefault();
			if (!emailOk) emailEl.focus();
			else senhaEl.focus();
		}
	});

	/* ── Toggle visibilidade da senha ── */
	document.querySelectorAll(".toggle-password").forEach(function (btn) {
		btn.addEventListener("click", function () {
			var targetId = this.getAttribute("data-target");
			var input = document.getElementById(targetId);
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
