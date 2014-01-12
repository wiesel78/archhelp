;;; package --- Summary :
;;; Commentary: configure hooks and modes

;; web-mode hook autoindent 2
(defun web-mode-hook ()
  "Hooks for web mode."
  (setq web-mode-markup-indent-offset 2)
  )
(add-hook 'web-mode-hook 'web-mode-hook)

(defun python-mode-hook()
  "Hooks for python mode."
  (setq python-indent-offset 4)
  )
(add-hook 'python-mode-hook 'python-mode-hook)

;; footer for hook-conf
(provide 'hook-conf)
