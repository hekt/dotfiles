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
