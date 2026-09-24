# dotfiles

## symlink

```shell
ln -s /path/to/repository/.config/git ~/.config/git
ln -s /path/to/repository/.config/starship.toml ~/.config/starship.toml
ln -s /path/to/repository/.config/karabiner ~/.config/karabiner
ln -s /path/to/repository/.config/vim ~/.config/vim
ln -s /path/to/repository/.config/wezterm ~/.config/wezterm
```

### Notes

- vim requires patch 9.1.0327 to use `.config` (`$XDG_CONFIG_HOME`)

## Emacs

Use Emacs 31 or later. On macOS, install it with `brew install emacs`.
Link only the init file so packages, history, and recovery files stay outside
this repository. Back up an existing init file before creating the link.
Emacs uses `$XDG_CONFIG_HOME/emacs`, or `~/.config/emacs` when unset.
An existing `~/.emacs.d` or legacy `~/.emacs` takes priority. Quit Emacs and
move the old directory to the XDG location before using this setup; do not
leave a `~/.emacs.d` symlink behind. Preserve any legacy init file separately.

```shell
mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/emacs"
ln -s /path/to/repository/.config/emacs/init.el "${XDG_CONFIG_HOME:-$HOME/.config}/emacs/init.el"
emacs -nw
```

On the first run, use `M-x package-refresh-contents`, then
`M-x package-install` to install `vertico` and `orderless`. Restart Emacs.
Startup does not install or update packages. If a package is missing, basic
editing still works and Emacs shows a warning.

The setup provides vertical completion, matching words in any order, saved
minibuffer history, selection replacement, matching parentheses, and Bash
editing for `.envrc`. Packages, history, backup files, and auto-save files are
kept under the same XDG Emacs directory.
The daemon and Git editor settings are configured separately.

| Keys | Action |
| --- | --- |
| `C-x C-f` | Open a file |
| `C-x C-s` | Save |
| `C-x C-c` | Exit |
| `C-g` | Cancel |
| `C-h` | Standard help prefix |
| `C-c r` / `C-c M-r` | Replace text / regular expression |
| `C-x [` / `C-x ]` | Start / end of buffer |

In Vertico, use `C-n` / `C-p` to select, `RET` to accept, and `TAB` to insert
the selected candidate. To use a new file name instead of a selected candidate,
move up to the input prompt with `C-p` and press `RET`.
In the ChatGPT terminal, the Karabiner rule provides Option-based Meta for
`b`, `f`, `d`, `v`, and `x`. Use `Esc` followed by the key for other Meta keys.
The existing Karabiner rule maps `C-h` to Backspace in ChatGPT; Emacs itself
keeps the standard help binding.

## .zshrc

```shell
if [ -f /path/to/repository/.config/zshrc ]; then
  source /path/to/repository/.config/zshrc
fi
```
