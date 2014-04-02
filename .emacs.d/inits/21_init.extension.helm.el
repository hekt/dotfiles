;; Helm

(when (require 'helm-config nil t)
  (helm-mode 0)
  
  (custom-set-variables
   '(helm-truncate-lines t))

  ;; keybinds
  (define-key global-map (kbd "C-c a") 'helm-mini)
  (define-key global-map (kbd "C-c C-f") 'helm-find-files)
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
  )
