import json
import pathlib
import shutil
import subprocess

import pytest

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
    with starship_path.open('rb') as f:
        tomllib.load(f)


def test_emacs_init_syntax():
    emacs = shutil.which('emacs')
    if emacs is None:
        pytest.skip('Emacs is not installed')
    init_file = pathlib.Path(__file__).resolve().parents[1] / '.config/emacs/init.el'
    expression = '''(with-temp-buffer
      (insert-file-contents (pop command-line-args-left))
      (emacs-lisp-mode)
      (check-parens)
      (goto-char (point-min))
      (condition-case nil
          (while t (read (current-buffer)))
        (end-of-file nil)))'''
    subprocess.run(
        [emacs, '--batch', '-Q', '--eval', expression, str(init_file)],
        check=True, capture_output=True, text=True,
    )
