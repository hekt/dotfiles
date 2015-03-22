;; javascript

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq js2-basic-offset 2)
(setq js2-strict-inconsistent-return-warning nil)
(setq js2-strict-trailing-comma-warning nil)
(setq js2-indent-switch-body t)
(setq-default js2-global-externs
              '("setTimeout" "clearTimeout" "setInterval" "clearInterval"
                "location" "console" "JSON" "navigator"
                ;; new apis
                "FileReader" "localStorage" "sessionStorage" "history"
                ;; libs
                "$" "jQuery" "Vue" "chrome"
                ;; node.js
                "global" "require" "process" "module" "exports"
                ))
