;;; haskell-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (ghc-core-mode ghc-core-create-core) "ghc-core"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/ghc-core.el"
;;;;;;  "5d71f8ac044b32df7eebb51005134116")
;;; Generated autoloads from ../../../../.emacs.d/elpa/haskell-mode-20130722.1217/ghc-core.el

(autoload 'ghc-core-create-core "ghc-core" "\
Compile and load the current buffer as tidy core.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.hcr\\'" . ghc-core-mode))

(autoload 'ghc-core-mode "ghc-core" "\
Major mode for GHC Core files.

\(fn)" t nil)

;;;***

;;;### (autoloads (haskell-align-imports) "haskell-align-imports"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-align-imports.el"
;;;;;;  "5e475d3efea4859c5a8b8256af95ac27")
;;; Generated autoloads from ../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-align-imports.el

(autoload 'haskell-align-imports "haskell-align-imports" "\
Align all the imports in the buffer.

\(fn)" t nil)

;;;***

;;;### (autoloads (haskell-c-mode) "haskell-c" "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-c.el"
;;;;;;  "182428eb7aa9aa917e3be4bb53c5c366")
;;; Generated autoloads from ../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-c.el

(add-to-list 'auto-mode-alist '("\\.hsc\\'" . haskell-c-mode))

(autoload 'haskell-c-mode "haskell-c" "\
Major mode for Haskell FFI files.

\(fn)" t nil)

;;;***

;;;### (autoloads (haskell-cabal-get-dir haskell-cabal-mode) "haskell-cabal"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-cabal.el"
;;;;;;  "81a57b18d005c078399df40761f5e85a")
;;; Generated autoloads from ../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-cabal.el

(add-to-list 'auto-mode-alist '("\\.cabal\\'" . haskell-cabal-mode))

(autoload 'haskell-cabal-mode "haskell-cabal" "\
Major mode for Cabal package description files.

\(fn)" t nil)

(autoload 'haskell-cabal-get-dir "haskell-cabal" "\
Get the Cabal dir for a new project. Various ways of figuring this out,
   and indeed just prompting the user. Do them all.

\(fn)" nil nil)

;;;***

;;;### (autoloads (haskell-decl-scan-mode turn-on-haskell-decl-scan
;;;;;;  haskell-ds-create-imenu-index) "haskell-decl-scan" "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-decl-scan.el"
;;;;;;  "384914d74d6d3a7724ebbdf7d6e37264")
;;; Generated autoloads from ../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-decl-scan.el

(autoload 'haskell-ds-create-imenu-index "haskell-decl-scan" "\
Function for finding `imenu' declarations in Haskell mode.
Finds all declarations (classes, variables, imports, instances and
datatypes) in a Haskell file for the `imenu' package.

\(fn)" nil nil)

(autoload 'turn-on-haskell-decl-scan "haskell-decl-scan" "\
Unconditionally activate `haskell-decl-scan-mode'.

\(fn)" t nil)

(autoload 'haskell-decl-scan-mode "haskell-decl-scan" "\
Toggle Haskell declaration scanning minor mode on or off.
With a prefix argument ARG, enable minor mode if ARG is
positive, and disable it otherwise.  If called from Lisp, enable
the mode if ARG is omitted or nil, and toggle it if ARG is `toggle'.

See also info node `(haskell-mode)haskell-decl-scan-mode' for
more details about this minor mode.

Top-level declarations are scanned and listed in the menu item
\"Declarations\" (if enabled via option
`haskell-decl-scan-add-to-menubar').  Selecting an item from this
menu will take point to the start of the declaration.

\\[beginning-of-defun] and \\[end-of-defun] move forward and backward to the start of a declaration.

This may link with `haskell-doc-mode'.

For non-literate and LaTeX-style literate scripts, we assume the
common convention that top-level declarations start at the first
column.  For Bird-style literate scripts, we assume the common
convention that top-level declarations start at the third column,
ie. after \"> \".

Anything in `font-lock-comment-face' is not considered for a
declaration.  Therefore, using Haskell font locking with comments
coloured in `font-lock-comment-face' improves declaration scanning.

Literate Haskell scripts are supported: If the value of
`haskell-literate' (set automatically by `literate-haskell-mode')
is `bird', a Bird-style literate script is assumed.  If it is nil
or `tex', a non-literate or LaTeX-style literate script is
assumed, respectively.

Invokes `haskell-decl-scan-mode-hook' on activation.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (haskell-doc-show-type haskell-doc-current-info
;;;;;;  haskell-doc-mode) "haskell-doc" "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-doc.el"
;;;;;;  "64900753b8b6fa66beb34792c1a0f88f")
;;; Generated autoloads from ../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-doc.el

(autoload 'haskell-doc-mode "haskell-doc" "\
Enter `haskell-doc-mode' for showing fct types in the echo area.
See variable docstring.

\(fn &optional ARG)" t nil)

(defalias 'turn-on-haskell-doc-mode 'haskell-doc-mode)

(autoload 'haskell-doc-current-info "haskell-doc" "\
Return the info about symbol at point.
Meant for `eldoc-documentation-function'.

\(fn)" nil nil)

(autoload 'haskell-doc-show-type "haskell-doc" "\
Show the type of the function near point.
For the function under point, show the type in the echo area.
This information is extracted from the `haskell-doc-prelude-types' alist
of prelude functions and their types, or from the local functions in the
current buffer.

\(fn &optional SYM)" t nil)

;;;***

;;;### (autoloads (haskell-font-lock-choose-keywords) "haskell-font-lock"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-font-lock.el"
;;;;;;  "c729acff80a748d412cc1193df88bc2e")
;;; Generated autoloads from ../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-font-lock.el

(autoload 'haskell-font-lock-choose-keywords "haskell-font-lock" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads (haskell-indent-mode turn-on-haskell-indent) "haskell-indent"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-indent.el"
;;;;;;  "b952aaf23cbc299cff0b71143b68f6a8")
;;; Generated autoloads from ../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-indent.el

(autoload 'turn-on-haskell-indent "haskell-indent" "\
Turn on ``intelligent'' Haskell indentation mode.

\(fn)" nil nil)

(autoload 'haskell-indent-mode "haskell-indent" "\
``Intelligent'' Haskell indentation mode.
This deals with the layout rule of Haskell.
\\[haskell-indent-cycle] starts the cycle which proposes new
possibilities as long as the TAB key is pressed.  Any other key
or mouse click terminates the cycle and is interpreted except for
RET which merely exits the cycle.
Other special keys are:
    \\[haskell-indent-insert-equal]
      inserts an =
    \\[haskell-indent-insert-guard]
      inserts an |
    \\[haskell-indent-insert-otherwise]
      inserts an | otherwise =
these functions also align the guards and rhs of the current definition
    \\[haskell-indent-insert-where]
      inserts a where keyword
    \\[haskell-indent-align-guards-and-rhs]
      aligns the guards and rhs of the region
    \\[haskell-indent-put-region-in-literate]
      makes the region a piece of literate code in a literate script

Invokes `haskell-indent-hook' if not nil.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (turn-on-haskell-indentation haskell-indentation-mode)
;;;;;;  "haskell-indentation" "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-indentation.el"
;;;;;;  "16860aeef5781306636d2ae5cfb7227a")
;;; Generated autoloads from ../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-indentation.el

(autoload 'haskell-indentation-mode "haskell-indentation" "\
Haskell indentation mode that deals with the layout rule.
It rebinds RET, DEL and BACKSPACE, so that indentations can be
set and deleted as if they were real tabs.  It supports
autofill-mode.

\(fn &optional ARG)" t nil)

(autoload 'turn-on-haskell-indentation "haskell-indentation" "\
Turn on the haskell-indentation minor mode.

\(fn)" t nil)

;;;***

;;;### (autoloads (haskell-interactive-mode-reset-error haskell-interactive-mode-echo
;;;;;;  haskell-interactive-switch haskell-interactive-bring haskell-interactive-mode)
;;;;;;  "haskell-interactive-mode" "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-interactive-mode.el"
;;;;;;  "b0c65293b20a88e3d14a6d78d886c8e6")
;;; Generated autoloads from ../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-interactive-mode.el

(autoload 'haskell-interactive-mode "haskell-interactive-mode" "\
Interactive mode for Haskell.

See Info node `(haskell-mode)haskell-interactive-mode' for more
information.

Key bindings:
\\{haskell-interactive-mode-map}

\(fn)" t nil)

(autoload 'haskell-interactive-bring "haskell-interactive-mode" "\
Bring up the interactive mode for this session.

\(fn)" t nil)

(autoload 'haskell-interactive-switch "haskell-interactive-mode" "\
Switch to the interactive mode for this session.

\(fn)" t nil)

(autoload 'haskell-interactive-mode-echo "haskell-interactive-mode" "\
Echo a read only piece of text before the prompt.

\(fn SESSION MESSAGE &optional MODE)" nil nil)

(autoload 'haskell-interactive-mode-reset-error "haskell-interactive-mode" "\
Reset the error cursor position.

\(fn SESSION)" t nil)

;;;***

;;;### (autoloads (haskell-menu) "haskell-menu" "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-menu.el"
;;;;;;  "3ddfc98d9dbb255524f5ea7679b32c20")
;;; Generated autoloads from ../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-menu.el

(autoload 'haskell-menu "haskell-menu" "\
Launch the Haskell sessions menu.

\(fn)" t nil)

;;;***

;;;### (autoloads (haskell-hayoo haskell-hoogle literate-haskell-mode
;;;;;;  haskell-mode haskell-customize haskell-mode-view-news haskell-version)
;;;;;;  "haskell-mode" "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-mode.el"
;;;;;;  "34364078e2ddf9af8f5de8559b4e78db")
;;; Generated autoloads from ../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-mode.el

(autoload 'haskell-version "haskell-mode" "\
Show the `haskell-mode` version in the echo area.
With prefix argument HERE, insert it at point.
When FULL is non-nil, use a verbose version string.
When MESSAGE is non-nil, display a message with the version.

\(fn &optional HERE)" t nil)

(autoload 'haskell-mode-view-news "haskell-mode" "\
Display information on recent changes to haskell-mode.

\(fn)" t nil)

(autoload 'haskell-customize "haskell-mode" "\
Browse the haskell customize sub-tree.
This calls 'customize-browse' with haskell as argument and makes
sure all haskell customize definitions have been loaded.

\(fn)" t nil)

(defvar haskell-mode-map (let ((map (make-sparse-keymap))) (define-key map [24 4] 'inferior-haskell-send-decl) (define-key map [3 26] 'switch-to-haskell) (define-key map [3 12] 'inferior-haskell-load-file) (define-key map [3 2] 'switch-to-haskell) (define-key map (kbd "C-c C-t") 'inferior-haskell-type) (define-key map (kbd "C-c C-i") 'inferior-haskell-info) (define-key map (kbd "C-c M-.") 'inferior-haskell-find-definition) (define-key map (kbd "C-c C-d") 'inferior-haskell-find-haddock) (define-key map [3 22] 'haskell-check) (define-key map (kbd "C-c C-.") 'haskell-mode-format-imports) (define-key map [remap delete-indentation] 'haskell-delete-indentation) map) "\
Keymap used in Haskell mode.")

(autoload 'haskell-mode "haskell-mode" "\
Major mode for editing Haskell programs.

See also Info node `(haskell-mode)Getting Started' for more
information about this mode.

Blank lines separate paragraphs, comments start with `-- '.
\\<haskell-mode-map>
Literate scripts are supported via `literate-haskell-mode'.
The variable `haskell-literate' indicates the style of the script in the
current buffer.  See the documentation on this variable for more details.

Modules can hook in via `haskell-mode-hook'.  The following modules
are supported with an `autoload' command:

   `haskell-decl-scan', Graeme E Moss
     Scans top-level declarations, and places them in a menu.

   `haskell-doc', Hans-Wolfgang Loidl
     Echoes types of functions or syntax of keywords when the cursor is idle.

   `haskell-indentation', Kristof Bastiaensen
     Intelligent semi-automatic indentation Mk2

   `haskell-indent', Guy Lapalme
     Intelligent semi-automatic indentation.

   `haskell-simple-indent', Graeme E Moss and Heribert Schuetz
     Simple indentation.

Module X is activated using the command `turn-on-X'.  For example,
`haskell-indent' is activated using `turn-on-haskell-indent'.
For more information on a module, see the help for its `X-mode'
function.  Some modules can be deactivated using `turn-off-X'.  (Note
that `haskell-doc' is irregular in using `turn-(on/off)-haskell-doc-mode'.)

Use `haskell-version' to find out what version this is.

Invokes `haskell-mode-hook'.

\(fn)" t nil)

(autoload 'literate-haskell-mode "haskell-mode" "\
As `haskell-mode' but for literate scripts.

\(fn)" t nil)
(add-to-list 'auto-mode-alist        '("\\.\\(?:[gh]s\\|hi\\)\\'" . haskell-mode))
(add-to-list 'auto-mode-alist        '("\\.l[gh]s\\'" . literate-haskell-mode))
(add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))
(add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode))

(autoload 'haskell-hoogle "haskell-mode" "\
Do a Hoogle search for QUERY.

\(fn QUERY)" t nil)

(defalias 'hoogle 'haskell-hoogle)

(autoload 'haskell-hayoo "haskell-mode" "\
Do a Hayoo search for QUERY.

\(fn QUERY)" t nil)

(defalias 'hayoo 'haskell-hayoo)

;;;***

;;;### (autoloads (haskell-move-nested-left haskell-move-nested-right
;;;;;;  haskell-move-nested) "haskell-move-nested" "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-move-nested.el"
;;;;;;  "8a7698cdbd00480be3bf3f515b243108")
;;; Generated autoloads from ../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-move-nested.el

(autoload 'haskell-move-nested "haskell-move-nested" "\
Shift the nested off-side-rule block adjacent to point by COLS columns to the right.

In Transient Mark mode, if the mark is active, operate on the contents
of the region instead.

\(fn COLS)" nil nil)

(autoload 'haskell-move-nested-right "haskell-move-nested" "\
Increase indentation of the following off-side-rule block adjacent to point.

Use a numeric prefix argument to indicate amount of indentation to apply.

In Transient Mark mode, if the mark is active, operate on the contents
of the region instead.

\(fn COLS)" t nil)

(autoload 'haskell-move-nested-left "haskell-move-nested" "\
Decrease indentation of the following off-side-rule block adjacent to point.

Use a numeric prefix argument to indicate amount of indentation to apply.

In Transient Mark mode, if the mark is active, operate on the contents
of the region instead.

\(fn COLS)" t nil)

;;;***

;;;### (autoloads (haskell-navigate-imports-return haskell-navigate-imports-go
;;;;;;  haskell-navigate-imports) "haskell-navigate-imports" "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-navigate-imports.el"
;;;;;;  "28c2368c29317b36021ab5479ccb7acf")
;;; Generated autoloads from ../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-navigate-imports.el

(autoload 'haskell-navigate-imports "haskell-navigate-imports" "\
Cycle the Haskell import lines or return to point (with prefix arg).

\(fn &optional RETURN)" t nil)

(autoload 'haskell-navigate-imports-go "haskell-navigate-imports" "\
Go to the first line of a list of consequtive import lines. Cycles.

\(fn)" t nil)

(autoload 'haskell-navigate-imports-return "haskell-navigate-imports" "\
Return to the non-import point we were at before going to the module list.
   If we were originally at an import list, we can just cycle through easily.

\(fn)" t nil)

;;;***

;;;### (autoloads (haskell-process haskell-process-start haskell-process-cabal
;;;;;;  haskell-process-cabal-build haskell-process-load-or-reload
;;;;;;  haskell-process-reload-file haskell-process-load-file haskell-process-do-info
;;;;;;  haskell-process-do-type haskell-process-generate-tags) "haskell-process"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-process.el"
;;;;;;  "ad70a7564b7b0829e8acf073c7f7d0d6")
;;; Generated autoloads from ../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-process.el

(autoload 'haskell-process-generate-tags "haskell-process" "\
Regenerate the TAGS table.

\(fn &optional AND-THEN-FIND-THIS-TAG)" t nil)

(autoload 'haskell-process-do-type "haskell-process" "\
Print the type of the given expression.

\(fn &optional INSERT-VALUE)" t nil)

(autoload 'haskell-process-do-info "haskell-process" "\
Print info on the identifier at point.
If PROMPT-VALUE is non-nil, request identifier via mini-buffer.

\(fn &optional PROMPT-VALUE)" t nil)

(autoload 'haskell-process-load-file "haskell-process" "\
Load the current buffer file.

\(fn)" t nil)

(autoload 'haskell-process-reload-file "haskell-process" "\
Re-load the current buffer file.

\(fn)" t nil)

(autoload 'haskell-process-load-or-reload "haskell-process" "\
Load or reload. Universal argument toggles which.

\(fn &optional TOGGLE)" t nil)

(autoload 'haskell-process-cabal-build "haskell-process" "\
Build the Cabal project.

\(fn)" t nil)

(autoload 'haskell-process-cabal "haskell-process" "\
Prompts for a Cabal command to run.

\(fn)" t nil)

(autoload 'haskell-process-start "haskell-process" "\
Start the inferior Haskell process.

\(fn SESSION)" nil nil)

(autoload 'haskell-process "haskell-process" "\
Get the current process from the current session.

\(fn)" nil nil)

;;;***

;;;### (autoloads (haskell-session-process haskell-session haskell-session-maybe
;;;;;;  haskell-session-installed-modules haskell-session-all-modules)
;;;;;;  "haskell-session" "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-session.el"
;;;;;;  "8497bc12513bc29ff93a378c3eab6361")
;;; Generated autoloads from ../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-session.el

(autoload 'haskell-session-all-modules "haskell-session" "\
Get all modules -- installed or in the current project.
If DONTCREATE is non-nil don't create a new session.

\(fn &optional DONTCREATE)" nil nil)

(autoload 'haskell-session-installed-modules "haskell-session" "\
Get the modules installed in the current package set.
If DONTCREATE is non-nil don't create a new session.

\(fn &optional DONTCREATE)" nil nil)

(autoload 'haskell-session-maybe "haskell-session" "\
Maybe get the Haskell session, return nil if there isn't one.

\(fn)" nil nil)

(autoload 'haskell-session "haskell-session" "\
Get the Haskell session, prompt if there isn't one or fail.

\(fn)" nil nil)

(autoload 'haskell-session-process "haskell-session" "\
Get the session process.

\(fn S)" nil nil)

;;;***

;;;### (autoloads (haskell-show-parse haskell-show-parse-and-insert
;;;;;;  haskell-show-replace) "haskell-show" "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-show.el"
;;;;;;  "599b62eb724c5e2f38a7c21fd7fcbee4")
;;; Generated autoloads from ../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-show.el

(autoload 'haskell-show-replace "haskell-show" "\
Replace the given region containing a Show value with a pretty
  printed collapsible version.

\(fn START END)" nil nil)

(autoload 'haskell-show-parse-and-insert "haskell-show" "\
Parse a `string' containing a Show instance value and insert
  it pretty printed into the current buffer.

\(fn GIVEN)" nil nil)

(autoload 'haskell-show-parse "haskell-show" "\
Parse the given input into a tree.

\(fn GIVEN)" nil nil)

;;;***

;;;### (autoloads (turn-on-haskell-simple-indent haskell-simple-indent-mode)
;;;;;;  "haskell-simple-indent" "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-simple-indent.el"
;;;;;;  "460cf6221387a0a6501e162c3351b157")
;;; Generated autoloads from ../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-simple-indent.el

(autoload 'haskell-simple-indent-mode "haskell-simple-indent" "\
Simple Haskell indentation mode that uses simple heuristic.
In this minor mode, `indent-for-tab-command' (bound to <tab> by
default) will move the cursor to the next indent point in the
previous nonblank line, whereas `haskell-simple-indent-backtab'
\(bound to <backtab> by default) will move the cursor the
previous indent point.  An indent point is a non-whitespace
character following whitespace.

Runs `haskell-simple-indent-hook' on activation.

\(fn &optional ARG)" t nil)

(autoload 'turn-on-haskell-simple-indent "haskell-simple-indent" "\
Turn on function `haskell-simple-indent-mode'.

\(fn)" t nil)

;;;***

;;;### (autoloads (haskell-sort-imports) "haskell-sort-imports" "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-sort-imports.el"
;;;;;;  "ad2c6792fda47152707e1edd754aa502")
;;; Generated autoloads from ../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-sort-imports.el

(autoload 'haskell-sort-imports "haskell-sort-imports" "\
Sort the import list at the point.

\(fn)" t nil)

;;;***

;;;### (autoloads (haskell-is-prefix-of haskell-string-take haskell-trim)
;;;;;;  "haskell-string" "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-string.el"
;;;;;;  "22cce3a6ed5c868db99c7b1c5d3d6bd9")
;;; Generated autoloads from ../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-string.el

(autoload 'haskell-trim "haskell-string" "\


\(fn STRING)" nil nil)

(autoload 'haskell-string-take "haskell-string" "\
Take n chars from string.

\(fn STRING N)" nil nil)

(autoload 'haskell-is-prefix-of "haskell-string" "\
Is x string a prefix of y string?

\(fn X Y)" nil nil)

;;;***

;;;### (autoloads (turn-on-haskell-unicode-input-method) "haskell-unicode-input-method"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-unicode-input-method.el"
;;;;;;  "ad56566d1696a63be2cc353098355005")
;;; Generated autoloads from ../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-unicode-input-method.el

(autoload 'turn-on-haskell-unicode-input-method "haskell-unicode-input-method" "\
Set input method `haskell-unicode'.
See Info node `Unicode(haskell-mode)' for more details.

\(fn)" t nil)

;;;***

;;;### (autoloads (haskell-yas-complete) "haskell-yas" "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-yas.el"
;;;;;;  "a3ae8a82bda09532d42e1c23db375716")
;;; Generated autoloads from ../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-yas.el

(autoload 'haskell-yas-complete "haskell-yas" "\


\(fn &rest ARGS)" nil nil)

;;;***

;;;### (autoloads (inferior-haskell-find-haddock inferior-haskell-find-definition
;;;;;;  inferior-haskell-info inferior-haskell-kind inferior-haskell-type
;;;;;;  inferior-haskell-send-decl inferior-haskell-load-and-run
;;;;;;  inferior-haskell-load-file switch-to-haskell) "inf-haskell"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/inf-haskell.el"
;;;;;;  "f7734d649662099b6db963df7e66ac1e")
;;; Generated autoloads from ../../../../.emacs.d/elpa/haskell-mode-20130722.1217/inf-haskell.el

(defalias 'run-haskell 'switch-to-haskell)

(autoload 'switch-to-haskell "inf-haskell" "\
Show the inferior-haskell buffer.  Start the process if needed.

\(fn &optional ARG)" t nil)

(autoload 'inferior-haskell-load-file "inf-haskell" "\
Pass the current buffer's file to the inferior haskell process.
If prefix arg \\[universal-argument] is given, just reload the previous file.

\(fn &optional RELOAD)" t nil)

(autoload 'inferior-haskell-load-and-run "inf-haskell" "\
Pass the current buffer's file to haskell and then run a COMMAND.

\(fn COMMAND)" t nil)

(autoload 'inferior-haskell-send-decl "inf-haskell" "\
Send current declaration to inferior-haskell process.

\(fn)" t nil)

(autoload 'inferior-haskell-type "inf-haskell" "\
Query the haskell process for the type of the given expression.
If optional argument `insert-value' is non-nil, insert the type above point
in the buffer.  This can be done interactively with the \\[universal-argument] prefix.
The returned info is cached for reuse by `haskell-doc-mode'.

\(fn EXPR &optional INSERT-VALUE)" t nil)

(autoload 'inferior-haskell-kind "inf-haskell" "\
Query the haskell process for the kind of the given expression.

\(fn TYPE)" t nil)

(autoload 'inferior-haskell-info "inf-haskell" "\
Query the haskell process for the info of the given expression.

\(fn SYM)" t nil)

(autoload 'inferior-haskell-find-definition "inf-haskell" "\
Attempt to locate and jump to the definition of the given expression.

\(fn SYM)" t nil)

(autoload 'inferior-haskell-find-haddock "inf-haskell" "\
Find and open the Haddock documentation of SYM.
Make sure to load the file into GHCi or Hugs first by using C-c C-l.
Only works for functions in a package installed with ghc-pkg, or
whatever the value of `haskell-package-manager-name' is.

This function needs to find which package a given module belongs
to.  In order to do this, it computes a module-to-package lookup
alist, which is expensive to compute (it takes upwards of five
seconds with more than about thirty installed packages).  As a
result, we cache it across sessions using the cache file
referenced by `inferior-haskell-module-alist-file'. We test to
see if this is newer than `haskell-package-conf-file' every time
we load it.

\(fn SYM)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/haskell-mode-20130722.1217/ghc-core.el"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-align-imports.el"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-c.el"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-cabal.el"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-checkers.el"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-compat.el"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-decl-scan.el"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-doc.el"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-font-lock.el"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-indent.el"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-indentation.el"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-interactive-mode.el"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-menu.el"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-mode-pkg.el"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-mode.el"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-move-nested.el"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-navigate-imports.el"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-package.el"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-presentation-mode.el"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-process.el"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-session.el"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-show.el"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-simple-indent.el"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-sort-imports.el"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-str.el"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-string.el"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-unicode-input-method.el"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-utils.el"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/haskell-yas.el"
;;;;;;  "../../../../.emacs.d/elpa/haskell-mode-20130722.1217/inf-haskell.el")
;;;;;;  (20975 44056 552970 0))

;;;***

(provide 'haskell-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; haskell-mode-autoloads.el ends here
