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

(use-package company-jedi
  :ensure t
  :after (:all company pipenv virtualenvwrapper)
  :config
  (add-to-list 'company-backends 'company-jedi)
  (add-hook 'python-mode-hook
	    (lambda ()
	      (venv-deactivate)
	      (pipenv-deactivate)
	      (cond ((pipenv-project?)
		     (pipenv-activate))
		    ((projectile-project-p)
		     (if (venv-is-valid (projectile-project-name))
			 (venv-workon (projectile-project-name)))))
	      (jedi:setup))))

(provide 'init-python)
