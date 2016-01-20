(defconst emacs-start-time (current-time))

(when (version<= emacs-version "24.0")
  (error "Your Emacs is too old -- version 24.0 or higher is required"))

;; add directories to load path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

;; add directories to theme path
(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))

;; disable splash screen
(setq inhibit-startup-message t)

;; y/n rather than yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; free up extra screen real estate
(dolist (junk '(menu-bar-mode tool-bar-mode scroll-bar-mode))
    (when (fboundp junk) (funcall junk -1)))

;; when running emacs in daemon mode, these have to be applied on frame
;; creation because the functions are not otherwise bound
;; (add-hook 'after-make-frame-functions
;;   (lambda (&optional frame)
;;     (when fboundp tool-bar-mode (tool-bar-mode -1))
;;     (when fboundp scroll-bar-mode (scroll-bar-mode -1))
;;     (when fboundp set-fringe-mode (set-fringe-mode '(1 . 0)))))

;; show line and column number
(setq-default line-number-mode t)
(setq-default column-number-mode t)

;; disable backup files
(setq-default backup-inhibited t)
(setq-default make-backup-files nil)

;; spacing
(setq-default tab-width 2)
(setq-default standard-indent 2)
(setq-default indent-tabs-mode nil)

;; whitespace
(setq-default show-trailing-whitespace t)
(setq-default require-final-newline t)

;; disable visual line wrapping
(setq-default truncate-lines t)

;; packages should be initialized first
(require 'init-package)

(require 'init-ido)
(require 'init-org)
(require 'init-projectile)
(require 'init-saltstack)
(require 'init-theme)
