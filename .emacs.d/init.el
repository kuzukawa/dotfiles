;;; package --- Summery

;;; Commentary:

;;; Code:

;(require 'profiler)
;(profiler-start 'cpu)

(add-to-list 'load-path "~/.emacs.d/lisp")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; straight
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
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; basic settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setenv "LANG" "en_US.UTF-8")
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-directory "~/")

;; hide scroll bar
(scroll-bar-mode -1)

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

; settings for save-file
(setq make-backup-files nil)
(setq auto-save-default nil)

                                        ; stop ring bell
(setq ring-bell-function 'ignore)

;; settings for input
(setq-default indent-tabs-mode nil)

; simple-httpd
(setq httpd-root "~/.emacs.d/www")

; Initialize alpha
(set-frame-parameter nil 'alpha 90)

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Theme
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(setq modus-themes-mode-line '(accented borderless padded))
;(setq modus-themes-region '(accented no-extend))
;(load-theme 'modus-vivendi t)
;(defvar my/load-themes '(modus-vivendi modus-operandi))
;(defun toggle-load-theme ()
;  "Toggle `load-theme'."
;  (interactive)
;  (let ((current-theme (car custom-enabled-themes)))
;    (load-theme
;    (car (or (cdr (member current-theme my/load-themes))
;              my/load-themes)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Utlities
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; toggle-truncate-line
(global-set-key (kbd "C-c t") 'toggle-truncate-lines)

; open-junk-file
(load "open-junk-file")
(setq open-junk-file-format "~/.emacs.d/junk/%Y%m%d-%H%M%S-memo.")
(global-set-key "\C-xj" 'open-junk-file)

; set opacity
(defun set-alpha (alpha-num)
  "set frame parameter 'alpha"
  (interactive "nAlpha: ")
  (set-frame-parameter nil 'alpha (cons alpha-num '(90))))

; Initialize exec-path-from-shell
(use-package exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(put 'downcase-region 'disabled nil)
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; alias
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; http://ergoemacs.org/emacs/emacs_alias.html
(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'list-buffers 'ibuffer)
(defalias 'mpm 'markdown-preview-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; other settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package yaml-mode)
(use-package php-mode)
(use-package haskell-mode)
(use-package protobuf-mode)
(use-package csharp-mode)
(use-package apache-mode)
(use-package yasnippet)

;(use-package docker)
;(use-package dockerfile-mode)
;(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
;(use-package docker-compose-mode)
;(use-package docker-tramp)
;(set-variable 'docker-tramp-use-names t)


(load "init-doom")
(load "init-editorconfig")
(load "init-company")
(load "init-flycheck")
(load "init-copilot")

(load "init-org")
(load "init-helm")
(load "init-commands")
(load "init-vterm")

(load "init-markdown-mode")
(load "init-web-mode")
(load "init-emmet-mode")
(load "init-javascript-mode")
(load "init-typescript-mode")
(load "init-rjsx-mode")
(load "init-rust-mode")
(load "init-slime-mode")
(load "init-racket-mode")
(load "init-golang-mode")
(load "init-imba-mode")

;(profiler-report)
;(profiler-stop)

(provide 'init)
;;; init.el ends here
