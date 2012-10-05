;;
;; Functions
;;

;; convert html to syntax-highlighter compatible
(defun md-to-sh (start end)
  (interactive "r")
  (replace-regexp
   "<!-- \\(.+\\) -->

<pre><code>
\\(\\(.*?
*?\\)+?\\)
</code></pre>"
   "<pre class=\"brush: \\1\">\\2</pre>" 
   nil start end))

;; add css vendor prefixes
(defun add-css-vendor-prefixes (start end)
  (interactive "r")
  (replace-regexp
   "\\( *\\)\\(.*\\)"
   "\\1-webkit-\\2
\\1-moz-\\2
\\1-ms-\\2
\\1-o-\\2
\\&"
   nil start end))

;; 
;; Advices
;; 

;; remove an indent when do kill-line at the last of line
;; http://dev.ariel-networks.com/wp/documents/aritcles/emacs/part16
(defadvice kill-line (before kill-line-and-fixup activate)
  (when (and (not (bolp)) (eolp))
    (forward-char)
    (fixup-whitespace)
    (backward-char)))
