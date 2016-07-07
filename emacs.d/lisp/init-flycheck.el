(require 'flycheck)
(require 'flycheck-pyflakes)

(add-hook 'python-mode-hook 'flycheck-mode)

(provide 'init-flycheck)
