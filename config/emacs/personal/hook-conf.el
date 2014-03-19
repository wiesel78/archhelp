;;; hook-conf --- Personel hook configuration.

;;; Commentary:
;; Configure hooks and modes

;;; Code:
;; web-mode hook autoindent 2
(defun web-mode-hook ()
  "Hooks for web mode."
  (setq web-mode-markup-indent-offset 2)
  )
(add-hook 'web-mode-hook 'web-mode-hook)

;; google c style
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; ac hook
(defun auto-complete-mode())
(add-hook 'auto-complete-mode 'auto-complete-mode)

(provide 'hook-conf)
;;; hook-conf.el ends here
