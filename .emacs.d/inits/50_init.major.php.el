;; php

(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

(defun php-mode-hooks ()
  (define-key php-mode-map (kbd "(") 'skeleton-pair-insert-maybe)
  (define-key php-mode-map (kbd "{") 'skeleton-pair-insert-maybe)
  (setq skeleton-pair 1))
(add-hook 'php-mode-hook 'php-mode-hooks)

;; flycheck
(add-hook 'php-mode-hook 'flycheck-mode)
