;; Keybinds

(setq mac-option-modifier 'meta)
(define-key global-map (kbd "C-h") 'delete-backward-char)
(define-key global-map (kbd "C-o") 'other-window)

;; sence-region
(define-key global-map (kbd "C-c s") 'cua-set-rectangle-mark)

;; anything
(define-key global-map (kbd "C-c a") 'anything)

;; magit
(define-key global-map (kbd "C-c m") 'magit-status)

;; windmove
(define-key global-map (kbd "C-c p") 'windmove-up)
(define-key global-map (kbd "C-c n") 'windmove-down) 
(define-key global-map (kbd "C-c b") 'windmove-left) 
(define-key global-map (kbd "C-c f") 'windmove-right)

;; copy / paste / cut
(if window-system 
    (progn
      (defun paste-from-pasteboard ()
        (interactive)
        (and mark-active (filter-buffer-substring (region-beginning) (region-end) t))
        (insert (ns-get-pasteboard)))
      (defun copy-to-pasteboard (p1 p2)
        (interactive "r*")
        (ns-set-pasteboard (buffer-substring p1 p2))
        (message "Copied selection to pasteboard"))
      (defun cut-to-pasteboard (p1 p2) (interactive "r*")
        (ns-set-pasteboard (filter-buffer-substring p1 p2 t)))
      (global-set-key (kbd "s-v") 'paste-from-pasteboard)
      (global-set-key (kbd "s-c") 'copy-to-pasteboard)
      (global-set-key (kbd "s-x") 'cut-to-pasteboard)
      )
  (progn
    (require 'osx-clipboard)
    (define-key global-map (kbd "C-c M-v") 'osx-pbpaste)
    (define-key global-map (kbd "C-c M-c") 'osx-pbcopy)
    (define-key global-map (kbd "C-c M-x") 'osx-pbcut)
    )
)
