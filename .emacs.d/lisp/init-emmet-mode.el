;;; package --- Summary

;;; Commentary:
;; emmet config

;;; Code:
(use-package emmet-mode
  :mode (("\\.html?\\'" . emmet-mode)
         ("\\.css?\\'" . emmet-mode))
  :defines
  emmet-indentation
  :config
  (add-to-list 'load-path "~/.emacs.d/emmet/")
  (add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2))))

(provide 'init-emmet-mode)
;;; init-emmet-mode.el ends here


