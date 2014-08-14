(progn
  (when (boundp 'menu-bar-mode) (menu-bar-mode -1))
  (when (boundp 'scroll-bar-mode) (scroll-bar-mode -1))
  (when (boundp 'tool-bar-mode) (tool-bar-mode -1))
  (when (fboundp 'set-fringe-mode) (set-fringe-mode '(1 . 0))))

;; no startup screen
(setq-default inhibit-startup-screen t)

;; spacing
(setq-default tab-width 2)
(setq-default standard-indent 2)
(setq-default c-basic-offset 2)
(setq-default python-indent 4)
(setq-default indent-tabs-mode nil)

;; no backup
(setq-default backup-inhibited t)
(setq-default make-backup-files nil)

;; whitespace
(setq-default show-trailing-whitespace t)
(setq-default require-final-newline t)

;; show column numbers
(column-number-mode t)

;; y/n rather than yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; y/n rather than yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; load a theme [emacs 24+]
(when (functionp 'load-theme)
  (load-theme 'wombat t))
