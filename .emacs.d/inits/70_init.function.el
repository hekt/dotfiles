;;
;; Functions
;;

(defun add-css-vendor-prefixes (start end)
  "Add CSS vendor prefix to properties."
  (interactive "r")
  (replace-regexp
   "\\([\s\t]*\\)\\(\\(?:.+\\|\n\\)+;\\)"
   "\\1-webkit-\\2\n\\1-moz-\\2\n\\1-ms-\\2\n\\1-o-\\2\n\\&"
   nil start end))
(defun add-css-vendor-prefixes-to-value (start end)
  "Add CSS vendor prefix to values."
  (interactive "r")
  (replace-regexp
   "\\([\s\t]*[a-zA-Z-]+[\s\t]*:[\s\t]*\\)\\(\\(?:.\\|\n\\)+;\\)"
   "\\1-webkit-\\2\n\\1-moz-\\2\n\\1-ms-\\2\n\\1-o-\\2\n\\&"
   nil start end))
(defun add-css-vendor-prefixes-to-both (start end)
  "Add CSS vendor prefix to both of properties and values."
  (interactive "r")
  (replace-regexp
   "\\([\s\t]*\\)\\([a-zA-Z-]+[s\t]*:[\s\t]*\\)\\(\\(?:.\\|\n\\)+;\\)"
   "\\1-webkit-\\2-webkit-\\3\n\\1-moz-\\2-moz-\\3\n\\1-ms-\\2-ms-\\3\n\\1-o-\\2-o-\\3\n\\&"
   nil start end))

(defun time-adjust (time start end)
  "Replace time string by time_adjust.py"
  (interactive "nTime(ms): \nr")
  (shell-command-on-region start end (format "time_adjust.py %d" time) t))

(defun compile-scss-with-prefixes-addition (buffer)
  "Add CSS vendor prefix then compile SCSS to CSS."
  (interactive)
  (call-process-region
   (point-min) (point-max)
   "compile_scss_with_vendor_prefixes.py" nil buffer t
   (format "%s.css" (file-name-sans-extension (buffer-file-name)))))

(defun parentheses-normalize (start end)
  "Replace multibyte parentheses to ascii parentheses"
  (interactive "r")
  (replace-string "（" " (" nil start end)
  (replace-string "）" ") " nil start end))

(defun rebuf ()
  "`revert-buffer` with no confirmation"
  (interactive)
  (revert-buffer t t))

;; 
;; Advices
;; 

(defadvice kill-line (before kill-line-and-fixup activate)
  "Reove indent when do kill-line at the last of line.
http://dev.ariel-networks.com/wp/documents/aritcles/emacs/part16"
  (when (and (not (bolp)) (eolp))
    (forward-char)
    (fixup-whitespace)
    (backward-char)))
