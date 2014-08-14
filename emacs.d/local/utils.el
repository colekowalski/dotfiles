(defun tmp-buffer (name)
  "Create a temporary (scratch) buffer"
  (interactive "BBuffer name:")
  (switch-to-buffer (get-buffer-create name)))
