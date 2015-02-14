;; hamlet

(defun hamlet-mode-hooks ()
  (define-key hamlet-mode-map (kbd "<") 'skeleton-pair-insert-maybe))
(add-hook 'hamlet-mode-hook 'hamlet-mode-hooks)
