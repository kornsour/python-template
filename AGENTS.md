# Agent instructions

Read [`CLAUDE.md`](./CLAUDE.md) and [`docs/agent.md`](./docs/agent.md) before
changing this template or provisioning cloud resources.

- Run `make check` before publishing changes.
- Keep deployable application infrastructure in this repository once it exists.
- The private Lurking Walrus IaC operating model is authoritative for AWS
  accounts, organization guardrails, identity, shared domains, and reusable
  modules.
- Use GitHub OIDC, never long-lived cloud credentials. Do not create accounts,
  DNS/public endpoints, billable resources, or production changes without
  explicit authority.
