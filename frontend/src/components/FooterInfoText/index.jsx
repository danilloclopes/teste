export default function FooterInfoText({ icon, text }) {
    return (
        <p className="footer-contact-item">
            <span>{icon}</span>
            <span>{text}</span>
        </p>
    );
}
