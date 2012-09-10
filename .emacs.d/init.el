(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/haskell-mode/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(require 'package)
(add-to-list 'package-archives 
  '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives 
  '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")
