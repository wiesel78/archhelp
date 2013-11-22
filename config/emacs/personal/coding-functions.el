;; Functions for coding
;; Cleanup buffers
(defun cleanup-buffer()
  "Perfom a bunch of Operations on the whitespace content of a buffer."
  (interactive)
  (indent-buffer)
  (untabify-buffer)
  (delete-trailing-whitespaces)
  )

;; Edit current file as superuser
(defun sudo-edit(&optional arg)
  (interactive "p")
  (if (or arg(not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File:")))
    (find-alternate-file (concat "/sudo:root@loclhost:" buffer-file-name))))

;; Insert time-stamp
(defun insert-date()
   "Insert a time-stamp according to locale's date and time format"
   (interactive)
   (insert (format-time-string "%c" (current-time))))

;; Jump to definition in file
(defun ido-goto-symbol (&optional symbol-list)
   "Refresh imenu and jump to a place in the buffer using Ido."
   (interactive)
   (unless (featurep 'imenu)
     (require 'imenu nil t))
   (cond
    ((not symbol-list)
     (let ((ido-mode ido-mode)
           (ido-enable-flex-matching
            (if (boundp 'ido-enable-flex-matching)
                ido-enable-flex-matching t))
           name-and-pos symbol-names position)
       (unless ido-mode
         (ido-mode 1)
         (setq ido-enable-flex-matching t))
       (while (progn
                (imenu--cleanup)
                (setq imenu--index-alist nil)
                (ido-goto-symbol (imenu--make-index-alist))
                (setq selected-symbol
                      (ido-completing-read "Symbol? " symbol-names))
                (string= (car imenu--rescan-item) selected-symbol)))
       (unless (and (boundp 'mark-active) mark-active)
         (push-mark nil t nil))
       (setq position (cdr (assoc selected-symbol name-and-pos)))
       (cond
        ((overlayp position)
         (goto-char (overlay-start position)))
        (t
         (goto-char position)))))
    ((listp symbol-list)
     (dolist (symbol symbol-list)
       (let (name position)
         (cond
          ((and (listp symbol) (imenu--subalist-p symbol))
           (ido-goto-symbol symbol))
          ((listp symbol)
           (setq name (car symbol))
           (setq position (cdr symbol)))
          ((stringp symbol)
           (setq name symbol)
           (setq position
                 (get-text-property 1 'org-imenu-marker symbol))))
         (unless (or (null position) (null name)
                     (string= (car imenu--rescan-item) name))
           (add-to-list 'symbol-names name)
           (add-to-list 'name-and-pos (cons name position))))))))

;; Footer
(provide 'coding-functions)