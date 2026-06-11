export default function SocialDisplay({ title, icon }) {
	return (
        <span
            className="social-link"
            title={title}>
            {icon}
        </span>
	);
}
