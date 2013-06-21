(require 'sws-mode)
(require 'jade-mode)    
(require 'stylus-mode)
(add-to-list 'auto-mode-alist '("\\.styl$" . stylus-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

(defun stylus-after-save-hook-func ()
  (shell-command
   (format
    "stylus %s"
    (buffer-file-name (current-buffer)))))

(add-hook 'stylus-mode-hook
  (lambda ()
    (add-hook 'after-save-hook 'stylus-after-save-hook-func nil t)))
