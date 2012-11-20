;; Basic

;; coding
(set-language-environment 'utf-8)
(prefer-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)

;; path
(dolist (dir (list "/sbin" "/usr/sbin" "/bin" "/usr/bin" "/usr/local/bin"
                   (expand-file-name "~/bin")
                   (expand-file-name "~/.emacs.d/bin")))
  (when (and (file-exists-p dir) (not (member dir exec-path)))
    (setenv "PATH" (concat dir ":" (getenv "PATH")))
    (setq exec-path (append (list dir) exec-path))))

;; user info
(setq user-full-name "hekt")
(setq user-mail-address "hektorg@gmail.com")

;; display
;; (tool-bar-mode 0)
(if window-system (menu-bar-mode 1) (menu-bar-mode -1))
(when window-system 
    (setq frame-title-format
          '("%S" (buffer-file-name 
                  "%f" (dired-directory dired-directory "%b")))))

(line-number-mode t)
(column-number-mode t)
(global-hl-line-mode t)

(setq inhibit-splash-screen t)
(setq initial-buffer-choice t)
(setq initial-scratch-message nil)

;; initial-frame
(when (boundp 'window-system)
    (setq initial-frame-alist
          (append (list
                   '(font . "Monaco-12")
                   '(width . 80)
                   '(height . 36)
                   ;; '(width . 163)
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

;; Disable the kill-ring and the system clipboard integration
(setq interprogram-cut-function nil)
(setq interprogram-paste-function nil)

;; sense-region
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; auto complete ( { [ "
(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(setq skeleton-pair 1)
