(use-package scala-mode
  :ensure t
  :mode ("\\.scala\\'" . scala-mode))

(use-package ensime
  :defer t
  :ensure t
  :init
  (setq ensime-startup-notification nil))

(provide 'init-scala)
