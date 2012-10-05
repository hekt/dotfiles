;; 
;; keybinds
;; 

(setq mac-option-modifier 'meta)

;;
;; global-map
;; 

(define-key global-map (kbd "C-h") 'delete-backward-char)
(define-key global-map (kbd "C-o") 'other-window)
(define-key global-map (kbd "C-c r") 'replace-string)
(define-key global-map (kbd "C-c M-r") 'replace-regexp)

;; sence-region
(define-key global-map (kbd "C-c s") 'cua-set-rectangle-mark)

;; ansi-term
(define-key global-map (kbd "C-c t") '(lambda () 
                                        (interactive) (ansi-term "/bin/bash")))

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
      (define-key global-map (kbd "s-v") 'paste-from-pasteboard)
      (define-key global-map (kbd "s-c") 'copy-to-pasteboard)
      (define-key global-map (kbd "s-x") 'cut-to-pasteboard)
      )
  (progn
    (require 'osx-clipboard)
    (define-key global-map (kbd "C-c M-v") 'osx-pbpaste)
    (define-key global-map (kbd "C-c M-c") 'osx-pbcopy)
    (define-key global-map (kbd "C-c M-x") 'osx-pbcut)
    )
)

;; 
;; term-raw-map
;; 

(add-hook 'term-mode-hook '(lambda()
  (define-key term-raw-map (kbd "M-x") 'nil)
  (define-key term-raw-map (kbd "C-y") 'term-paste)
  (define-key term-raw-map (kbd "C-o") 'other-window)
  (define-key term-raw-map (kbd "C-c r") 'replace-string)
  (define-key term-raw-map (kbd "C-c M-r") 'replace-regexp)
  (define-key term-raw-map (kbd "C-c a") 'anything)
  (define-key term-raw-map (kbd "C-c m") 'magit-status)
  (define-key term-raw-map (kbd "C-c p") 'windmove-up)
  (define-key term-raw-map (kbd "C-c n") 'windmove-down)
  (define-key term-raw-map (kbd "C-c b") 'windmove-left)
  (define-key term-raw-map (kbd "C-c f") 'windmove-right)
))
