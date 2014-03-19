;;; package ---  misc.el
;;; Commentary:
;; some useful functions and configurations

;; line/column numbers are always good and filesize
;;; Code:
(global-linum-mode 1)
(column-number-mode t)
(size-indication-mode t)
(set-face-attribute 'default (selected-frame) :height 100)

;; enable smooth scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; enable cua mode for copy/paste/cut/redo, like in all modern editors
;;(cua-mode 1)

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
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))


;; conservative display engine setting
(setq redisplay-dont-pause t)

;; improved ido for M-x
(require 'smex)
(smex-initialize)

;; deals with the emacs buffer with the same name
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(setq inhibit-startup-message t
      color-theme-is-global t
      resize-mini-windows nil
      uniquify-buffer-name-style 'forward
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-everywhere t)

(put 'ido-complete 'disabled nil)
(put 'ido-exit-minibuffer 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(put 'autopair-newline 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; delete selected text on typing
(delete-selection-mode t)

;; smartpairs config
(require 'smartparens)
(smartparens-mode t)
(show-smartparens-mode t)
(setq sp-show-pair-delay 0)

;; matching parents
(eval-after-load 'smartparens
  '(progn
     (require 'smartparens)
     (require 'smartparens)
     (setq sp-highlight-pair-overlay nil)))

;; auto-complete config
(eval-after-load 'auto-complete
  '(progn
     (require 'auto-complete-config)
     (ac-config-default)
     (define-key ac-completing-map (kbd "ESC") 'ac-stop)
     (setq ac-delay 0.125
           ac-auto-show-menu 0.25
           ac-auto-start 3
           ac-quick-help-delay 2.0
           ac-ignore-case nil
           ac-candidate-menu-min 2
           ac-use-quick-help t
           ac-limit 10
           ac-disable-faces nil)

     (setq-default ac-sources '(ac-source-imenu
                                ac-source-words-in-buffer
                                ac-source-words-in-same-mode-buffers
                                ac-source-dictionary
                                ac-source-filename))))

;; Footer
(provide 'misc)
;;; misc.el ends here
