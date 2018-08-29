(use-package projectile
  :ensure t
  :init
  (projectile-mode t)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

  :config
  (add-to-list 'projectile-globally-ignored-directories "node_modules")
  (setq projectile-indexing-method 'alien))

(use-package counsel-projectile
  :ensure t
  :after (:all counsel projectile)
  :config
  (counsel-projectile-mode))

(provide 'init-projectile)
