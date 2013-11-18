;; some useful functions and configurations
;; line/column numbers are always good and filesize
(global-linum-mode 1)
(column-number-mode t)
(size-indication-mode t)

;; enable smooth scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; enable cua mode for copy/paste/cut/redo, like in all modern editors
(cua-mode 1)

;; Always syntax highlighting
(global-font-lock-mode t)

;; UTF-8 has the power
(setq local-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-language-environment "UTF-8")
(set-input-method nil)

;; Switch windows with arrow keys + shift
(require 'windmove)
(windmove-default-keybindings 'shift)

;; Footer
(provide 'misc)
