;; javascript

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq js2-basic-offset 2)
(setq-default js2-global-externs 
              '("FileReader" "jQuery" "$" "setTimeout" "clearTimeout"
                "setInterval" "clearInterval" "location" "console" "JSON"
                "chrome" "localStorage" "sessionStorage" "history"
                "navigator"))
