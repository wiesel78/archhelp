;;; package --- Summary
;;; Commentary: Themes

;; Prelude default is zenburn, so I use another theme ;)
;;(load-theme 'solarized-[light|dark] t)
;;(load-theme 'tangotango t)

;;; Code:
(load-theme 'tangotango t)
;; to run correctly in daemon mode
(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (load-theme 'tangotango t)))
    (load-theme 'tangotango t))


;;Footer
(provide 'theme)
