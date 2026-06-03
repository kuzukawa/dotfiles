;;; package --- Summary

;;; Commentary:
;; slime config

;;; Code:
;; Only configure Roswell/SLIME when Roswell is actually installed,
;; otherwise this load would error and abort the rest of init.el.
(when (file-exists-p "~/.roswell/helper.el")
  (load (expand-file-name "~/.roswell/helper.el"))
  (setq inferior-lisp-program "ros -Q run"))

(provide 'init-slime-mode)
;;; init-slime-mode.el ends here
