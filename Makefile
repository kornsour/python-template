# python-template — common workflows (uv-managed env).
.DEFAULT_GOAL := help
PY := uv run

.PHONY: help setup test lint fmt typecheck check clean

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}'

setup: ## Create the venv and install dev deps + pre-commit hook
	uv venv --python 3.14
	uv pip install -e ".[dev]"
	$(PY) pre-commit install || true

test: ## Run the test suite
	$(PY) -m pytest

lint: ## Lint with ruff
	$(PY) -m ruff check .

fmt: ## Auto-format and fix with ruff
	$(PY) -m ruff check --fix .
	$(PY) -m ruff format .

typecheck: ## Type-check with pyright
	$(PY) -m pyright

check: lint typecheck test ## Run everything CI runs, locally

clean: ## Remove caches
	rm -rf .pytest_cache .ruff_cache
	find . -name __pycache__ -type d -prune -exec rm -rf {} +
