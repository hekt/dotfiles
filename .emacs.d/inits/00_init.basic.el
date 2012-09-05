;; Basic

;; coding
(prefer-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)

;; path
(dolist (dir (list
              "/sbin"
              "/usr/sbin"
              "/bin"
              "/usr/bin"
              "/usr/local/bin"
              (expand-file-name "~/bin")
              (expand-file-name "~/.emacs.d/bin")
              ))
  (when (and (file-exists-p dir) (not (member dir exec-path)))
    (setenv "PATH" (concat dir ":" (getenv "PATH")))
    (setq exec-path (append (list dir) exec-path))))

;; display
(tool-bar-mode 0)
(if window-system (menu-bar-mode 1) (menu-bar-mode -1))

(line-number-mode t)
(column-number-mode t)
(global-hl-line-mode t)

(setq inhibit-splash-screen t)
(setq initial-buffer-choice t)
(setq initial-scratch-message nil)

;; initial
(if (boundp 'window-system)
    (setq initial-frame-alist
          (append (list
                   '(font . "Monaco-12")
                   '(width . 81)
                   '(height . 36)
                   ;; '(width . 165)
                   ;; '(height . 64)
                   '(vertical-scroll-bars . nil)
                   ) 
                  initial-frame-alist)))
(setq default-frame-alist initial-frame-alist)

;; edit
(setq scroll-step 1)
(setq-default tab-width 4 indent-tabs-mode nil)

;; backup
(setq make-backup-files nil)

;; sound
(setq ring-bell-function 'ignore)

;; hide a password
(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)

;; sense-region
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; template
(setq auto-insert-directory "~/.emacs.d/templates/")
(load "autoinsert" t)
(setq auto-insert-alist
      (append '(("\\.html" . "html5.template.html"))
              '(("\\.js" . "jquery.template.js"))
              auto-insert-alist))
(add-hook 'find-file-hooks 'auto-insert)
