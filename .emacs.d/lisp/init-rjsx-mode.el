;;; package --- Summary

;;; Commentary:
;; rsjx-mode

;;; Code:
(use-package rjsx-mode
  :mode "\\.js\\'"
  :defines
  js-indent-level
  :config
  (setq js-indent-level 2))

(provide 'init-rjsx-mode)
;;; init-rjsx-mode.el ends here
