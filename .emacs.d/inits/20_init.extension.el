;; Extensions

;; recent files
(require 'recentf)
(setq recentf-max-menu-items 20)
(setq recentf-max-saved-items 100)

;; sense-region
(cua-mode t)
(setq cua-enable-cua-keys nil)
(define-key global-map (kbd "C-c s") 'cua-set-rectangle-mark)

;; tramp
(require 'tramp)
(setq tramp-terminal-type "dump")
(setq tramp-default-method "ssh")
(add-to-list 'tramp-default-proxies-alist
             '(nil "\\`root\\'" "/ssh:%h:"))
(add-to-list 'tramp-default-proxies-alist
             '("localhost" nil nil))
(add-to-list 'tramp-default-proxies-alist
             '((regexp-quote (system-name)) nil nil))
