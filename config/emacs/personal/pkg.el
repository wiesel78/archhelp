;;; pkg.el --- Let prelude load packages

;;; Commentary:
;;; Load own packages from melpa.

;;; Code:

(prelude-require-packages '(lua-mode google-c-style smex better-defaults
                                     zlc xterm-color smart-operator
                                     paradox god-mode jedi python-environment
                                     yasnippet))

(provide 'pkg)

;;; pkg.el ends here
