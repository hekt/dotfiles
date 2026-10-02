# dotfiles

## symlink

```shell
ln -s /path/to/repository/.config/starship.toml ~/.config/starship.toml
ln -s /path/to/repository/.config/karabiner ~/.config/karabiner
ln -s /path/to/repository/.config/vim ~/.config/vim
ln -s /path/to/repository/.config/wezterm ~/.config/wezterm
```

### Notes

- vim requires patch 9.1.0327 to use `.config` (`$XDG_CONFIG_HOME`)

## Git

Keep `${XDG_CONFIG_HOME:-$HOME/.config}/git` as a real directory.
Store shared settings in this repository. Keep local identity and signing
settings outside the repository. Back up an existing Git directory or symlink
before migrating.

Create the local `git/config` file with the following content. Replace the
repository path and identity values for your setup:

```ini
[include]
    path = /path/to/repository/.config/git/config
[user]
    name = Your Name
    email = your-verified-email@example.com
    signingKey = YOUR_SIGNING_KEY
[commit]
    gpgSign = true
```

Local settings after the include override shared settings. Link only the
ignore file into the local Git directory:

```shell
ln -s /path/to/repository/.config/git/ignore "${XDG_CONFIG_HOME:-$HOME/.config}/git/ignore"
```

For automation, create a separate local `git/codex.gitconfig` that includes
the shared config directly and sets its own signing key. Select it with
`GIT_CONFIG_GLOBAL`. Do not commit local identity or signing files.

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
The Zsh config sets `EDITOR` and `VISUAL` to `emacs -nw`. Git's `core.editor`
uses the same command. Each invocation starts a terminal Emacs process; no
daemon is needed. Open a new terminal to apply the shell settings, or run
`export EDITOR='emacs -nw' VISUAL='emacs -nw'` in an existing shell.
For Git messages, save with `C-x C-s`, then exit with `C-x C-c` to let Git
continue. Exiting without saving is not a reliable way to cancel a Git action.

Terminal frames use the terminal's default foreground and background colors.
The active mode line, selected region, and current completion candidate use
reverse video. Inactive mode lines use an underline. No fixed light or dark
background is selected. Syntax highlighting keeps the standard Emacs colors.
Theme changes while Emacs is running still depend on the terminal's behavior.
The Zsh config exports `COLORTERM=truecolor` for the 24-bit color terminals
used with this setup. This lets Emacs draw the detected background accurately
during startup. Open a new terminal or run `export COLORTERM=truecolor` before
starting Emacs. Do not use this override on terminals without true color support.
Restart Emacs to apply init changes, or run `M-x my/terminal-appearance` after
evaluating the updated definition.

| Keys | Action |
| --- | --- |
| `C-x C-f` | Open a file |
| `C-x C-s` | Save |
| `C-x C-c` | Exit |
| `C-g` | Cancel |
| `C-h` | Backspace (also in minibuffers) |
| `F1` | Standard help prefix |
| `C-c r` / `C-c M-r` | Replace text / regular expression |
| `C-x [` / `C-x ]` | Start / end of buffer |

In Vertico, use `C-n` / `C-p` to select, `RET` to accept, and `TAB` to insert
the selected candidate. To use a new file name instead of a selected candidate,
move up to the input prompt with `C-p` and press `RET`.
In the ChatGPT terminal, the Karabiner rule provides Option-based Meta for
`b`, `f`, `d`, `v`, and `x`. Use `Esc` followed by the key for other Meta keys.
The Control-key remapping rules exclude ChatGPT, so Emacs receives the original
keys. Emacs translates `C-h` to Backspace; this does not affect the chat input.

## .zshrc

```shell
if [ -f /path/to/repository/.config/zsh/zshrc ]; then
  source /path/to/repository/.config/zsh/zshrc
fi
```
