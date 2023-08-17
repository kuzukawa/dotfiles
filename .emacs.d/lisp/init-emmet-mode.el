;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emmet
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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

