type Props = { id: string; label?: string; placeholder?: string; error?: string };

export function TextField({ id, label, placeholder, error }: Props) {
  return (
    <div className="field">
      {label && <label htmlFor={id}>{label}</label>}
      <input id={id} placeholder={placeholder} aria-invalid={!!error} aria-describedby={error ? `${id}-error` : undefined} />
      {error && <p id={`${id}-error`}>{error}</p>}
    </div>
  );
}
