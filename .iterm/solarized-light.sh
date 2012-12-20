osascript <<-END
    tell application "iTerm"
        repeat with myTerminal in terminals
            repeat with mySession in sessions in myTerminal
                tell mySession
                    set background color to {64842, 62778, 56626}
                    set bold color to {18134, 23373, 25098}
                    set cursor color to {21257, 26684, 28737}
                    set cursor_text color to {60037, 58326, 52284}
                    set foreground color to {21257, 26684, 28737}
                    set selection color to {60037, 58326, 52284}
                    set selected text color to {18134, 23373, 25098}
                end tell
            end repeat
        end repeat
    end tell
END
