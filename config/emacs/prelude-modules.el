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
;; per default prelude uses super and its awful with awesome
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)
;; disable guru-mode to use the arrow keys for navigation per default
(setq prelude-guru nil)

;; line numbers are always good
(global-linum-mode 1)

;; enable cua mode for copy/paste/cut/redo, like in all modern editors
(cua-mode 1)

;; preload auto-install
(prelude-require-packages '(lua-mode php-mode web-mode auto-complete))

;; footer for prelude
(provide 'prelude-modules)
