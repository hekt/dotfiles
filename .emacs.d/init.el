(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
(require 'package)
(add-to-list 'package-archives 
  '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives 
  '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-buffer-max-length 28)
 '(helm-truncate-lines t t)
 '(package-selected-packages
   (quote
    (multiple-cursors pug-mode stylus-mode haml-mode markdown-mode php-mode scss-mode lua-mode coffee-mode js2-mode typescript-mode helm color-theme-solarized auto-complete popwin yasnippet haxe-mode anything-config))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
