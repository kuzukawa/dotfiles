;;; package --- Summary

;;; Commentary:
;; utility commands

;;; Code:

;; markdown to pdf
(defun md2pdf ()
"Generate pdf from currently open markdown."
(interactive)
(let ((filename (buffer-file-name (current-buffer))))
(shell-command-to-string
(concat "pandoc "
  filename
  " -o "
	(file-name-sans-extension filename)
	".pdf -f markdown -t html5 -c ~/.css/github-markdown.css"
	" --highlight-style=espresso"))
(shell-command-to-string
  (concat "open "
  (file-name-sans-extension filename)
  ".pdf"))))

;; markdown to docx
(defun md2docx ()
"Generate docx from currently open markdown."
(interactive)
(let ((filename (buffer-file-name (current-buffer))))
(shell-command-to-string
(concat "pandoc "
	filename
	" -t docx -o "
	(file-name-sans-extension filename)
	 ".docx -f markdown -t docx -c ~/.css/github-markdown.css"))
(shell-command-to-string
(concat "open "
  (file-name-sans-extension filename)
	".docx"))))
(put 'upcase-region 'disabled nil)

;; markdown to slide(revealjs)
(defun md2slide ()
"Generate slide from currently open markdown."
(interactive)
(let ((filename (buffer-file-name (current-buffer))))
(shell-command-to-string
(concat "pandoc "
	filename
	" -o "
	(file-name-sans-extension filename)
	".html -s -t revealjs"
	" -V revealjs-url=/Users/kuzukawa/gitrepos/reveal.js"
	" -V theme=moon"))
(shell-command-to-string
(concat "open "
	(file-name-sans-extension filename)
	".html"))))

(provide 'init-commands)
;;; init-commands.el ends here
