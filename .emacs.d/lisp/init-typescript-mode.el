;;; package --- Summary

;;; Commentary:
;; typescript

;;; Code:
(use-package typescript-mode
  :mode "\\.ts\\'"
  :defines typescript-indent-level
  :init
  (setq typescript-indent-level 2))

(use-package tide
  :mode (("\\.ts\\'" . typescript-mode))
  :defines
  flycheck-check-syntax-automatically
  :config
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
  )

(provide 'init-typescript)
;;; init-typescript-mode.el ends here

