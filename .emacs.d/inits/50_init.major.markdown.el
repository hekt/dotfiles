;; markdown-mode
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdonw files" t)
(setq auto-mode-alist
      (cons '("\\.md$" . markdown-mode) auto-mode-alist))
