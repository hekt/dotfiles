;; 
;; keybinds
;; 

(setq mac-option-modifier 'meta)

;;
;; global-map
;; 

(define-key global-map (kbd "C-h") 'delete-backward-char)
(define-key global-map (kbd "C-c r") 'replace-string)
(define-key global-map (kbd "C-c M-r") 'replace-regexp)
(define-key global-map (kbd "M-g") 'fill-region-with-fold-by-comma)

;; auto complete ( { [ "
(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(setq skeleton-pair 1)

;; windmove
(define-key global-map (kbd "C-c p") 'windmove-up)
(define-key global-map (kbd "C-c n") 'windmove-down) 
(define-key global-map (kbd "C-c b") 'windmove-left) 
(define-key global-map (kbd "C-c f") 'windmove-right)

;; compile
(define-key global-map (kbd "C-c c") 'compile)
