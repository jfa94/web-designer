type Props = { tone: "info" | "warning" | "neutral"; icon?: "alert" | "info"; children: React.ReactNode };

export function Banner({ tone, icon, children }: Props) {
  return (
    <div className={`banner banner-${tone}`} role="status">
      {icon && <span className={`icon icon-${icon}`} aria-hidden="true" />}
      {children}
    </div>
  );
}
