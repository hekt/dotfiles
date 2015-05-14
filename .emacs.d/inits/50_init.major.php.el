;; php

(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

(defun php-mode-hooks ()
  (define-key php-mode-map (kbd "(") 'skeleton-pair-insert-maybe)
  (define-key php-mode-map (kbd "{") 'skeleton-pair-insert-maybe)
  (setq skeleton-pair 1)
  (setq tab-width 4
        c-basic-offset 4
        indent-tabs-mode t))
