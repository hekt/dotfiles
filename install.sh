#!/bin/sh

home_dir="$HOME"
dotfile_dir="$HOME/dotfiles"
backup_dir="$HOME/dotfiles/dotbackups"

ylw='\033[33m'
grn='\033[32m'
nrm='\033[m'

mkdir $backup_dir
cd $dotfile_dir

for dotfile in .?*; do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ] && [ $dotfile != '.osx' ]; then
        echo "$dotfile"
        if [ -e "$home_dir/$dotfile" ]; then
            echo -e "${ylw}===>${nrm} already exists in $home_dir"
            mv "$home_dir/$dotfile" $backup_dir
            echo -e "${ylw}===>${nrm} move to $backup_dir"
        fi
        ln -s "$dotfile_dir/$dotfile" $home_dir
        echo -e "${ylw}===>${nrm} make symlink"
    fi
done

if [ ! "$(ls -A $backup_dir )" ]; then
    echo "$backup_dir is empty"
    rmdir $backup_dir
    echo "remove $backup_dir"
fi

echo -e "${grn}complete${nrm}"
