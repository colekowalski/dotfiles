(require 'package)

(package-initialize)

(setq my-package-list '(ag
                        flx-ido
                        dockerfile-mode
                        gist
                        go-mode
                        lua-mode
                        magit
                        php-mode
                        projectile
                        puppet-mode
                        scala-mode2
                        yaml-mode))

;; add extra package repos
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)


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
