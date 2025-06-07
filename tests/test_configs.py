import json
import pathlib

try:
    import tomllib  # Python 3.11+
except ModuleNotFoundError:  # pragma: no cover - fallback for older versions
    import toml as tomllib


def test_load_configs():
    repo_root = pathlib.Path(__file__).resolve().parents[1]
    karabiner_path = repo_root / ".config" / "karabiner" / "karabiner.json"
    with karabiner_path.open('r', encoding='utf-8') as f:
        json.load(f)

    starship_path = repo_root / ".config" / "starship.toml"
    with starship_path.open('r', encoding='utf-8') as f:
        tomllib.load(f)
