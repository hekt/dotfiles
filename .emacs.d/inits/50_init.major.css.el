;; css
(setq css-indent-offset 2)

;; stylus
(require 'sws-mode)
(require 'jade-mode)
(require 'stylus-mode)
(add-to-list 'auto-mode-alist '("\\.styl$" . stylus-mode))
(defun stylus-after-save-hook-func ()
  (shell-command
   (format "stylus %s" (buffer-file-name (current-buffer)))))
(add-hook 'stylus-mode-hook
          (lambda ()
            (add-hook 'after-save-hook 'stylus-after-save-hook-func nil t)))

;; sass
(require 'haml-mode)
(setq haml-backspace-backdents-nesting nil)
(require 'sass-mode)
(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))

;; scss
(require 'scss-mode)
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))
(setq scss-compile-at-save nil)
