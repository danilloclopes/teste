export default function RollingAnchor({ reference, functionText, text }) {

	function handleAnchorClick(e, id) {
		e.preventDefault();
		setMenuOpen(false);
		if (location.pathname !== "/") {
			navigate("/");
			setTimeout(() => {
				const el = document.getElementById(id);
				if (el) el.scrollIntoView({ behavior: "smooth" });
			}, 120);
		} else {
			const el = document.getElementById(id);
			if (el) el.scrollIntoView({ behavior: "smooth" });
		}
	}

    return (
        <a
            href={reference}
            onClick={(e) => handleAnchorClick(e, functionText)}>
            {text}
        </a>
    )
}