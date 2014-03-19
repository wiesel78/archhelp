;;; package --- Summary
;;; Commentary: define required packages

;;; Code:
;; preload auto-install
(prelude-require-packages '(lua-mode web-mode auto-complete smartparens
                                     smex sr-speedbar exec-path-from-shell
                                     google-c-style color-theme-solarized))

;; Footer
(provide 'pkg)
;;; pkg.el ends here
