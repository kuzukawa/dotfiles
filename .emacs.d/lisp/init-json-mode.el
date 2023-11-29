;;; package --- Summary

;;; Commentary:
;; json-mode

;;; Code:
(use-package json-mode
  :mode (("\\.json" . json-mode))
  :config
  (add-hook 'json-mode-hook #'flycheck-mode))

(provide 'init-json-mode)
;;; init-json-mode.el ends here
