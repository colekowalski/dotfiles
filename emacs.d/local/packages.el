(require 'package)

(package-initialize)

(defvar package-list '(coffee-mode evil gist go-mode magit projectile puppet-mode scala-mode2))

;; list of servers to grab packages from
(setq package-archives
      (append package-archives
              '(("melpa" . "http://melpa.milkbox.net/packages/")
                ("marmalade" . "http://marmalade-repo.org/packages/"))))

(defun install-packages ()
  "Install our list of required packages"
  (interactive)
  (package-refresh-contents)
  (dolist (p package-list)
    (when (not (package-installed-p p))
      (package-install p))))
