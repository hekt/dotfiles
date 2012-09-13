#!/bin/sh

home_dir="$HOME"
dotfile_dir="$HOME/dotfiles"
backup_dir="$HOME/dotfiles/dotbackups"

mkdir $backup_dir
cd $dotfile_dir

for dotfile in .?*; do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ]; then
        if [ -e "$home_dir/$dotfile" ]; then
            mv "$home_dir/$dotfile" $backup_dir
            echo "$dotfile already exists"
            echo "move $dotfiles to $backup_dir"
        fi
        ln -s "$dotfile_dir/$dotfile" $home_dir
        echo "make symlink to $dotfile"
    fi
done

if [ ! "$(ls -A $backup_dir )" ]; then
    rmdir $backup_dir
fi

echo 'complete'
