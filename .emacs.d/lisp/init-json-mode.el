;;; package --- Summary

;;; Commentary:
;; json-mode

;;; Code:
(use-package json-mode
  :mode (("\\.json" . json-mode))
  :config
  (setq js-indent-level 2))

(use-package flymake-json
  :ensure t
  :config
  (add-hook 'json-mode-hook 'flymake-json-load))

(provide 'init-json-mode)
;;; init-json-mode.el ends here
