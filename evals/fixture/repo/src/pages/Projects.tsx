import { Banner } from "../components/Banner";
import { Button } from "../components/Button";

export function Projects() {
  return (
    <main>
      <h1>Projects</h1>
      <Banner tone="neutral" icon="alert">Archived projects are deleted after 90 days.</Banner>
      <p style={{ color: "#d97706" }}>2 projects are over their storage limit.</p>
      <Button variant="primary">New project</Button>
      <Button variant="danger">Delete project</Button>
    </main>
  );
}
