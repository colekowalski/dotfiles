(use-package evil
  :ensure t
  :config
  (evil-mode))

(use-package evil-leader
  :ensure t
  :after evil
  :config
  (evil-leader/set-leader ",")
  (evil-leader/set-key
    "f" 'counsel-projectile-find-file
    "t" 'neotree-toggle)
  (global-evil-leader-mode))

(kbd "C-c C-p C-f")

(provide 'init-evil)
