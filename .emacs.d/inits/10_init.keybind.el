;; Keybinds

(setq mac-option-modifier 'meta)
(define-key global-map (kbd "C-h") 'delete-backward-char)
(define-key global-map (kbd "C-o") 'other-window)

;; sence-region
(define-key global-map (kbd "C-c s") 'cua-set-rectangle-mark)

;; anything
(define-key global-map (kbd "C-c a") 'anything)

;; windmove
(define-key global-map (kbd "C-c p") 'windmove-up)
(define-key global-map (kbd "C-c n") 'windmove-down) 
(define-key global-map (kbd "C-c b") 'windmove-left) 
(define-key global-map (kbd "C-c f") 'windmove-right)
