;;; package --- Summary

;;; Commentary:
;; rust-mode

;;; Code:
(use-package rust-mode
  :mode "\\.rs\\'"
  :ensure t
  :custom rust-format-on-save t)

(use-package cargo
  :ensure t
  :hook (rust-mode . cargo-minor-mode))

(provide 'init-rust-mode)
;;; init-rust-mode.el ends here
