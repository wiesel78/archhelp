;;;; package --- Summary:
;;; My personal Preload configuration
;;; The Preload defaults are a great basis to start

(require 'prelude-c)
;; (require 'prelude-clojure)
;; (require 'prelude-coffee)
;; (require 'prelude-common-lisp)
(require 'prelude-css)
(require 'prelude-emacs-lisp)
(require 'prelude-erc)
(require 'prelude-erlang)
;; (require 'prelude-haskell)
;; (require 'prelude-helm)
(require 'prelude-js)
;; (require 'prelude-key-chord)
(require 'prelude-latex)
(require 'prelude-lisp)
;; (require 'prelude-mediawiki)
(require 'prelude-org)
(require 'prelude-perl)
(require 'prelude-python)
;; (require 'prelude-ruby)
;; (require 'prelude-scala)
(require 'prelude-scheme)
;; (require 'prelude-scss)
(require 'prelude-web)
(require 'prelude-xml)

;;; Commentary: some useful things
;; preload auto-install
(prelude-require-packages '(lua-mode web-mode auto-complete))

;; web-mode hook autoindent 2
(defun web-mode-hook ()
  "Hooks for web mode."
  (setq web-mode-markup-indent-offset 2)
)
(add-hook 'web-mode-hook 'web-mode-hook)

;; auto-complete config
(require 'auto-complete-config)
(ac-config-default)
(ac-set-trigger-key "TAB")
(setq ac-auto-start nil)

;; footer for prelude
(provide 'prelude-modules)
