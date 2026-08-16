# Project conventions

Python project scaffolded from `kornsour/python-template`.

- **Env & deps:** `uv`. `make setup` creates the venv and installs `.[dev]`. Add
  runtime deps to `[project.dependencies]`; keep heavy/optional ones under
  `[project.optional-dependencies]` so CI stays light.
- **Quality gate:** `make check` (ruff lint + ruff format + pyright + pytest) is
  exactly what CI enforces. Run it before pushing.
- **CI:** `.github/workflows/ci.yml` calls the reusable
  `kornsour/gh-automation/.github/workflows/python-ci.yml`. Don't inline CI logic
  here — change it upstream in `gh-automation` so every repo benefits.
- **Dependencies:** Dependabot opens grouped weekly PRs; patch/minor auto-merge
  when green. Review majors yourself.
- **`main` is protected:** merge via PR; the `ci / Lint, type-check & test` check
  must pass.

## Infrastructure as code

Read [`docs/agent.md`](./docs/agent.md) before adding cloud resources. This
repository owns deployable application infrastructure; the private
[Lurking Walrus IaC operating model](https://github.com/Lurking-Walrus/.github-private/blob/main/docs/IAC-OPERATING-MODEL.md)
owns organization/account boundaries, identity, shared domains, and guardrails.
Use exact repository-and-environment-scoped GitHub OIDC roles, keep secrets out
of source and logs, tag resources, include an IaC plan/cost/rollback summary in
the PR, and obtain explicit authority before creating external or billable
resources.
