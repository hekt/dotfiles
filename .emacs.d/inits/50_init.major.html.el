(font-lock-add-keywords
 'html-mode
 '(("%=" . font-lock-keyword-face)
   ("%" . font-lock-keyword-face)
   ("?php" . font-lock-keyword-face)
   ("?" . font-lock-keyword-face)))

(add-hook 'html-mode-hook
          (lambda ()
            (define-key html-mode-map (kbd "<") 'skeleton-pair-insert-maybe)))
