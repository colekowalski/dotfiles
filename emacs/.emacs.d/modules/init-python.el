(defun project-virtualenv ()
  "Guess the virtualenv name for the current project

This will first attempt to use the locally-defined variable
`project-venv', falling back to the projectile project name if it
doesn't exist."
  (hack-local-variables)
  (cond ((when (and (boundp 'project-venv) project-venv) project-venv))
	((when (fboundp 'projectile-project-name) (projectile-project-name)))
	(t nil)))

(use-package virtualenvwrapper
  :ensure t)

(use-package pipenv
  :ensure t)

(use-package jedi
  :ensure t
  :after (:all virtualenvwrapper pipenv)
  :config
  (add-hook 'python-mode-hook
	    (lambda ()
	      (if (pipenv-project?)
		    (pipenv-activate)
		(let ((venv (project-virtualenv)))
		  (when venv
		    (venv-workon venv))))
	      (jedi:setup))))

(use-package company-jedi
  :ensure t
  :after (:all company jedi)
  :config
  (add-to-list 'company-backends 'company-jedi))

(provide 'init-python)
