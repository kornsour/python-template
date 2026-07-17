# Python Template

A batteries-included starting point for Python projects: **uv + hatchling**
packaging, **ruff** (lint + format), **pyright** type-checking, **pytest**,
**pre-commit**, and cost-savvy **centralized CI + Dependabot** — wired up from
the first commit.

> Click **“Use this template”** on GitHub to start a new repo from it, then run
> the steps below.

## Quick start

```bash
make setup      # create the venv, install dev deps, install the pre-commit hook
make check      # everything CI runs, locally: ruff + pyright + pytest
```

Then replace `src/python_template/` with your own package (update the package
name in `pyproject.toml` under `[tool.hatch.build.targets.wheel]` and the import
in `tests/`).

| Command | Does |
|---|---|
| `make setup` | venv + dev deps + pre-commit hook |
| `make test` | pytest |
| `make lint` | ruff check |
| `make fmt` | ruff auto-fix + format |
| `make typecheck` | pyright |
| `make check` | lint + typecheck + test |

## What's included

- **Packaging** — `pyproject.toml` (PEP 621), `uv` for envs, `hatchling` build backend, `src/` layout.
- **Quality** — ruff (lint + format), pyright (basic), pytest, pre-commit hooks.
- **CI** — `.github/workflows/ci.yml` calls the shared reusable workflow in
  [`kornsour/gh-automation`](https://github.com/kornsour/gh-automation).
- **Dependabot** — grouped weekly `pip` + `github-actions` updates with patch/minor auto-merge.
- **Branch protection** — a repository ruleset requiring the CI check on `main`.

## Cost-conscious CI by design

Actions minutes are the scarce resource, so the setup minimizes them:

- **Public repo → unlimited free minutes.** Private repos draw down the billed
  quota; keeping the template public means CI is free.
- **One CI job, not four.** ruff, pyright, and pytest run in a single job — one
  runner spin-up and one dependency install per run, instead of a job-per-check
  fan-out.
- **`concurrency: cancel-in-progress`.** Pushing a new commit cancels the
  superseded run rather than letting both finish.
- **Dev extras only in CI.** Heavy runtime frameworks (torch/jax/…) live behind
  optional extras and never download during CI.
- **Dependabot grouping.** Minor/patch bumps arrive as one grouped PR per week
  (one CI run) and auto-merge once checks pass; majors come individually.
- **Self-hosted runner toggle.** Set the repo/org variable
  `USE_SELF_HOSTED_RUNNER=true` to route CI to a self-hosted runner (zero billed
  minutes); unset, it uses `ubuntu-latest`.

## License

MIT — see [LICENSE](LICENSE).
