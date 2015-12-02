;; appearance

;; linum
(global-linum-mode t)
(setq linum-format "%3d ")
(setq linum-delay t)
(defadvice linum-schedule (around my-linum-schedule () activate)
  (run-with-idle-timer 0.2 nil #'linum-update-current))

;; display tab/space
;; http://d.hatena.ne.jp/syohex/20110119/1295450495
(require 'whitespace)
(setq whitespace-style '(face tabs tab-mark spaces space-mark))
(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
        ;; WARNING: the mapping below has a problem.
        ;; When a TAB occupies exactly one column, it will display the
        ;; character ?\xBB at that column followed by a TAB which goes to
        ;; the next TAB column.
        ;; If this is a problem for you, please, comment the line below.
        (tab-mark ?\t [?\xBB ?\t] [?\\ ?\t])))
(setq whitespace-space-regexp "\\(\u3000+\\)")
(set-face-foreground 'whitespace-tab "#666666")
(set-face-background 'whitespace-tab 'nil)
(set-face-foreground 'whitespace-space "#666666")
(set-face-background 'whitespace-space 'nil)
(global-whitespace-mode 1)

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

;; solarized-dark hotfix
;; https://github.com/pyr/dot.emacs/blob/20f06ff6345f1c76d30f9ac1aed54ddf0e3b9531/customizations/40-theme.el
(setq solarized-default-background-mode 'dark)
(load-theme 'solarized t)
(defun set-background-mode (frame mode)
  (set-frame-parameter frame 'background-mode mode)
  (when (not (display-graphic-p frame))
    (set-terminal-parameter (frame-terminal frame) 'background-mode mode))
  (enable-theme 'solarized))
(defun switch-theme ()
  (interactive)
  (let ((mode  (if (eq (frame-parameter nil 'background-mode) 'dark)
                   'light 'dark)))
    (set-background-mode nil mode)))
(add-hook 'after-make-frame-functions
          (lambda (frame) (set-background-mode frame solarized-default-background-mode)))
(set-background-mode nil solarized-default-background-mode)

;; Change iTesm2, tmux and emacs's theme
(defun tne-theme()
  (interactive)
  (load-theme 'my-tomorrow-night-eighties t)
  (set-face-background 'helm-buffer-saved-out "black")
  (set-face-foreground 'helm-buffer-saved-out "red")
  (call-process-shell-command "tmux source-file ~/.tmux/tomorrow-night-eighties.conf"))
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

(tne-theme)
