(add-hook 'html-mode-hook
          (lambda ()
            (define-key html-mode-map (kbd "<") 'skeleton-pair-insert-maybe)))
