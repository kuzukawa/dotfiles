;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; for markdown
;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq markdown-fontify-code-blocks-natively t)
(eval-after-load "org"
  '(require 'ox-md nil t))

;; markdown preview mode
(add-to-list 'auto-mode-alist '("\\.markdown\\'". gfm-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
(with-eval-after-load 'markdown-mode
  (custom-set-variables
   '(markdown-command '("pandoc" "--from=markdown" "--to=html5"))
   '(markdown-fontify-code-blocks-natively t)
   '(markdown-header-scaling t)
   '(markdown-indent-on-enter 'indent-and-new-item))
  (define-key markdown-mode-map (kbd "<S-tab>") #'markdown-shifttab))

;(setq markdown-fontify-code-blocks-natively t)
;(setq markdown-preview-stylesheets
;      (list "https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/3.0.1/github-markdown.min.css"))
;(setq markdown-command "commonmarker --extension=autolink,strikethrough,table,tagfilter,tasklist"
;      markdown-css-paths  '("https://cdn.jsdelivr.net/npm/github-markdown-css"
;                            "https://cdn.jsdelivr.net/gh/highlightjs/cdn-release/build/styles/github.min.css")
;      markdown-xhtml-header-content "
;<style><!-- CSS HERE --></style>
;<script src=\"https://cdn.jsdelivr.net/gh/highlightjs/cdn-release/build/highlight.min.js\"></script>
;<script>hljs.initHighlightingOnLoad();</script>"
;      markdown-xhtml-body-preamble "<div class=\"markdown-body\">"
;      markdown-xhtml-body-epilogue "</div>")
