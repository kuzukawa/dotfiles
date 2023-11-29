;;; package --- Summary

;;; Commentary:
;; org-mode configuration

;;; Code:
(use-package org-bullets
      :custom (org-bullets-bullet-list '("💎" "1️⃣" "2️⃣" "3️⃣" "4️⃣" "5️⃣" "6️⃣" "7️⃣" "8️⃣" "9️⃣"))
      :hook (org-mode . org-bullets-mode))

(custom-set-faces
 '(org-level-1 ((t (:foreground "Cyan" :weight normal :height 1.4))))
 '(org-level-2 ((t (:foreground "Cyan" :weight normal :height 1.3))))
 '(org-level-3 ((t (:foreground "Cyan" :weight normal :height 1.2))))
 '(org-level-4 ((t (:foreground "dodger blue" :weight normal :height 1.1))))
 '(org-level-5 ((t (:foreground "CadetBlue" :weight normal :height 1.0))))
)

(setq org-todo-keywords '((sequence "TODO(t)" "SOMEDAY(s)" "WAITING(w)" "|"  "DONE(d)")))
(setq org-log-done 'time)

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(setq org-directory "~/Library/CloudStorage/GoogleDrive-kuzukawa@gmail.com/My Drive/org")
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
      '(("n" "Note" entry (file+headline "~/Library/CloudStorage/GoogleDrive-kuzukawa@gmail.com/My Drive/org/notes.org" "Notes")
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
    (find-file (concat "~/Library/CloudStorage/GoogleDrive-kuzukawa@gmail.com/My Drive/org/" file))))
(global-set-key (kbd "C-M-^") '(lambda () (interactive)
                                (show-org-buffer "notes.org")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-download
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package org-download)
(setq-default org-download-image-dir "~/Library/CloudStorage/GoogleDrive-kuzukawa@gmail.com/My Drive/org/img")

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

(provide 'init-org)
;;; init-org.el ends here
