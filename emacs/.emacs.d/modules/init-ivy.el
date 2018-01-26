(use-package ivy
  :ensure t
  :init
  (ivy-mode 1))

(use-package counsel
  :ensure t
  :after ivy)

(use-package swiper
  :ensure t
  :after ivy)

(provide 'init-ivy)
