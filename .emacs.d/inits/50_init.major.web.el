;; web-mode

(add-to-list 'auto-mode-alist '("\\.blade.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ejs$" . web-mode))
(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)
