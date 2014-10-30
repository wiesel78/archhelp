;;; Init.el --- Initial Emacs startup script

;;; Commentary:
;;; This is my initial startup script for emacs.
;;; It uses graphene as a base for sane defaults.

;;; Code:

;;; System setup
;;;
;; Add user information
(setq user-full-name "Henrik Jürges")
(setq user-mail-address "juerges.henrik@gmail.com")

;; Set PATH
(setenv "PATH" (concat "~/.cabal/bin:" (getenv "PATH")))
(add-to-list 'exec-path "~/.cabal/bin")

;; Require common lisp
(require 'cl)

;;; ELPA setup
;;;
;; Require Emacs package functionality
(require 'package)

;; Add MELPA and Marmalade repository to the list of package sources
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;;(setq package-archive-enable-alist '(("melpa" deft magit)))

;; Initialise the package system
(package-initialize)

;; Define default packages
(defvar henrik/packages '( graphene
                           tuareg
                           ;; haskell part
                           haskell-mode
                           shm
                           ghc
                           company-ghc
                           ;; misc
                           org
                           whitespace
                           solarized-theme)
  "My default packages.")

;; Load default packages at startup
(defun henrik/packages-installed-p ()
  "Try to install packages."
  (loop for pkg in henrik/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (henrik/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg henrik/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;;; Custom setup
;;;
;; Load graphene for fancy and shiny graphics
(require 'graphene)

;; Disable menu
(menu-bar-mode -1)

;; Load solarized theme
(if window-system
    (load-theme 'solarized-light t)
  (load-theme 'wombat))

;; Use wind move for more natural window switching
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; Show trailing whitespaces
(setq nobreak-char-display t)

;; Use the system clipboard
(setq x-select-enable-clipboard t)

;; Set key bindings
(global-set-key (kbd "M-SPC") 'company-complete)

;;; OCaml: Tuareg plugin setup
;;;
;; Customize Tuareg
(setq tuareg-in-indent 0)
(add-hook 'tuareg-mode-hook
          ;; Turn on autofill minor mode.
          (lambda () (auto-fill-mode 1)))
(autoload 'tuareg-mode "tuareg" "Major mode for OCaml" t)
(autoload 'camldebug "camldebug" "Run caml debugger" t)

;;; Haskell: Haskell-Mode GHC Company-ghc SHM plugins setup
;;;
;; Config for Haskell
(add-hook 'haskell-mode-hook 'structured-haskell-mode)
(eval-after-load 'haskell-mode
  '(define-key haskell-mode-map [f8] 'haskell-navigate-imports))
(custom-set-variables '(haskell-tags-on-save t))

;; Haskell key bindings
(custom-set-variables
  '(haskell-process-suggest-remove-import-lines t)
  '(haskell-process-auto-import-loaded-modules t)
  '(haskell-process-log t))
  ;;'(haskell-process-type 'cabal-repl))
(eval-after-load 'haskell-mode '(progn
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
  (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
  (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
  (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)
  (define-key haskell-mode-map (kbd "C-c C-o") 'haskell-compile)))
(eval-after-load 'haskell-cabal '(progn
  (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)
  (define-key haskell-cabal-mode-map (kbd "C-c C-o") 'haskell-compile)))

;; Enable ghc-mod
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

;; Enable GHC-Mod as Company back end
(add-to-list 'company-backends 'company-ghc)
(custom-set-variables '(company-ghc-show-info t))

(provide 'init)
;;; init.el ends here
