type Props = {
  variant?: "primary" | "secondary" | "danger";
  loading?: boolean;
  disabled?: boolean;
  onClick?: () => void;
  children: React.ReactNode;
};

export function Button({ variant = "secondary", loading, disabled, onClick, children }: Props) {
  return (
    <button className={`btn btn-${variant}`} disabled={disabled || loading} aria-busy={loading} onClick={onClick}>
      {children}
    </button>
  );
}
