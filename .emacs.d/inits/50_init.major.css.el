;; css

(setq css-indent-offset 2)

;; scss-mode
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))
(setq scss-compile-at-save nil)

(push '("*SASS Compile-Log*") popwin:special-display-config)
(defun scss-mode-compile-function ()
  (let* ((name "*SASS Compile-Log*")
         (status (compile-scss-with-preprocessor name)))
    (if (eq status 0)
        (scss-compile-success name)
      (scss-compile-failure name))))

(defun scss-compile-success (name)
  (message "success"))

(defun scss-compile-failure (name)
  (display-buffer (get-buffer name))
  (message "failure"))

(defun scss-mode-after-save-hooks ()
  (unless (string-match "^_" (file-name-nondirectory (buffer-file-name)))
    (scss-mode-compile-function)))
(defun scss-mode-hooks ()
  (add-hook 'after-save-hook 'scss-mode-after-save-hooks nil 'make-it-local))
(add-hook 'scss-mode-hook 'scss-mode-hooks)
