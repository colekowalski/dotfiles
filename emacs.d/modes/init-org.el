(require 'org)

(add-hook 'org-mode-hook
          (lambda ()
            (auto-fill-mode)
            (flyspell-mode)))

(setq org-agenda-files `(,org-directory))

(setq org-startup-indented t)

(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(provide 'init-org)
