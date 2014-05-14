;;; hooks.el --- Custom package hooks

;;; Commentary:
;;; Custom hooks

;;; Code:

;; google-c-style
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(provide 'hooks)

;;; hooks.el ends here
