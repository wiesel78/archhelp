;;; prelude-custom.el --- Prelude customizing

;;; Commentary:
;;; Customizations to the default prelude configuration.

;;; Code:

;; prelude specific
(setq prelude-flyspell nil)
(setq prelude-guru nil)
(setq key-chord-mode nil)

;; golden ration
(golden-ratio-mode 1)

;; zlc - zsh like completion
(zlc-mode t)

;; jedi auto-completion
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(setq jedi:environment-root "jedi")
;; (setq jedi:environment-virtualenv
;;       (append python-environment-virtualenv
;;               '("--python" "/usr/lib/python2.7/")))

;; yasnippet
(yas-global-mode 1)
(add-to-list 'yas/root-directory "~/.emacs.d/snippets/yasnippet-snippets")
(yas--initialize)

;; line and column modes
(global-linum-mode 1)
(column-number-mode 1)
(size-indication-mode t)

;; smooth scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; set adobes source code pro font
(add-to-list 'default-frame-alist '(font . "Source Code Pro-10"))
(set-face-attribute 'default t :font "Source Code Pro-10")


(provide 'prelude-custom)

;;; prelude-custom ends here
