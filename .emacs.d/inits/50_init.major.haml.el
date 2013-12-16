;; haml

(push '("*Haml Compile-Log*") popwin:special-display-config)

(defun compile-haml (buffer)
  (interactive)
  (let ((output (replace-regexp-in-string "\.haml" ".html" buffer-file-name)))
    (call-process-region
     (point-min) (point-max)
     "haml" nil buffer t "--double-quote-attributes" "--stdin" output)))

(defun haml-mode-compile-function ()
  (let* ((name "*Haml Compile-Log*")
         (status (compile-haml name)))
    (if (eq status 0)
        (haml-compile-success name)
      (haml-compile-failure name))))

(defun haml-compile-success (name)
  (message "success"))

(defun haml-compile-failure (name)
  (display-buffer (get-buffer name))
  (message "failure"))

(defun haml-mode-after-save-hooks ()
    (haml-mode-compile-function))
(defun haml-mode-hooks ()
  (add-hook 'after-save-hook 'haml-mode-after-save-hooks nil 'make-it-local))

(add-hook 'haml-mode-hook 'haml-mode-hooks)
