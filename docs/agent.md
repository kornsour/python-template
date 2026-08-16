# Agent and infrastructure guide

## Source of truth

The private organization-level source of truth is the
[Lurking Walrus IaC operating model](https://github.com/Lurking-Walrus/.github-private/blob/main/docs/IAC-OPERATING-MODEL.md).
It owns AWS account boundaries, Identity Center, organization guardrails, shared
domains, reusable modules, and the cross-project inventory. Membership is
required to read it.

This repository owns infrastructure that deploys the application built from
this template. Keep runtime resources, state backend/key, role ARN,
environments, and rollback procedure in the derived application's repository.

## Before provisioning

1. Record the AWS account, regions, environments, state backend/key, deploy
   role, data classification, budget, and rollback target in
   `PROJECT_CONTEXT.md`.
2. Use GitHub OIDC with an exact repository and protected-environment trust;
   never use long-lived AWS keys in CI or application configuration.
3. Tag resources with `Application`, `Environment`, `Owner`, `ManagedBy`, and
   `Lifecycle`.
4. Start experiments in a shared Applications or Sandbox boundary. Use a
   dedicated production account only for customer data, material blast radius,
   distinct cost/quotas, or distinct security/retention requirements.

## Delivery rules

- Place OpenTofu or other deployable IaC under `infra/` in the derived app.
- Pull requests must include the relevant plan plus cost, secret-name-only,
  migration, and rollback notes.
- Apply only from a protected deployment environment after review, then verify
  the resulting live state.
- Do not create accounts, DNS records, paid resources, production data changes,
  or public endpoints without explicit user authority.
- Prefer pay-per-use services; treat persistent databases, NAT gateways, public
  IPs, provisioned concurrency, and unbounded logs as explicit cost decisions.
