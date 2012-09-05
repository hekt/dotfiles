(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/haskell-mode/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")
