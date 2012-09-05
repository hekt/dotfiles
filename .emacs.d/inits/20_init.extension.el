;; Extensions

;; package
(require 'package)
(add-to-list 'package-archives 
             '("MELPA" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("Marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; recent files
(require 'recentf)
(setq recentf-max-menu-items 20)
(setq recentf-max-saved-items 100)

;; Anything
(require 'anything)
(require 'anything-config)
(setq anything-sources
      '(anything-c-source-buffers+
        anything-c-source-recentf
        anything-c-source-files-in-current-dir
        anything-c-source-emacs-commands
        anything-c-source-emacs-functions
        ;; anything-c-source-colors
        ))

;; auto complete
(require 'auto-complete)
(global-auto-complete-mode t)

;; clipboard
(require 'osx-clipboard)
