;; Some neat keybindings helping a lot
;; Per default prelude uses super and its awful with awesome
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;; Disable guru-mode to use the arrow keys for navigation per default
(setq prelude-guru nil)

;; Perform general buffer cleanup
(global-set-key (kbd "C-c n") 'cleanup-buffer)

;; Jump to definition in current file.
(global-set-key (kbd "M-i") 'ido-goto-symbol)

;; Time stamp
(global-set-keys (kbd "C-x C-t") 'insert-date)

;; Footer
(provide 'keybindings)
