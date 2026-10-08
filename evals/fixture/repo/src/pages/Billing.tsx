import { Banner } from "../components/Banner";
import { Button } from "../components/Button";

export function Billing() {
  return (
    <main>
      <h1>Billing</h1>
      <Banner tone="warning">Your card expires this month.</Banner>
      <Button variant="primary">Upgrade plan</Button>
      <Button variant="primary">Update payment method</Button>
      <Button variant="secondary">Cancel subscription</Button>
    </main>
  );
}
