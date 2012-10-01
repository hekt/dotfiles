;; appearance

(if window-system (load-theme 'solarized-dark t) (load-theme 'ir-black t))

;; set shell-mode colors
(when window-system
  (progn
    (setq ansi-color-names-vector
          ["#002B36" ; black
           "#DC322F" ; red
           "#859900" ; green
           "#B58900" ; yellow
           "#268BD2" ; blue
           "#D33682" ; magenta
           "#2AA198" ; cyan
           "#FDF6E3" ; white
           ])
    (setq ansi-color-map (ansi-color-make-color-map))))

;; set ansi-term-mode colors
(when window-system
  (progn
    (setq ansi-term-color-vector
          [unspecified
           "#002B36" ; black
           "#DC322F" ; red
           "#859900" ; green
           "#B58900" ; yellow
           "#268BD2" ; blue
           "#D33682" ; magenta
           "#2AA198" ; cyan
           "#FDF6E3" ; white
           ])))
