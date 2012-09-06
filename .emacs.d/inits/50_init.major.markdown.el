;; markdown-mode

(autoload 'markdown-mode "markdown-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.markdown" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdwn" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-css-path "file:///Users/kaz/Dropbox/Markdown/css/markdown.css")
 '(scroll-bar-mode nil))
