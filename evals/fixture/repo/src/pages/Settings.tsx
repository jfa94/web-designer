import { Banner } from "../components/Banner";
import { Button } from "../components/Button";
import { TextField } from "../components/TextField";

export function Settings() {
  return (
    <main>
      <h1>Account settings</h1>
      <Banner tone="warning">Your email address is not verified.</Banner>
      <TextField id="name" label="Full name" />
      <Button variant="primary">Save changes</Button>
      <Button variant="danger">Delete account</Button>
    </main>
  );
}
