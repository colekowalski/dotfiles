(require 'org)

(add-hook 'org-mode-hook
          (lambda ()
            (auto-fill-mode)
            (flyspell-mode)))

;(setq org-agenda-files `(,org-directory))

;; default file used in capture templates
;(setq org-default-notes-file
;      (concat
;       (file-name-as-directory org-directory)
;       "inbox.org"))

;; allow refiling between org files included in org-agenda files
(setq org-refile-targets '((nil :maxlevel . 3)
                           (org-agenda-files :maxlevel . 3)))

(setq org-startup-indented nil)

(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cc" 'org-capture)

(provide 'init-org)
