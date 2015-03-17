;; config-path points to the emacs configuration directory
(defvar config-path
  (cond
   ((boundp 'user-emacs-directory) user-emacs-directory) ; gnu emacs
   ((boundp 'user-init-directory) user-init-directory)   ; xemacs
   (t "~/.emacs.d")))

(add-to-list 'load-path (concat config-path "local"))
(add-to-list 'load-path (concat config-path "modes"))

(defun byte-compile-configs ()
  "(re)compile all elisp files in config-path"
  (interactive)
  (byte-recompile-directory (expand-file-name config-path) 0))

;(set-face-attribute 'default nil :font "Ubuntu Mono-12")

;; load local configurations and custom elisp
(let* ((local-path (concat config-path "local"))
       (local-files (directory-files local-path t "[^#]*.el$")))
  (dolist (file local-files)
    (load file)))

;; load in modules
(require 'init-ido)
(require 'init-org)
(require 'init-mail)
(require 'init-projectile)
