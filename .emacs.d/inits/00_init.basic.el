;;
;; Basic
;;

;; coding
(set-language-environment 'utf-8)
(prefer-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)

;; user info
(setq user-full-name "hekt")
(setq user-mail-address "hektorg@gmail.com")

;; display
(menu-bar-mode -1)
(global-hl-line-mode 1)
(setq inhibit-splash-screen t)
(setq initial-buffer-choice t)
(setq initial-scratch-message nil)

;; editing
(setq scroll-step 1)
(setq-default tab-width 4 indent-tabs-mode nil)

;; backup
(setq make-backup-files nil)

;; sound
(setq ring-bell-function 'ignore)

;; hide a password
(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)

;; disable the kill-ring and the system clipboard integration
(setq interprogram-cut-function nil)
(setq interprogram-paste-function nil)
