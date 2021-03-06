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

(defun parentheses-normalize (start end)
  "Replace multibyte parentheses to ascii parentheses"
  (interactive "r")
  (replace-string "（" " (" nil start end)
  (replace-string "）" ") " nil start end))

(defun rebuf ()
  "`revert-buffer` with no confirmation"
  (interactive)
  (revert-buffer t t))

(defun fill-region-with-fold-by-comma (start end)
  (interactive "r")
  (shell-command-on-region
   start end (format "fold-by-comma %d" fill-column) t))

(defun time-adjust (time start end)
  "Replace time string by time_adjust.py"
  (interactive "nTime(ms): \nr")
  (shell-command-on-region
   start end (format "time_adjust.py %d" time) t))

(defun compile-scss-with-preprocessor (buffer)
  "Compile scss file via preprocess script."
  (interactive)
  (call-process-region
   (point-min) (point-max)
   "scss_preprocessor.py" nil buffer t
   (format "%s.css" (file-name-sans-extension (buffer-file-name)))))

(defun un-indent-by-removing-2-spaces ()
  "remove 2 spaces from beginning of of line"
  (interactive)
  (save-excursion
    (save-match-data
      (beginning-of-line)
      ;; get rid of tabs at beginning of line
      (when (looking-at "^\\s-+")
        (untabify (match-beginning 0) (match-end 0)))
      (when (looking-at "^  ")
        (replace-match "")))))

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
