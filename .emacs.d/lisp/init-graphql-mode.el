;;; package --- Summary

;;; Commentary:
;; grqphql-mode

;;; Code:
(use-package graphql-mode
  :mode (("\\.graphql" . graphql-mode))
  :config
  (add-hook 'graphql-mode-hook #'flycheck-mode))

(provide 'init-graphql-mode)
;;; init-graphql-mode.el ends here
