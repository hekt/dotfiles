;;
;; Basic
;;

;; user info
(setq user-full-name "hekt")
(setq user-mail-address "hektorg@gmail.com")

;; display
(menu-bar-mode -1)
(global-hl-line-mode t)
(column-number-mode t)
(setq inhibit-splash-screen t)
(setq initial-buffer-choice t)
(setq initial-scratch-message nil)

;; editing
(setq scroll-step 1)
(setq-default tab-width 4 indent-tabs-mode nil)
(setq-default fill-column 72)

;; backup
(setq make-backup-files nil)

;; autosave
(setq auto-save-default nil)

;; sound
(setq ring-bell-function 'ignore)

;; hide a password
(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)

;; disable the kill-ring and the system clipboard integration
(setq interprogram-cut-function nil)
(setq interprogram-paste-function nil)

;; autoinsert
(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/templates/")
(define-auto-insert "\\.js$" "javascript.js")
(define-auto-insert "\\.php$" "template.php")
