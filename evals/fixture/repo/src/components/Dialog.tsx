type Props = { title: string; open: boolean; onClose: () => void; children: React.ReactNode };

export function Dialog({ title, open, onClose, children }: Props) {
  if (!open) return null;
  return (
    <div role="dialog" aria-modal="true" aria-labelledby="dialog-title">
      <h2 id="dialog-title">{title}</h2>
      {children}
      <button onClick={onClose}>Close</button>
    </div>
  );
}
