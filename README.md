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

## .zshrc

```shell
if [ -f /path/to/repository/.config/zshrc ]; then
  source /path/to/repository/.config/zshrc
fi
```
