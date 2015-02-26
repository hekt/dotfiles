;; appearance

;; linum
(global-linum-mode t)
(setq linum-format "%3d ")
;; (setq linum-delay t)
;; (defadvice linum-schedule (around my-linum-schedule () activate)
;;   (run-with-idle-timer 0.2 nil #'linum-update-current))

;; modeline
(setq-default
 mode-line-format
 '((:eval
    (cond (buffer-read-only
           (propertize " RO " 'face 'mode-line-read-only-face))
          ((buffer-modified-p)
           (propertize " ** " 'face 'mode-line-modified-face))
          (t " -- ")))
   " "
   mode-line-buffer-identification
   "   ("
   (column-number-mode "%2c: ")
   (line-number-mode "%2l")
   (:eval (format "/%d" (count-lines (point-max) (point-min))))
   ")   ["
   mode-name
   mode-line-process
   minor-mode-alist
   "]"
   "  "   global-mode-string
   ))

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
  ;; (custom-set-faces '(default ((t(:background "ARGBBB000000")))))
  ;; auto-complete
  (set-face-foreground 'ac-completion-face "white")
  (set-face-background 'ac-completion-face "yellow")
  ;; helm
  (set-face-foreground  'helm-selection nil)
  (set-face-background  'helm-selection "white")
  (set-face-underline-p 'helm-selection nil)
  (set-face-bold-p      'helm-selection t)
  (set-face-foreground  'helm-source-header "white")
  (set-face-background  'helm-source-header "#555")
  (set-face-background  'helm-match "white")
  (call-process-shell-command "tmux source-file ~/.tmux/solarized-light.conf")
  (call-process-shell-command "osascript ~/.iterm/solarized-light.scpt"))
(defun dark-theme ()
  (interactive)
  (load-theme 'solarized-dark t)
  ;; (custom-set-faces '(default ((t(:background "ARGBBB000000")))))
  ;; auto-complete
  (set-face-foreground 'ac-completion-face "black")
  (set-face-background 'ac-completion-face "yellow")
  ;; helm
  (set-face-foreground  'helm-selection nil)
  (set-face-background  'helm-selection "black")
  (set-face-underline-p 'helm-selection nil)
  (set-face-bold-p      'helm-selection t)
  (set-face-foreground  'helm-source-header "black")
  (set-face-background  'helm-source-header "#AAA")
  (set-face-background  'helm-match "black")
  (call-process-shell-command "tmux source-file ~/.tmux/solarized-dark.conf")
  (call-process-shell-command "osascript ~/.iterm/solarized-dark.scpt"))
