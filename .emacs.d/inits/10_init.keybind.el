;; 
;; keybinds
;; 

(setq mac-option-modifier 'meta)

;;
;; global-map
;; 

(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-c r") 'replace-string)
(global-set-key (kbd "C-c M-r") 'replace-regexp)
(global-set-key (kbd "M-g") 'fill-region-with-fold-by-comma)

(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-q"))
(global-set-key (kbd "C-z C-q") 'quoted-insert)

;; auto complete ( { [ "
(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(setq skeleton-pair 1)

;; windmove
(global-set-key (kbd "C-c p") 'windmove-up)
(global-set-key (kbd "C-c n") 'windmove-down) 
(global-set-key (kbd "C-c b") 'windmove-left) 
(global-set-key (kbd "C-c f") 'windmove-right)

;; compile
(global-set-key (kbd "C-c c") 'compile)
