;; disable splash screen
(setq inhibit-startup-message t)

;; y/n rather than yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; show line and column number
(setq-default line-number-mode t)
(setq-default column-number-mode t)

;; disable backup files
(setq-default backup-inhibited t)
(setq-default make-backup-files nil)

;; whitespace
(setq-default show-trailing-whitespace t)
(setq-default require-final-newline t)

;; disable visual line wrapping
(setq-default truncate-lines t)

;; Disable some objectionable features
(defun mir/no-objectionable-features ()
    (let ((to-disable '(menu-bar-mode tool-bar-mode scroll-bar-mode)))
      (dolist (feature to-disable)
        (when (fboundp feature) (funcall feature -1)))))

(mir/no-objectionable-features)

;; When emacs is running in daemon mode, some of the features we wish
;; to disable will not be bound to a function as there is no frame at
;; that time. Therefore we add a hook after a frame is made to apply
;; our customizations.
(add-hook 'after-make-frame-functions
          (lambda (&optional frame)
            (mir/no-objectionable-features)))

(global-font-lock-mode t)

(use-package doom-themes
 :ensure t
 :init
 (defun cmk/load-doom-theme (&optional frame)
   (with-selected-frame (or frame (selected-frame))
     (load-theme 'doom-one t)
     (doom-themes-org-config)
     (doom-themes-neotree-config)))
 :config
 (if (daemonp)
     (add-hook 'after-make-frame-functions
	       (lambda (frame)
		 (cmk/load-doom-theme frame)))
   (cmk/load-doom-theme)))

(use-package neotree
  :ensure t
  :config
  (add-hook 'neotree-mode-hook
	    (lambda ()
	      (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter))))

(provide 'init-ui)
