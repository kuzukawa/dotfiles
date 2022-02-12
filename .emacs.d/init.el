;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; straight.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(setq warning-suppress-log-types '((package reinitialization)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package install
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)
(use-package init-loader)
(use-package exec-path-from-shell)
(use-package typescript-mode)
(use-package yaml-mode)

(use-package docker)

(use-package dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

(use-package docker-compose-mode)
(use-package docker-tramp)
(set-variable 'docker-tramp-use-names t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EditorConfig
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; racket(Scheme)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package racket-mode)
(add-hook 'racket-mode-hook
          (lambda()
            (define-key racket-mode-map (kbd "<f5>") 'racket-run)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; company
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package company
  :config
  (global-company-mode t)
  (global-set-key (kbd "<C-tab>") 'company-complete)
  (bind-keys :map company-active-map
    ("C-n" . company-select-next)
    ("C-p" . company-select-previous)
    ("<tab>" . company-complete-selection))
  (bind-keys :map company-search-map
    ("C-n" . company-select-next)
    ("C-p" . company-select-previous))
)
(use-package company-lsp :commands company-lsp)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; flycheck
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Environment settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setenv "LANG" "en_US.UTF-8")

; TODO fix it someday...
;(set-fontset-font "fontset-default" 'unicode "Apple Color Emoji" nil 'prepend)

(setq default-directory "~/")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Settings for display
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; hide menu bar
(menu-bar-mode -1)

;; hide tool bar
(tool-bar-mode -1)

;; hide startup message
(setq inhibit-startup-screen t)

;; hide initial-scratch-message ""
(setq initial-scratch-message "")

;; show paren
(show-paren-mode t)

;; display line numbers
(if (version<= "26.0.50" emacs-version)
    (global-display-line-numbers-mode))

;; add-hook for JavaScript
(add-hook 'js-mode-hook
	  (lambda ()
	    (make-local-variable 'js-indent-level)
	    (setq js-indent-level 2)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Settings for save-file
(setq make-backup-files nil)
(setq auto-save-default nil)
;(exec-path-from-shell-copy-envs '("LANG" "GPG_AGENT_INFO" "SSH_AUTH_SOCK"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; settings for input
(setq-default indent-tabs-mode nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Theme
;(load-theme 'jazz t)
(defvar my/load-themes '(manoj-dark tango))
(defun toggle-load-theme ()
  "Toggle `load-theme'."
  (interactive)
  (let ((current-theme (car custom-enabled-themes)))
    (load-theme
     (car (or (cdr (member current-theme my/load-themes))
              my/load-themes)))))

;; 透明度を変更するコマンド M-x set-alpha
;; http://qiita.com/marcy@github/items/ba0d018a03381a964f24
(defun set-alpha (alpha-num)
  "set frame parameter 'alpha"
  (interactive "nAlpha: ")
  (set-frame-parameter nil 'alpha (cons alpha-num '(90))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Initialize alpha
(set-frame-parameter nil 'alpha 90)

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Initialize exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; markdown mode
(setq markdown-fontify-code-blocks-natively t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; markdown preview mode
(add-to-list 'auto-mode-alist '("\\.markdown\\'". markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'". gfm-mode))

(setq markdown-fontify-code-blocks-natively t)
(setq markdown-preview-stylesheets 
      (list "https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/3.0.1/github-markdown.min.css"))
;(setq markdown-command "commonmarker --extension=autolink,strikethrough,table,tagfilter,tasklist")

(setq markdown-command "commonmarker --extension=autolink,strikethrough,table,tagfilter,tasklist"
      markdown-css-paths '("https://cdn.jsdelivr.net/npm/github-markdown-css"
                           "https://cdn.jsdelivr.net/gh/highlightjs/cdn-release/build/styles/github.min.css")
      markdown-xhtml-header-content "
<style><!-- CSS HERE --></style>
<script src=\"https://cdn.jsdelivr.net/gh/highlightjs/cdn-release/build/highlight.min.js\"></script>
<script>hljs.initHighlightingOnLoad();</script>"
      markdown-xhtml-body-preamble "<div class=\"markdown-body\">"
      markdown-xhtml-body-epilogue "</div>")

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; locale when launching Emacs.app on OS X

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; for Org-mode
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-directory "~/GoogleDrive/org")
(setq org-default-notes-file (concat org-directory "/todo.org"))
(setq org-agenda-files (list org-default-notes-file))

; Org-captureの設定

; Org-captureを呼び出すキーシーケンス
(define-key global-map "\C-cc" 'org-capture)
; Org-captureのテンプレート（メニュー）の設定
(setq org-capture-templates
      '(("n" "Note" entry (file+headline "~/GoogleDrive/Org/notes.org" "Notes")
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
    (find-file (concat "~/GoogleDrive/Org/" file))))
(global-set-key (kbd "C-M-^") '(lambda () (interactive)
                                 (show-org-buffer "notes.org")))

; open-junk-file
(setq open-junk-file-format "~/.emacs.d/junk/%Y%m%d-%H%M%S-memo.")
(global-set-key "\C-xj" 'open-junk-file)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
n	 ".docx -f markdown -t docx -c ~/.css/github-markdown.css"))
(shell-command-to-string
 (concat "open "
	 (file-name-sans-extension filename)
	 ".docx"))))
(put 'upcase-region 'disabled nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emmet
(use-package emmet-mode)
(add-to-list 'load-path "~/.emacs.d/emmet/")
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2)))
;(with-eval-after-load "emmet-mode"
;   (define-key emmet-mode-keymap (kbd "C-j") nil))
;(define-key emmet-mode-keymap (kbd "C-m") 'emmet-expand-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; simple-httpd
(setq httpd-root "~/.emacs.d/www")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; typescript
(add-hook 'typescript-mode-hook
		  (lambda ()
			(interactive)
			(tide-setup)
			(flycheck-mode +1)
			(setq flycheck-check-syntax-automatically '(save mode-enabled))
			(eldoc-mode +1)
			(tide-hl-identifier-mode +1)
			(company-mode +1)))





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; treemacs
(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-directory-name-transformer    #'identity
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-extension-regex          treemacs-last-period-regex-value
          treemacs-file-follow-delay             0.2
          treemacs-file-name-transformer         #'identity
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-asc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-user-mode-line-format         nil
          treemacs-width                         35)

    ;; the default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)

(use-package treemacs-persp
  :after treemacs persp-mode
  :ensure t
  :config (treemacs-set-scope-type 'Perspectives))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("6df412e59dbfe7f72f24319b9ee4513e40bb0e44384fc93a2c77399e641348f6" default))
 '(fci-rule-color "#151515")
 '(package-selected-packages
   '(treemacs-persp treemacs-magit treemacs-icons-dired treemacs-projectile treemacs-evil treemacs yasnippet yaml-mode web-mode uuidgen use-package twittering-mode smex smartparens projectile prodigy popwin pallet open-junk-file nyan-mode multiple-cursors markdown-preview-mode magit jazz-theme idle-highlight-mode htmlize go-mode flycheck-cask expand-region drag-stuff)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;;;;;;;;;;;;;;;;;;
;; alias
;; http://ergoemacs.org/emacs/emacs_alias.html
(add-to-list 'load-path "~/.emacs.d/lisp")
(load "my-alias")
(put 'downcase-region 'disabled nil)

;;;;;;;;;;;;;;;;;;;;
;; helm
(use-package helm)
(require 'helm-config)
(helm-mode 1)
(setq helm-split-window-inside-p            t  ; 画面分割しても同じバッファ内にhelmのバッファを表示
      helm-move-to-line-cycle-in-source     t  ; helmバッファ内で候補の最後に到達したら上に戻る
      helm-ff-search-library-in-sexp        t  ; よく分からんがライブラリの中も検索するみたいな
      helm-echo-input-in-header-line        t)  ; helmのバッファの上部にコンソールの内容を表示

; Emacsのechoエリアをhelmで拡張
(global-set-key (kbd "M-x") 'helm-M-x)          

; ファイル探すのをhelmモードにする
(global-set-key (kbd "C-x C-f") 'helm-find-files)
