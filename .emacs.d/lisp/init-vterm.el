;;; package --- Summary

;;; Commentary:
;; vterm configuration

;;; Code:
(use-package vterm
  :ensure
  :config
  (add-hook 'vterm-mode-hook (lambda() (display-line-numbers-mode -1))))

(provide 'init-vterm)
;;; init-vterm.el ends here

