;; popwin

(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:special-display-config '(("*Help*")
                                      ("*Completions*")
                                      ("*compilatoin*")
                                      ("*Occur*")))
