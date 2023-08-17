;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; company
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package company
  :config
  (global-company-mode t)
  (global-set-key (kbd "<C-tab>") 'company-complete)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2)
  (setq company-selection-wrap-around t)
  (setq completion-ignore-case t)
  (bind-keys :map company-active-map
    ("C-n" . company-select-next)
    ("C-p" . company-select-previous)
    ("<tab>" . company-complete-selection))
  (bind-keys :map company-search-map
    ("C-n" . company-select-next)
    ("C-p" . company-select-previous))
)
(use-package company-lsp :commands company-lsp)
