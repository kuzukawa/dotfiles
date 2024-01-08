;;; package --- Summary

;;; Commentary:
;; chatgpt configuration

;;; Code:
(use-package openai :straight (:host github :repo "emacs-openai/openai"))
(use-package chatgpt
  :straight (:host github :repo "emacs-openai/chatgpt")
  :ensure t
;;  :config
;;  (setq chatgpt-model "gpt-4")
  )
(use-package codegpt :straight (:host github :repo "emacs-openai/codegpt"))
(use-package dall-e :straight (:host github :repo "emacs-openai/dall-e"))

(provide 'init-chatgpt)
;;; init-chatgpt.el ends here
