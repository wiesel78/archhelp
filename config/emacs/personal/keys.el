;;; keys.el --- Custom Keybindings

;;; Commentary:
;;; Set new Keybindings.

;;; Code:

;; require god-mode
(global-set-key (kbd "<escape>") 'god-local-mode)

(defun my-update-cursor ()
  "Set the cursor in different modes."
  (setq cursor-type (if (or god-local-mode buffer-read-only)
                        'box
                      'bar)))

(add-hook 'god-mode-enabled-hook 'my-update-cursor)
(add-hook 'god-mode-disabled-hook 'my-update-cursor)

;; kill current buffer
(global-set-key (kbd "C-x C-k") 'kill-default-buffer)

;; sudo file
(global-set-key (kbd "C-x C-v") 'sudo-edit)

;; smex for M-x
(global-set-key (kbd "M-x") 'smex)
;;(global-set-key (kbd "M-x") 'smex-major-mode-commands)


;; some handy keybindings for godmode
(global-set-key (kbd "C-x C-1") 'delete-other-windows)
(global-set-key (kbd "C-x C-2") 'split-window-below)
(global-set-key (kbd "C-x C-3") 'split-window-right)
(global-set-key (kbd "C-x C-0") 'delete-window)
(global-set-key (kbd "C-x C-u") 'undo-tree-visualize)
(global-set-key (kbd "C-x C-;") 'comment-region)

(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)

(provide 'keys)
;;; keys.el ends here
