;;; package --- Summary
;;; Commentary: define required packages

;; preload auto-install
(prelude-require-packages '(lua-mode web-mode auto-complete smartparens
                                     smex sr-speedbar exec-path-from-shell
                                     google-c-style color-theme-solarized))

;; Footer
(provide 'pkg)
