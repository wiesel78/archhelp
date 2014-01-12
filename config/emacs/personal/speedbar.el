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
      sr-speedbar-auto-refresh nil
      sr-speedbar-skip-other-window-p t
      sr-speedbar-right-side nil)

;; Footer
(provide 'speedbar)
