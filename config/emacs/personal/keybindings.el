;;; keybindings --- Personel Keybindings

;;; Commentary:
;; Some neat keybindings helping a lot.

;;; Code:
;; Per default prelude uses super and its awful with awesome
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;; Disable guru-mode to use the arrow keys for navigation per default
(setq prelude-guru nil)

;; Jump to definition in current file.
(global-set-key (kbd "M-i") 'ido-goto-symbol)

;; Time Stamm
(global-set-key (kbd "C-x C-t") 'insert-date)

;; Sudo file
(global-set-key (kbd "C-x C-v") 'sudo-edit)

;; kill active buffer instead of chose a buffer
(global-set-key (kbd "C-x k") 'kill-default-buffer)

;; insert ; semicolon at and of line
(global-set-key (kbd "C-;") 'insert-semicolon-at-end-of-line)

;; smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; speedbar binding
(global-set-key (kbd "C-c b") 'sr-speedbar-toggle)

;; provide ac trigger
(global-set-key (kbd "C-q") 'auto-complete)

(provide 'keybindings)
;;; keybindings.el ends here
