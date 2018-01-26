(require 'package)

;; If a fitting place exists, store installed packages outside the
;; user's emacs directory
(setq package-user-dir
      (cond ((file-directory-p (expand-file-name "~/.cache")) (expand-file-name "~/.cache/emacs/elpa"))
	    (t (expand-file-name "elpa" user-emacs-directory))))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")))

;; don't add package initialization to the init file
(setq package--init-file-ensured t)

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

(provide 'init-package)
