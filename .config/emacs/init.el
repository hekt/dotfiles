;;; init.el --- Small terminal editing setup -*- lexical-binding: t; -*-

;; Keep Custom output separate from this versioned file.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)

(setq inhibit-startup-screen t
      initial-scratch-message nil)
(menu-bar-mode -1)
(column-number-mode 1)
(prefer-coding-system 'utf-8)
(delete-selection-mode 1)
(show-paren-mode 1)
(savehist-mode 1)

;; Keep recovery files outside the edited project.
(let ((backup-dir (expand-file-name "backups/" user-emacs-directory))
      (auto-save-dir (expand-file-name "auto-save/" user-emacs-directory)))
  (make-directory backup-dir t)
  (make-directory auto-save-dir t)
  (setq backup-directory-alist `(("." . ,backup-dir))
        auto-save-file-name-transforms `((".*" ,auto-save-dir t))))

;; Make C-h act like Backspace, including in minibuffers. F1 still opens help.
(define-key key-translation-map (kbd "C-h") (kbd "DEL"))

;; Familiar editing keys.
(keymap-global-set "C-c r" #'replace-string)
(keymap-global-set "C-c M-r" #'replace-regexp)
(keymap-global-set "C-x [" #'beginning-of-buffer)
(keymap-global-set "C-x ]" #'end-of-buffer)

;; direnv reads .envrc as Bash, regardless of the interactive shell.
(add-to-list 'auto-mode-alist '("/\\.envrc\\'" . sh-mode))
(add-hook 'sh-mode-hook
          (lambda ()
            (when (and buffer-file-name
                       (equal (file-name-nondirectory buffer-file-name) ".envrc"))
              (sh-set-shell "bash"))))

;; Install packages once with package-install, not during editor startup.
(require 'package)
(package-initialize)
(if (require 'vertico nil t)
    (vertico-mode 1)
  (display-warning 'init "Install vertico with M-x package-install."))

(if (require 'orderless nil t)
    (setq completion-styles '(orderless basic)
          completion-category-defaults nil
          completion-category-overrides '((file (styles partial-completion)))
          completion-pcm-leading-wildcard t)
  (display-warning 'init "Install orderless with M-x package-install."))

;; Use terminal defaults instead of a fixed light or dark background.
(defun my/terminal-appearance (&optional frame)
  "Use terminal colors and a contrasting mode line on FRAME."
  (interactive)
  (with-selected-frame (or frame (selected-frame))
    (unless (display-graphic-p)
      (set-face-attribute 'default nil
                          :foreground "unspecified-fg"
                          :background "unspecified-bg")
      (dolist (face '(mode-line mode-line-active))
        (set-face-attribute face nil
                            :foreground "unspecified-fg"
                            :background "unspecified-bg"
                            :inverse-video t :box nil))
      (set-face-attribute 'mode-line-inactive nil
                          :foreground "unspecified-fg"
                          :background "unspecified-bg"
                          :inverse-video nil :underline t :box nil)
      (dolist (face '(region vertico-current))
        (when (facep face)
          (set-face-attribute face nil
                              :foreground "unspecified-fg"
                              :background "unspecified-bg"
                              :inverse-video t))))))

;; Terminal initialization can replace default colors after init.el is loaded.
(add-hook 'window-setup-hook #'my/terminal-appearance)
(add-hook 'after-make-frame-functions #'my/terminal-appearance 90)

;;; init.el ends here
