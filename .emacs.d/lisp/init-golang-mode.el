(use-package go-mode)
(use-package go-eldoc)

(add-hook 'go-mode-hook 'flycheck-mode)
(add-hook 'go-mode-hook 'company-mode)
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs '(go-mode . ("gopls"))))

(add-hook 'go-mode-hook
          (lambda ()
            (setq tab-width 4)
            (setq indent-tabs-mode 1)))

(add-hook 'go-mode-hook
                (lambda ()
                  (add-hook 'before-save-hook 'gofmt-before-save)))

(setq lsp-go-analyses '((shadow . t)
                        (simplifycompositelit . :json-false)))
