;; copy / paste / cut for OS X

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

(if window-system 
    (progn
      (define-key global-map (kbd "s-v") 'paste-from-pasteboard)
      (define-key global-map (kbd "s-c") 'copy-to-pasteboard)
      (define-key global-map (kbd "s-x") 'cut-to-pasteboard))
  (progn
    (require 'osx-clipboard)
    (define-key global-map (kbd "C-c M-v") 'osx-pbpaste)
    (define-key global-map (kbd "C-c M-c") 'osx-pbcopy)
    (define-key global-map (kbd "C-c M-x") 'osx-pbcut)))
