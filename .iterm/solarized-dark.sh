osascript <<-END
    tell application "iTerm"
        repeat with myTerminal in terminals
            repeat with mySession in sessions in myTerminal
                tell mySession
                    set background color to {0, 7722, 9941}
                    set bold color to {33160, 37017, 36937}
                    set cursor color to {28873, 33398, 33872}
                    set cursor_text color to {0, 10207, 12694}
                    set foreground color to {28873, 33398, 33872}
                    set selection color to {0, 10207, 12694}
                    set selected text color to {33160, 37017, 36937}
                end tell
            end repeat
        end repeat
    end tell
END
