(use-package ivy
  :ensure t
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "[%d/%d]")
  (ivy-mode t))

(use-package counsel
  :ensure t
  :after ivy
  :bind (("C-c g" . counsel-git)
	 ("C-c k" . counsel-ag)))

(provide 'init-ivy)
