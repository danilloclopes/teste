document.addEventListener("DOMContentLoaded", function () {
    
	/* ---- Navbar scroll behavior ---- */
	const navbar = document.getElementById("navbar");

	function handleNavbarScroll() {
		if (window.scrollY > 60) {
			navbar.classList.add("scrolled");
		} else {
			navbar.classList.remove("scrolled");
		}
	}

	window.addEventListener("scroll", handleNavbarScroll, { passive: true });
	handleNavbarScroll();

	/* ---- Mobile menu ---- */
	const menuToggle = document.getElementById("menuToggle");
	const mobileNav = document.getElementById("mobileNav");
	const overlay = document.getElementById("overlay");

	function openMenu() {
		menuToggle.classList.add("open");
		mobileNav.classList.add("open");
		overlay.classList.add("open");
		document.body.style.overflow = "hidden";
	}

	function closeMenu() {
		menuToggle.classList.remove("open");
		mobileNav.classList.remove("open");
		overlay.classList.remove("open");
		document.body.style.overflow = "";
	}

	menuToggle.addEventListener("click", function () {
		mobileNav.classList.contains("open") ? closeMenu() : openMenu();
	});

	overlay.addEventListener("click", closeMenu);

	document.querySelectorAll(".mobile-nav a").forEach(function (link) {
		link.addEventListener("click", closeMenu);
	});

	/* ---- Smooth scroll for anchor links ---- */
	document.querySelectorAll('a[href^="#"]').forEach(function (anchor) {
		anchor.addEventListener("click", function (e) {
			const target = document.querySelector(this.getAttribute("href"));
			if (target) {
				e.preventDefault();
				const offset = 80;
				const top =
					target.getBoundingClientRect().top +
					window.scrollY -
					offset;
				window.scrollTo({ top: top, behavior: "smooth" });
			}
		});
	});

	/* ---- Scroll-triggered fade-in ---- */
	const fadeEls = document.querySelectorAll(".fade-in");

	const observer = new IntersectionObserver(
		function (entries) {
			entries.forEach(function (entry) {
				if (entry.isIntersecting) {
					entry.target.classList.add("visible");
					observer.unobserve(entry.target);
				}
			});
		},
		{ threshold: 0.05, rootMargin: "0px 0px -40px 0px" },
	);

	fadeEls.forEach(function (el) {
		observer.observe(el);
	});

	/* Fallback: garante visibilidade caso o observer não dispare */
	setTimeout(function () {
		document
			.querySelectorAll(".fade-in:not(.visible)")
			.forEach(function (el) {
				el.classList.add("visible");
			});
	}, 1200);

	/* ---- Character filter tabs ---- */
	const filterBtns = document.querySelectorAll(".filter-btn");
	const charCards = document.querySelectorAll(".char-card");

	filterBtns.forEach(function (btn) {
		btn.addEventListener("click", function () {
			filterBtns.forEach(function (b) {
				b.classList.remove("active");
			});
			this.classList.add("active");

			const category = this.dataset.filter;

			charCards.forEach(function (card) {
				if (category === "all" || card.dataset.category === category) {
					card.style.display = "block";
					requestAnimationFrame(function () {
						card.style.opacity = "1";
						card.style.transform = "translateY(0)";
					});
				} else {
					card.style.opacity = "0";
					card.style.transform = "translateY(16px)";
					setTimeout(function () {
						card.style.display = "none";
					}, 300);
				}
			});
		});
	});

	/* ---- Testimonial slider ---- */
	const track = document.getElementById("testimonialsTrack");
	const dots = document.querySelectorAll(".slider-dot");
	let currentSlide = 0;
	let autoSlide;

	function getSlideWidth() {
		const card = track.querySelector(".testimonial-card");
		if (!card) return 0;
		return card.offsetWidth + 24;
	}

	function goToSlide(index) {
		const total = dots.length;
		currentSlide = (index + total) % total;
		track.style.transform =
			"translateX(-" + currentSlide * getSlideWidth() + "px)";
		dots.forEach(function (d, i) {
			d.classList.toggle("active", i === currentSlide);
		});
	}

	dots.forEach(function (dot, i) {
		dot.addEventListener("click", function () {
			clearInterval(autoSlide);
			goToSlide(i);
			startAutoSlide();
		});
	});

	function startAutoSlide() {
		autoSlide = setInterval(function () {
			goToSlide(currentSlide + 1);
		}, 4500);
	}

	if (dots.length > 0) {
		goToSlide(0);
		startAutoSlide();
	}

	/* Pause on hover */
	if (track) {
		track.addEventListener("mouseenter", function () {
			clearInterval(autoSlide);
		});
		track.addEventListener("mouseleave", startAutoSlide);
	}

	/* ---- Scroll-to-top button ---- */
	const scrollTopBtn = document.getElementById("scrollTopBtn");

	window.addEventListener(
		"scroll",
		function () {
			if (window.scrollY > 400) {
				scrollTopBtn.classList.add("visible");
			} else {
				scrollTopBtn.classList.remove("visible");
			}
		},
		{ passive: true },
	);

	scrollTopBtn.addEventListener("click", function () {
		window.scrollTo({ top: 0, behavior: "smooth" });
	});

	/* ---- Character card "Reservar" click ---- */
	document.querySelectorAll(".char-btn").forEach(function (btn) {
		btn.addEventListener("click", function (e) {
			e.stopPropagation();
			const cardName =
				this.closest(".char-card").querySelector(
					".char-name",
				).textContent;
			window.location.href =
				"aluguel/novo.jsp?personagem=" + encodeURIComponent(cardName);
		});
	});

	/* ---- CTA primary button ---- */
	document
		.querySelectorAll('[data-action="reservar"]')
		.forEach(function (btn) {
			btn.addEventListener("click", function () {
				const section = document.getElementById("personagens");
				if (section) {
					const top =
						section.getBoundingClientRect().top +
						window.scrollY -
						80;
					window.scrollTo({ top: top, behavior: "smooth" });
				}
			});
		});
});
