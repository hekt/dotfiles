;;
;; Functions
;;

;; Toggle theme light and dark
(defun light-theme ()
  (interactive)
  (progn
    (load-theme 'solarized-light t)
    (shell-command "tmux source-file ~/.tmux/solarized-light.conf")
    (shell-command "~/.iterm/solarized-light.sh")
    ))
(defun dark-theme ()
  (interactive)
  (progn
    (load-theme 'solarized-dark t)
    (shell-command "tmux source-file ~/.tmux/solarized-dark.conf")
    (shell-command "~/.iterm/solarized-dark.sh")
    ))

;; convert html to syntax-highlighter compatible
(defun md-to-sh (start end)
  (interactive "r")
  (replace-regexp
   "<!-- \\(.+\\) -->\n\n<pre><code>\n\\(\\(.*?\n*?\\)+?\\)\n</code></pre>"
   "<pre class=\"brush: \\1\">\\2</pre>" 
   nil start end))

;; add css vendor prefixes
(defun add-css-vendor-prefixes (start end)
  (interactive "r")
  (replace-regexp
   "\\([\s\t]*\\)\\(\\(?:.\\|\n\\)+;\\)"
   "\\1-webkit-\\2\n\\1-moz-\\2\n\\1-ms-\\2\n\\1-o-\\2\n\\&"
   nil start end))
(defun add-css-vendor-prefixes-to-value (start end)
  (interactive "r")
  (replace-regexp
   "\\([\s\t]*[a-zA-Z-]+[\s\t]*:[\s\t]*\\)\\(\\(?:.\\|\n\\)+;\\)"
   "\\1-webkit-\\2\n\\1-moz-\\2\n\\1-ms-\\2\n\\1-o-\\2\n\\&"
   nil start end))
(defun add-css-vendor-prefixes-to-both (start end)
  (interactive "r")
  (replace-regexp
   "\\([\s\t]*\\)\\([a-zA-Z-]+[s\t]*:[\s\t]*\\)\\(\\(?:.\\|\n\\)+;\\)"
   "\\1-webkit-\\2-webkit-\\3\n\\1-moz-\\2-moz-\\3\n\\1-ms-\\2-ms-\\3\n\\1-o-\\2-o-\\3\n\\&"
   nil start end))

;; 
;; Advices
;; 

;; remove an indent when do kill-line at the last of line
;; http://dev.ariel-networks.com/wp/documents/aritcles/emacs/part16
(defadvice kill-line (before kill-line-and-fixup activate)
  (when (and (not (bolp)) (eolp))
    (forward-char)
    (fixup-whitespace)
    (backward-char)))
