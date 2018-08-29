;; store backup files outside the working directory
(let ((my-backup-directory (expand-file-name "~/.cache/emacs/backups/")))
  (if (not (file-directory-p my-backup-directory))
      (make-directory my-backup-directory t))
  (setq backup-directory-alist `(("." . ,my-backup-directory))))

;; backup settings
(setq make-backup-files t
      vc-make-backup-files t
      backup-by-copying t
      version-control t
      delete-old-versions t
      kept-new-versions 5)

;; whitespace
(setq-default show-trailing-whitespace t)
(setq-default require-final-newline t)

;; disable Ctrl-z on GUI frames
(defun cmk/suspend-frame ()
  "Disable frame suspension in GUI frames"
  (interactive)
  (if (display-graphic-p)
      (message "Frame suspension disabled for graphical displays")
    (suspend-frame)))
(global-set-key (kbd "C-z") 'cmk/suspend-frame)

(provide 'init-general)

