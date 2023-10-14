;;; package --- Summary

;;; Commentary:
;; imba-mode

;;; Code:
(add-to-list 'load-path "~/.emacs.d/site-lisp/imba-mode.el")
(require 'imba-mode)
(add-to-list 'auto-mode-alist '("\\.imba\\'" . imba-mode))

(add-hook 'imba-mode-hook
          (quote
           (lambda nil
             (auto-complete-mode 1)
             (setq ac-modes (append ac-modes '(imba-mode)))
             (ac-config-default)
             (setq-local whitespace-style
                         (quote
                          (face trailing tabs tab-mark)))
             (setq-local whitespace-display-mappings (quote ((tab-mark 9 [8594 9] [92 9]))))
             (whitespace-mode t)
             (set-face-foreground 'whitespace-tab "lightgray")
             (set-face-background 'whitespace-tab nil)
             (set-face-foreground 'whitespace-trailing "HotPink")
             (set-face-background 'whitespace-trailing "lightPink")
	         (setq-local electric-pair-skip-whitespace-chars (quote (9 10)))
             (setq-local auto-indent-untabify-on-visit-file 'tabify)
             (setq-local auto-indent-backward-delete-char-behavior nil)
             (setq-local auto-indent-untabify-on-save-file 'tabify)
             (setq-local auto-indent-newline-function 'newline-and-indent)
             (setq-local adaptive-fill-regexp "[\t]*")
             (outline-minor-mode 1)
             (setq-local outline-regexp "[[:space:]]*\\(tag...\\|def...\\|\\bdo....\\|class.\\|export\\)")
             )))

(provide 'init-imba-mode)
;;; init-imba-mode.el ends here

