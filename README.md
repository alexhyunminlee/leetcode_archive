# leetcode_archive

Alex's LeetCode journey.

## Reproducible environment

This repo pins **Python**, **Java**, and **Quarto** in three complementary ways. Pick what fits your workflow; they are meant to stay aligned when you bump versions.

### 1. Local runtimes with mise (recommended on the host)

Install [mise](https://mise.jdx.dev/), then from the repo root:

```bash
mise install          # installs tools from mise.toml
uv sync               # creates .venv and installs deps (needs https://github.com/astral-sh/uv)
```

Python patch level is also recorded in `.python-version` for **pyenv** users.

### 2. Dev Container (recommended in Cursor / VS Code)

Use **Dev Containers: Reopen in Container**. The image is built from the root `Dockerfile` (Python 3.12 from Microsoft’s dev image, Debian OpenJDK 21, pinned Quarto `.deb`). After the container starts, `postCreateCommand` runs `uv sync`.

### 3. Docker Compose (CLI or CI)

```bash
docker compose run --rm dev bash
# inside: uv sync, quarto --version, java -version, python --version
```

Bump **Quarto** by changing the `QUARTO_VERSION` build arg at the top of `Dockerfile` (and rebuild). Bump **Java** by changing `JAVA_MAJOR`. The **Python** line in the Dockerfile uses the `mcr.microsoft.com/devcontainers/python:1-3.12-bookworm` tag; for a byte-for-byte pin, add that image’s digest to `FROM` in the Dockerfile.

### Quarto extensions

Quarto extensions are ordinary project files: run `quarto add <publisher>/<name>` in your Quarto project directory, then **commit the generated `_extensions/` folder** so collaborators and CI get the same filters, formats, and shortcodes without running `quarto add` again.
