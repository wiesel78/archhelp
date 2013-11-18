;; Some neat keybindings helping a lot
;; Per default prelude uses super and its awful with awesome
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;; Disable guru-mode to use the arrow keys for navigation per default
(setq prelude-guru nil)

;; Pretty alignment
(global-set-key (kbd "C-x \\") 'align-regexp)

;; Perform general buffer cleanup
(global-set-key (kbd "C-c n") 'cleanup-buffer)

;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; Jump to definition in current file.
(global-set-key (kbd "M-i") 'ido-goto-symbol)

;; Footer
(provide 'keybindings)
