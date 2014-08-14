(require 'projectile)

(add-to-list 'projectile-globally-ignored-directories "node_modules")

(projectile-global-mode t)

(provide 'init-projectile)
