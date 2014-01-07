;;; package ---  Summary
;;; Commentary: configure hooks and modes

;; preload auto-install
(prelude-require-packages '(lua-mode web-mode auto-complete))

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

;; c-mode conf
;; basic indent like linux kernel
(setq c-basic-offset 8)

;; <RET> indents new line
 (defun my-make-CR-do-indent ()
   (define-key c-mode-base-map "\C-m" 'c-context-line-break))
(add-hook 'c-initialization-hook 'my-make-CR-do-indent)

;; footer for hook_conf
(provide 'hook_conf)
