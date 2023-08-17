;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; for Org-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-todo-keywords '((sequence "TODO(t)" "SOMEDAY(s)" "WAITING(w)" "|"  "DONE(d)")))
(setq org-log-done 'time)

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(setq org-directory "~/kuzukawa@gmail.com - Google Drive/My Drive/org")
(setq org-default-notes-file (concat org-directory "/todo.org"))
(setq org-agenda-files (list org-default-notes-file
                            (concat org-directory "/projects")
                            (concat org-directory "/personal")
                            (concat org-directory "/daily")
                            (concat org-directory "/study")))

; Org-captureの設定

; Org-captureを呼び出すキーシーケンス
(define-key global-map "\C-cc" 'org-capture)
; Org-captureのテンプレート（メニュー）の設定
(setq org-capture-templates
      '(("n" "Note" entry (file+headline "~/kuzukawa@gmail.com - Google Drive/My Drive/org/notes.org" "Notes")
        "* %?\nEntered on %U\n %i\n %a")
        ))

; メモをC-M-^一発で見るための設定
; https://qiita.com/takaxp/items/0b717ad1d0488b74429d から拝借
(defun show-org-buffer (file)
  "Show an org-file FILE on the current buffer."
  (interactive)
  (if (get-buffer file)
      (let ((buffer (get-buffer file)))
        (switch-to-buffer buffer)
        (message "%s" file))
    (find-file (concat "~/kuzukawa@gmail.com - Google Drive/My Drive/org/" file))))
(global-set-key (kbd "C-M-^") '(lambda () (interactive)
                                (show-org-buffer "notes.org")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-download
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package org-download)
(setq-default org-download-image-dir "~/kuzukawa@gmail.com - Google Drive/My Drive/org/img")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-babel
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(org-babel-do-load-languages
'org-babel-load-languages
'(
  (shell . t)
  (ruby . t)
  (python . t)
  (js . t)
  (java . t)
  (C . t)
  (lisp . t)
  (haskell . t)
  ))

