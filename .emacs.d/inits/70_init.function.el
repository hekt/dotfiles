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
\\1\\2"
   nil start end))
