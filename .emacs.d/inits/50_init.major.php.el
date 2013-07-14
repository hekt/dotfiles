(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-hook 'php-mode-hook 
          '(lambda()
             (define-key php-mode-map (kbd "(") 'skeleton-pair-insert-maybe)
             (define-key php-mode-map (kbd "{") 'skeleton-pair-insert-maybe)
             (setq skeleton-pair 1)
             ))
