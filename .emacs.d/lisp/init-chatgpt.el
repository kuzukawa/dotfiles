;;; package --- Summary

;;; Commentary:
;; chatgpt configuration

;;; Code:
(use-package openai :straight (:host github :repo "emacs-openai/openai"))
(use-package chatgpt :straight (:host github :repo "emacs-openai/chatgpt"))
(use-package codegpt :straight (:host github :repo "emacs-openai/codegpt"))
(use-package dall-e :straight (:host github :repo "emacs-openai/dall-e"))

(provide 'init-chatgpt)
;;; init-chatgpt.el ends here
