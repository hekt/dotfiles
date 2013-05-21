# Configuration file for ipython.

c = get_config()

# modules
c.InteractiveShellApp.exec_lines = [
    'import os',
    'import sys',
    'import re',
]

# prompt
c.PromptManager.in_template = "{color.Cyan}>>> "
c.PromptManager.out_template = "{color.Green}==> "

# disable a blank line after output
c.TerminalInteractiveShell.separate_in = ''

# disable banner
c.TerminalIPythonApp.display_banner = False

# editor
c.TerminalInteractiveShell.editor = 'nano'

# exit without confirmation
c.TerminalInteractiveShell.confirm_exit = False

# aliases
c.AliasManager.user_aliases = [
    ('ls', 'ls -alpvG'),
]
