(add-to-list 'auto-mode-alist '("mutt-" . message-mode))

(add-hook 'message-mode-hook
          (lambda ()
            (interactive)
            (auto-fill-mode t)
            (flyspell-mode t)
            (delete-trailing-whitespace)
            (save-buffer)))

(provide 'init-mail)
