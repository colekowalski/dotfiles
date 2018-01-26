(use-package org
  :ensure org-plus-contrib
  :bind (("C-c a" . org-agenda)
	 ("C-c c" . org-capture))
  :config
  (add-hook 'org-mode-hook (lambda ()
			     (turn-on-auto-fill)))

  (setq personal-notes-file (expand-file-name "~/org/everything.org")
	work-notes-file (expand-file-name "~/org/work.org"))
  (setq org-default-notes-file personal-notes-file)
  (setq org-capture-templates
	`(
	  ("t" "Todo")
	  ("tp" "Todo -- Personal" entry (file+headline personal-notes-file "Task List")
	   "** TODO %^{Title}\n%?")
	  ("tw" "Todo -- Work" entry (file+headline work-notes-file "Task List")
	   "** TODO %^{Title}\n%?\n%^{TRELLO_TICKET}p")
	  ("n" "Work Notes" entry (file+headline work-notes-file "Notes")
	   "** %T %^{Title}\n%?")
	  ("m" "Meeting Notes" entry (file+olp+datetree work-notes-file "Meeting Notes")
	   "** %T %^{Title}\n%?")
	  ("l" "Work Log" entry (file+olp+datetree work-notes-file "Log")
	   "** %T\n%?")
	  ("J" "Journal" entry (file+datetree "/home/cole/org/work.org")
	   "** %U\n%?"))))

(provide 'init-org)
