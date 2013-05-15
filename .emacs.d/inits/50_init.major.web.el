(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.html?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . web-mode))

(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-indent-style 2)
)
(add-hook 'web-mode-hook 'web-mode-hook)

;; colors
(set-face-attribute 'web-mode-doctype-face nil :foreground "Green")
(set-face-attribute 'web-mode-html-tag-face nil :foreground "Blue")
(set-face-attribute 'web-mode-html-attr-name-face nil :foreground "Blue")
;; (set-face-attribute 'web-mode-html-attr-value-face nil : foreground "")
(set-face-attribute 'web-mode-css-rule-face nil :foreground "Green")
(set-face-attribute 'web-mode-css-prop-face nil :foreground "Blue")
;; (set-face-attribute 'web-mode-css-pseudo-class-face nil : foreground "")
;; (set-face-attribute 'web-mode-css-at-rule-face nil : foreground "")
;; (set-face-attribute 'web-mode-preprocessor-face nil : foreground "")
;; (set-face-attribute 'web-mode-string-face nil : foreground "")
;; (set-face-attribute 'web-mode-comment-face nil : foreground "")
;; (set-face-attribute 'web-mode-variable-name-face nil : foreground "")
;; (set-face-attribute 'web-mode-function-name-face nil : foreground "")
;; (set-face-attribute 'web-mode-constant-face nil : foreground "")
;; (set-face-attribute 'web-mode-type-face nil : foreground "")
;; (set-face-attribute 'web-mode-keyword-face nil : foreground "")
;; (set-face-attribute 'web-mode-folded-face nil : foreground "")
;; (set-face-attribute 'web-mode-server-face nil : foreground "")
;; (set-face-attribute 'web-mode-css-face nil : foreground "")
;; (set-face-attribute 'web-mode-javascript-face nil : foreground "")
