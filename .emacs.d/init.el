(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/haskell-mode/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(require 'package)
(add-to-list 'package-archives 
  '("MELPA" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives 
  '("Marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")
