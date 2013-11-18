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

;; Footer
(provide 'coding-functions)
