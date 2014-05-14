;;; coding.el --- Coding functions

;;; Commentary:
;;; Some useful functions binding in keys.ek

;;; Code:

;; Edit current file as superuser
(defun sudo-edit(&optional arg)
  (interactive "p")
  (if (or arg(not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File:")))
    (find-alternate-file (concat "/sudo:root@loclhost:" buffer-file-name))))

(defun kill-default-buffer ()
  "Kill the currently active buffer --
  set to C-x k so that users are not asked which buffer they want to kill."
  (interactive)
  (let (kill-buffer-query-functions) (kill-buffer)))

(provide 'coding)

;;; coding.el ends here
