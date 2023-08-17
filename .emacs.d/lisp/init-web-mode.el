;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; web-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package web-mode)
(add-to-list 'auto-mode-alist '("\\.ts[x]?\\'" . web-mode))
(add-hook 'web-mode-hook 'lsp)

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
