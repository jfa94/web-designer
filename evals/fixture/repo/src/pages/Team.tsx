import { Banner } from "../components/Banner";
import { Button } from "../components/Button";
import { TextField } from "../components/TextField";

export function Team() {
  return (
    <main>
      <h1>Team</h1>
      <Banner tone="neutral" icon="alert">You have used 9 of 10 seats.</Banner>
      <TextField id="invite-email" placeholder="Email address" />
      <Button variant="primary">Send invite</Button>
      <Button variant="danger">Remove member</Button>
    </main>
  );
}
