;; Helm

;; keybinds

(define-key global-map (kbd "C-c a") 'helm-buffers-list)
(define-key global-map (kbd "C-c C-f") 'helm-find-files)
(define-key global-map (kbd "C-c C-r") 'helm-recentf)
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)

;; enable C-h in helm
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)

;; Emulate 'kill-line' in helm minibuffer
(setq helm-delete-minibuffer-contents-from-point t)
(defadvice helm-delete-minibuffer-contents 
  (before helm-emulate-kill-line activate)
  "Emulate 'kill-line' in helm minibuffer"
  (kill-new (buffer-substring (point) (field-end))))
