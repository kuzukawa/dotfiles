;;; package --- Summary

;;; Commentary:
;; chatgpt configuration

;;; Code:
(setq python-interpreter "python")
(use-package chatgpt
  :straight (:host github :repo "joshcho/ChatGPT.el" :files ("dist" "*.el"))
  :init
  (require 'python)
  (setq chatgpt-repo-path "~/.emacs.d/straight/repos/ChatGPT.el/")
  :bind ("C-c q" . chatgpt-query))

(provide 'init-chatgpt)
;;; init-chatgpt.el ends here
