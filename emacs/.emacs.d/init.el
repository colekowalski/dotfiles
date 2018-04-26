(defconst emacs-start-time (current-time))

(add-to-list 'load-path (expand-file-name "modules" user-emacs-directory))

;; don't litter init file with custom-set stuff
(setq custom-file (expand-file-name "custom-set.el" user-emacs-directory))
(load custom-file 'noerror)

;; Don't load outdated bytecode
(setq load-prefer-newer t)

(require 'init-package)
(require 'init-general)
(require 'init-ui)
(require 'init-ivy)
(require 'init-projectile)
(require 'init-company)
(require 'init-org)
(require 'init-puppet)
(require 'init-python)
(require 'init-magit)
(require 'init-saltstack)
