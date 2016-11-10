;; coffee-mode

(custom-set-variables
 '(coffee-tab-width 2))

(defun coffee-mode-hooks ()
  (auto-complete-mode t))

(add-hook 'coffee-mode-hook 'coffee-mode-hooks)
