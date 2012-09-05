;; apache-mode

(autoload 'apache-mode "apache-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.htaccess$" . apache-mode))
(add-to-list 'auto-mode-alist '("\\.conf$" . apache-mode))
