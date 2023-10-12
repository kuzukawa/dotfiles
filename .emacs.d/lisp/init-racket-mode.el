;;; package --- Summary

;;; Commentary:
;; racket-mode

;;; Code:

(use-package racket-mode
  :mode "\\.rkt\\'"
  :defines
  racket-mode-map
  :config
  (add-hook 'racket-mode-hook
            (lambda()
              (define-key racket-mode-map (kbd "<f5>") 'racket-run))))

(provide 'init-racket)
;;; init-racket-mode.el ends here
