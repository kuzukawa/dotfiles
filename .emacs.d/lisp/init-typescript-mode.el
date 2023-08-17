;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; typescript
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package typescript-mode)
(use-package tide)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-hook 'typescript-mode-hook
  (lambda ()
	(interactive)
	(tide-setup)
	(eglot-ensure)
	(flycheck-mode +1)
	(setq flycheck-check-syntax-automatically '(save mode-enabled))
	(eldoc-mode +1)
	(tide-hl-identifier-mode +1)
	(company-mode +1)
  (eldoc-mode +1)))