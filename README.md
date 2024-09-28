# dotfiles

## symlink

```shell
ln -s /path/to/repository/.gitconfig ~/.gitconfig
ln -s /path/to/repository/.vimrc ~/.vimrc
ln -s /path/to/repository/.wezterm.lua ~/.wezterm.lua
ln -s /path/to/repositoyr/.config/git/ignore ~/.config/git/ignore
ln -s /path/to/repository/.config/starship.toml ~/.config/starship.toml
ln -s /path/to/repository/.config/karabiner ~/.config/karabiner
```

## .zshrc

```shell
if [ -f /path/to/repository/.zshrc ]; then
  source /path/to/repository/.zshrc
fi
```
