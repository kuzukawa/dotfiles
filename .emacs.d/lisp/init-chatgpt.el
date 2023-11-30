;;; package --- Summary

;;; Commentary:
;; chatgpt configuration

;;; Code:
;(setq python-interpreter "python")
;(setenv "OPENAI_API_KEY" "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")

;(use-package chatgpt
;  :straight (:host github :repo "joshcho/ChatGPT.el" :files ("dist" "*.el"))
;  :init
;  (require 'python)
;  (setq chatgpt-repo-path "~/.emacs.d/straight/repos/ChatGPT.el/")
;  :bind ("C-c q" . chatgpt-query))
(use-package openai :straight (:host github :repo "emacs-openai/openai"))
(use-package chatgpt :straight (:host github :repo "emacs-openai/chatgpt"))
(use-package codegpt :straight (:host github :repo "emacs-openai/codegpt"))
(use-package dall-e :straight (:host github :repo "emacs-openai/dall-e"))

(provide 'init-chatgpt)
;;; init-chatgpt.el ends here
