;; Extensions

;; recent files
(require 'recentf)
(setq recentf-max-menu-items 20)
(setq recentf-max-saved-items 100)

;; sense-region
(cua-mode t)
(setq cua-enable-cua-keys nil)
(define-key global-map (kbd "C-c s") 'cua-set-rectangle-mark)
