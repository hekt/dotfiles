;; appearance

;; modeline
(setq-default
 mode-line-format
 '(""
   (:eval
    (cond (buffer-read-only
           (propertize " RO " 'face 'mode-line-read-only-face))
          ((buffer-modified-p)
           (propertize " ** " 'face 'mode-line-modified-face))
          (t " -- ")))
   " "
   mode-line-buffer-identification
   "   ("
   (line-number-mode "%2l")
   (:eval (format "/%d" (count-lines (point-max) (point-min))))
   (column-number-mode ", %2c")
   ")  "
   global-mode-string
   " ["
   mode-name
   mode-line-process
   (:eval (propertize (format-mode-line minor-mode-alist)
                      'face 'mode-line-minor-mode-face))
   "]"
   (which-func-mode ("" which-func-format "-"))
   " "))

(make-face 'mode-line-read-only-face)
(set-face-attribute 'mode-line-read-only-face nil
                    :foreground "red"
                    :background "default")
(make-face 'mode-line-modified-face)
(set-face-attribute 'mode-line-modified-face nil
                    :foreground "blue"
                    :background "default")

;; Toggle theme light and dark function
(defun light-theme ()
  (interactive)
  (load-theme 'solarized-light t)
  ;; auto-complete
  (set-face-foreground 'ac-completion-face "white")
  (set-face-background 'ac-completion-face "yellow")
  (shell-command "tmux source-file ~/.tmux/solarized-light.conf")
  (shell-command "osascript ~/.iterm/solarized-light.scpt"))
(defun dark-theme ()
  (interactive)
  (load-theme 'solarized-dark t)
  ;; auto-complete
  (set-face-foreground 'ac-completion-face "black")
  (set-face-background 'ac-completion-face "yellow")
  (shell-command "tmux source-file ~/.tmux/solarized-dark.conf")
  (shell-command "osascript ~/.iterm/solarized-dark.scpt"))

(dark-theme)
