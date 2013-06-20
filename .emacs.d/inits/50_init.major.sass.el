(require 'haml-mode)
(setq haml-backspace-backdents-nesting nil)

(require 'sass-mode)
(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))
