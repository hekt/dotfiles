;; php
(require 'flymake-phpcs)

(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

(defun php-mode-hooks ()
  (define-key php-mode-map (kbd "(") 'skeleton-pair-insert-maybe)
  (define-key php-mode-map (kbd "{") 'skeleton-pair-insert-maybe)
  (setq skeleton-pair 1)
  (setq tab-width 4
        c-basic-offset 4
        indent-tabs-mode t)
  (c-set-offset 'case-label c-basic-offset))

(custom-set-variables
 '(flymake-phpcs-command "/Users/k-horie/repos/infiniteloop-codesniffer/vendor/bin/phpcs")
 '(flymake-phpcs-standard "/Users/k-horie/repos/infiniteloop-codesniffer/InfiniteLoop"))

(add-hook 'php-mode-hook 'php-mode-hooks)
;; flycheck
(add-hook 'php-mode-hook 'flymake-phpcs-load)

(defun display-error-message ()
  (message (get-char-property (point) 'help-echo)))
(defadvice flymake-goto-prev-error (after flymake-goto-prev-error-display-message)
  (display-error-message))
(defadvice flymake-goto-next-error (after flymake-goto-next-error-display-message)
  (display-error-message))
(ad-activate 'flymake-goto-prev-error 'flymake-goto-prev-error-display-message)
(ad-activate 'flymake-goto-next-error 'flymake-goto-next-error-display-message)
