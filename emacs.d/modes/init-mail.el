(add-to-list 'auto-mode-alist '("mutt-" . message-mode))

(add-hook 'message-mode-hook
          (lambda ()
            (auto-fill-mode)
            (flyspell-mode)
            (delete-trailing-whitespace)))

(provide 'init-mail)
