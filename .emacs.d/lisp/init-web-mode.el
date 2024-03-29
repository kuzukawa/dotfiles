;;; package --- Summary

;;; Commentary:
;; web-mode

;;; Code:
(use-package web-mode
  :mode (("\\.html\\'" . web-mode)
          ("\\.css\\'" . web-mode)
          ("\\.js\\'" . web-mode)
          ("\\.jsx\\'" . web-mode)
          ("\\.ts\\'" . web-mode)
          ("\\.tsx\\'" . web-mode))
  :defines
  web-mode-enable-auto-pairing
  web-mode-enable-auto-closing
  web-mode-enable-auto-opening
  web-mode-enable-auto-indentation
  web-mode-markup-indent-offset
  web-mode-css-indent-offset
  web-mode-code-indent-offset
  :config
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-auto-opening t)
  (setq web-mode-enable-auto-indentation t)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (add-hook 'web-mode-hook 'lsp))

(use-package rainbow-mode
  :ensure nil
  :defines
  rainbow-html-colors
  rainbow-x-colors
  rainbow-latex-colors
  rainbow-ansi-colors
  :init
  (setq rainbow-html-colors t)
  (setq rainbow-x-colors t)
  (setq rainbow-latex-colors t)
  (setq rainbow-ansi-colors t)
  :config
  (add-hook 'css-mode-hook 'rainbow-mode)
  (add-hook 'scss-mode-hook 'rainbow-mode)
  (add-hook 'php-mode-hook 'rainbow-mode)
  (add-hook 'html-mode-hook 'rainbow-mode))

(use-package emmet-mode
  :defines
  emmet-indentation
  :config
  (add-to-list 'load-path "~/.emacs.d/emmet/")
  (add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2)))
  (add-hook 'php-mode-hook 'rainbow-mode)
  (add-hook 'html-mode-hook 'rainbow-mode))

(provide 'init-web-mode)
;;; init-web-mode.el ends here
