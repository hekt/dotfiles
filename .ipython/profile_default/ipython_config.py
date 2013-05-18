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
c.PromptManager.out_template = "{color.Green}--> "

# editor
c.TerminalInteractiveShell.editor = 'nano'

# exit without confirmation
c.TerminalInteractiveShell.confirm_exit = False
