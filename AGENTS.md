# Repository Guidelines

## Project Structure & Module Organization
- .config/: Tool configs (versioned). Notable paths:
  - `.config/zsh/zshrc`, `.config/git/{config,ignore}`, `.config/wezterm/wezterm.lua`
  - `.config/karabiner/karabiner.json`, `.config/starship.toml`, `.config/vim/vimrc`
- tests/: Python tests validating config syntax (JSON/TOML parsing).
- .github/: CI workflow running `pytest` on PRs and pushes.
- Submodules: e.g., `.config/zsh/anyframe`. Initialize with `git submodule update --init --recursive`.

Example symlinks (adapt to your path):
`ln -s /path/to/repo/.config/git ~/.config/git`

## Build, Test, and Development Commands
- Run tests: `pytest -v` — validates JSON/TOML configs load successfully.
- Install test deps locally: `pip install pytest toml` (Python 3.11+ can skip `toml`).
- CI mirrors: see `.github/workflows/test.yml` for exact steps.

## Coding Style & Naming Conventions
- General: keep configs deterministic, portable, and free of machine-specific paths.
- Indentation: JSON 2 spaces; TOML 2 spaces; Lua aligned tables; Vimscript conventional indent.
- Filenames/paths: lower-case directories under `.config/<tool>/`; avoid spaces.
- Zsh: prefer POSIX-compatible constructs where possible; avoid sourcing non-existent files.
- Git: keep ignore rules minimal and specific; no global excludes here.

## Testing Guidelines
- Framework: `pytest` (see `tests/test_configs.py`).
- Add tests when introducing new config types: parse them to ensure validity.
- Naming: `tests/test_*.py` with clear, fast checks (no external calls).
- Keep all tests green; update tests when changing file locations or formats.

## Commit & Pull Request Guidelines
- Commits: imperative, concise subject (e.g., `update git/ignore`, `use delta as git pager`).
- Scope: mention the tool and area touched (e.g., `wezterm: adjust colors`).
- PRs: include description, rationale, and before/after snippets or screenshots when UX-visible (Karabiner, Wezterm).
- Checklist: CI green, tests updated, README/symlink examples updated if paths change, submodules synced when relevant.

## Security & Configuration Tips
- Do not commit secrets, tokens, hostnames, or user-specific paths.
- Prefer `$XDG_CONFIG_HOME`-aware paths; keep OS-specific settings isolated and commented.
- For macOS-only tooling (Karabiner), gate with comments and avoid breaking non-macOS setups.

