;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; racket(Scheme)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package racket-mode)
(add-hook 'racket-mode-hook
          (lambda()
            (define-key racket-mode-map (kbd "<f5>") 'racket-run)))
