;;; package --- Summary
;;; Commentary: Sr-Speedbar setup

;; Code:
;; speedbar
(require 'sr-speedbar)

;; open speedbar on startup
(add-hook 'window-setup-hook (lambda () (sr-speedbar-open) (other-window 1)))

(setq speedbar-show-unknown-files t
      speedbar-smart-directory-expand-flag t
      speedbar-directory-button-trim-method 'trim
      speedbar-use-images nil
      speedbar-indentation-width 2
      speedbar-use-imenu-flag t
      speedbar-file-unshown-regexp "flycheck-.*"
      sr-speedbar-width 40
      sr-speedbar-width-x 40
      sr-speedbar-auto-refresh t
      sr-speedbar-skip-other-window-p t
      sr-speedbar-right-side nil)

;; add file-extensions
(speedbar-add-supported-extension ".py")
(speedbar-add-supported-extension ".c")
(speedbar-add-supported-extension ".h")
(speedbar-add-supported-extension ".sh")
(speedbar-add-supported-extension ".erl")
(speedbar-add-supported-extension ".md")
(speedbar-add-supported-extension ".css")
(speedbar-add-supported-extension ".html")
(speedbar-add-supported-extension ".htm")
(speedbar-add-supported-extension ".css")
(speedbar-add-supported-extension ".js")
(speedbar-add-supported-extension ".php")
(speedbar-add-supported-extension ".conf")
(speedbar-add-supported-extension ".g")
(speedbar-add-supported-extension ".java")
(speedbar-add-supported-extension ".lua")


;; Footer
(provide 'speedbar)
