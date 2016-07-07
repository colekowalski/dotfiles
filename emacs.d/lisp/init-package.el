(require 'package)

(package-initialize)

(setq my-package-list '(ag
                        flx-ido
                        dockerfile-mode
                        flycheck
                        flycheck-pyflakes
                        gist
                        go-mode
                        jinja2-mode
                        lua-mode
                        magit
                        php-mode
                        projectile
                        puppet-mode
                        scala-mode2
                        yaml-mode))

;; add extra package repos
(dolist (source '(("gnu"       . "https://elpa.gnu.org/packages/")
                  ("marmalade" . "https://marmalade-repo.org/packages/")
                  ("melpa"     . "https://melpa.org/packages/")
                  ("org"       . "http://orgmode.org/elpa/")))
  (add-to-list 'package-archives source t))


(defun install-packages ()
  "Install our list of required packages"
  (interactive)
  (package-refresh-contents)
  (dolist (pkg my-package-list)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(defun upgrade-packages ()
  "Upgrade all installed packages"
  (let ((package-menu-async nil))
    (save-window-excursion
      (package-list-packages)
      (package-menu-mark-upgrades)
      (package-menu-execute 'noquery))))

(provide 'init-package)
