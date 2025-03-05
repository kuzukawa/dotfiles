;;; package --- Summary

;;; Commentary:
;; doom theme

;;; Code:
(use-package doom-themes
    :custom
    (doom-themes-enable-italic t)
    (doom-themes-enable-bold t)
    :custom-face
    (doom-modeline-bar ((t (:background "#6272a4"))))
    :config
    (load-theme 'doom-dracula t)
    (doom-themes-neotree-config)
    (doom-themes-org-config))


(use-package doom-modeline
  :custom
  (doom-modeline-buffer-file-name-style 'truncate-with-project)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-icon nil)
  (doom-modeline-minor-modes nil)
  :hook
  (after-init . doom-modeline-mode)
  :defines
  neo-smart-open
  :config
  (line-number-mode 0)
  (column-number-mode 0)
  (setq neo-smart-open t)
  (add-hook 'neo-after-create-hook
            (lambda (&rest _) (display-line-numbers-mode -1)))
  (doom-modeline-def-modeline 'main
                              '(bar window-number matches buffer-info remote-host buffer-position parrot selection-info)
                              '(misc-info persp-name lsp github debug minor-modes input-method major-mode process vcs)))

(use-package all-the-icons)

(use-package neotree
  :init
  (setq-default neo-keymap-style 'concise)
  :defines
  neo-smart-open
  neo-create-file-auto-open
  neo-theme
  :config
  (setq neo-smart-open t)
  (setq neo-create-file-auto-open t)
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (bind-key [f8] 'neotree-toggle)
  (bind-key "RET" 'neotree-enter-hide neotree-mode-map)
  (bind-key "a" 'neotree-hidden-file-toggle neotree-mode-map)
  (bind-key "<left>" 'neotree-select-up-node neotree-mode-map)
  (bind-key "<right>" 'neotree-change-root neotree-mode-map))

;; Change neotree's font size
;; Tips from https://github.com/jaypei/emacs-neotree/issues/218
(defun neotree-text-scale ()
  "Text scale for neotree."
  (interactive)
  (text-scale-adjust 0)
  (text-scale-decrease 1)
  (message nil))
(add-hook 'neo-after-create-hook
      (lambda (_)
        (call-interactively 'neotree-text-scale)))

;; neotree enter hide
;; Tips from https://github.com/jaypei/emacs-neotree/issues/77
(defun neo-open-file-hide (full-path &optional arg)
  "Open file and hiding neotree.
The description of FULL-PATH & ARG is in `neotree-enter'."
  (neo-global--select-mru-window arg)
  (find-file full-path)
  (neotree-hide))

(defun neotree-enter-hide (&optional arg)
  "Neo-open-file-hide if file, Neo-open-dir if dir.
The description of ARG is in `neo-buffer--execute'."
  (interactive "P")
  (neo-buffer--execute arg 'neo-open-file-hide 'neo-open-dir))

 (use-package hide-mode-line
    :hook
    ((neotree-mode imenu-list-minor-mode minimap-mode) . hide-mode-line-mode))

(provide 'init-doom)
;;; init-doom.el ends here
