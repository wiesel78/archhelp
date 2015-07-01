
;;; Init.el --- Initial Emacs startup script

;;; Commentary:
;;; This is my initial startup script for emacs.
;;; It uses graphene as a base for sane defaults.
;;; Comment or uncomment the packages you donÄt need or need.
;;; You can get this file from:
;;; https://github.com/wiesel78/archhelp/tree/master/config/emacs
;;; 

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
(defvar henrik/packages '(;; languages
                           tuareg
                           lua-mode
                           markdown-mode
                           ;; haskell
                           haskell-mode
                           shm
                           ghc
                           company-ghc
                           ;; look and feel
                           graphene
                           solarized-theme
                           smart-mode-line
                           helm
                           golden-ratio
                           ;; editing
                           smartparens
                           expand-region
                           ;; misc
                           magit
                           discover-my-major
                           projectile
                           minimap
                           )
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
;;; Look and Feel + Misc
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

;; dolden ratio mode for better editing
(require 'golden-ratio)
(golden-ratio-mode 1)
(setq golden-ratio-exclude-modes '("sr-speedbar"
                                   "minimap-mode"))

;; activate smart-mode-line
(setq sml/no-confirm-load-theme t)
(sml/setup)

;; Use the system clipboard
(setq x-select-enable-clipboard t)

;; activate expand region
(require 'expand-region)
(global-set-key (kbd "C--") 'er/expand-region)

;; Set key bindings
(global-set-key (kbd "M-SPC") 'company-complete)
(global-set-key (kbd "C-h C-m") 'discover-my-major)

;; use smartparens
(smartparens-global-mode t)
(require 'smartparens-config)

;; active projectile
(projectile-global-mode)

;; slime minimap
(require 'minimap)
(global-set-key (kbd "C-c m") 'minimap-toggle)

;; enable magit for git handling
(require 'magit)
(setq magit-last-seen-setup-instructions "1.4.0")

;;; Helm: basic setup
;;;
(require 'helm)
(require 'helm-config)

;; change C-x c to C-c h
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x h"))
;; set M-x to helm M-x
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-h a") 'helm-apropos)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; make TAB work persistent and in terminal; list actions with C-z
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z") 'helm-select-action)

;; use curl for google
(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-windo-in-side-p            t; open helm buffer inside current window
      helm-move-to-line-cycle-in-source     t; move to end or beginning of source when reaching end or top
      helm-ff-search-library-in-sexp        t; search for library in "require" and "declare-function"
      helm-scroll-amount                    8; scroll 8 lines other window using M-<next>
      helm-ff-file-name-history-use-recentf t;
      enable-recursive-minibuffers          t; enable complete at point
      )


;; set helm to a max height
(helm-autoresize-mode 1)
;;(helm-autoresize-max-height 40)
;;(helm-autoresize-min-height 10)

;; enable helm
(helm-mode 1)
(ido-mode -1)

;;; OCaml: Tuareg plugin setup
;;; Short Emacs Tuareg reference
;;; http://www.ocamlpro.com/files/tuareg-mode.pdf
;;;
;; Customize Tuareg
(setq tuareg-in-indent 1)
(add-hook 'tuareg-mode-hook
          ;; Turn on autofill minor mode.
          (lambda () (auto-fill-mode 1)))
(autoload 'tuareg-mode "tuareg" "Major mode for OCaml" t)
(autoload 'camldebug "camldebug" "Run caml debugger" t)

;;; Haskell: Haskell-Mode GHC Company-ghc SHM plugins setup
;;;
;; Config for Haskell
;;(add-hook 'haskell-mode-hook 'structured-haskell-mode)
(eval-after-load 'haskell-mode
  '(define-key haskell-mode-map [f8] 'haskell-navigate-imports))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-ghc-show-info t)
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-tags-on-save t)
 '(minimap-update-delay 0.2)
 '(minimap-width-fraction 0.15)
 '(minimap-window-location (quote right))
 '(tuareg-pipe-extra-unindent 4))

;; Haskell key bindings

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

;;; Lua: Basic lua setup
;;;
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;;; C: basic c setup
;;;
;; provide google-code-style
(add-to-list 'load-path "~/.emacs.d/code-style/")
(add-hook 'c-mode-common-hook 'google-set-c-style)
;; provide indented new line
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;;; Markdown: Basic markdown setup
;;;
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))


(provide 'init)
;;; init.el ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
