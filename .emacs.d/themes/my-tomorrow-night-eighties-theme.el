(deftheme my-tomorrow-night-eighties "Tomorrow Night Eighties color theme")

(custom-theme-set-faces
 'my-tomorrow-night-eighties

 '(default ((t (:background "default" :foreground "default"))))
 '(region ((t (:foreground "#999999" :background "white"))))
 '(hl-line ((t (:background "#515151"))))
 '(font-lock-variable-name-face ((t (:foreground "cyan"))))
 '(font-lock-comment-face ((t (:foreground "#999999"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "#999999"))))
 '(font-lock-type-face ((t (:foreground "green"))))
 '(font-lock-keyword-face ((t (:foreground "magenta"))))
 '(font-lock-constant-face ((t (:foreground "magenta"))))
 '(font-lock-string-face ((t (:foreground "green"))))
 '(font-lock-builtin-face ((t (:foreground "blue"))))
 '(font-lock-function-name-face ((t (:foreground "yellow"))))

 '(mode-line ((t (:foreground "#515151" :background "#cccccc"))))
 '(mode-line-inactive ((t (:foreground "#515151" :background "default"))))
 ;; '(mode-line-buffer-id ((t (:foreground "default"))))

 ;; linum
 '(linum ((t (:foreground "#999999" :background "#393939"))))

 ;; js2-mode
 '(js2-function-param ((t (:foreground "blue"))))
 '(js2-external-variable ((t (:foreground "red"))))

 ;; helm
 ;; '(helm-buffer-size (:foreground ,yellow))
 ;; '(helm-buffer-not-saved (:foreground ,orange))
 ;; '(helm-buffer-process (:foreground ,aqua))
 ;; '(helm-buffer-directory (:foreground ,blue))
 ;; '(helm-ff-directory (:foreground ,aqua))
 ;; '(helm-candidate-number (:foreground ,red))
 '(helm-selection ((t (:background "#515151"))))
 ;; '(helm-separator ((t (:foreground "red"))))
 '(helm-source-header ((t (:foreground "default" :background "#999999"))))
 )

;; (set-face-foreground 'paren-face "red")
;; (set-face-foreground 'helm-buffer-not-saved "yellow")




 ;; ;; モードライン
 ;; '(mode-line ((t (:foreground "#F8F8F2" :background "#000000"
 ;;                  :box (:line-width 1 :color "#000000" :style released-button)))))
 ;; '(mode-line-buffer-id ((t (:foreground nil :background nil))))
 ;; '(mode-line-inactive ((t (:foreground "#BCBCBC" :background "#333333"
 ;;                           :box (:line-width 1 :color "#333333")))))

 ;; ;; ハイライト
 ;; '(highlight ((t (:foreground "#000000" :background "#C4BE89"))))

 ;; ;; 括弧
 ;; '(show-paren-match-face ((t (:foreground "#1B1D1E" :background "#FD971F"))))
 ;; '(paren-face ((t (:foreground "#A6E22A" :background nil))))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'my-tomorrow-night-eighties)
