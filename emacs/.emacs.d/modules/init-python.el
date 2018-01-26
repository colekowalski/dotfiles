(defun project-virtualenv ()
  "Guess the virtualenv name for the current project

This will first attempt to use the locally-defined variable
`project-venv', falling back to the projectile project name if it
doesn't exist."
  (hack-local-variables)
  (cond ((when (and (boundp 'project-venv) project-venv) project-venv))
	((when (fboundp 'projectile-project-name) (projectile-project-name)))))

(use-package virtualenvwrapper
  :ensure t)

(use-package jedi
  :ensure t
  :after virtualenvwrapper
  :config
  (add-hook 'python-mode-hook
	    (lambda ()
	      (let ((venv (project-virtualenv)))
		(when venv
		  (venv-workon venv)))
	      (jedi:setup))))

(use-package company-jedi
  :ensure t
  :after (:all company jedi)
  :config
  (add-to-list 'company-backends 'company-jedi))

(provide 'init-python)
