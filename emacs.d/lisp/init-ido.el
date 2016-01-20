(require 'ido)
(require 'flx-ido)

(ido-mode t)
(ido-everywhere t)

(flx-ido-mode 1)
(setq ido-enable-flex-matching t)

;; disable ido faces to see flx highlights
(setq ido-use-faces nil)

(provide 'init-ido)
