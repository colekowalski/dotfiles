(defun tmp-buffer (name)
  "Create a temporary (scratch) buffer"
  (interactive "BBuffer name:")
  (switch-to-buffer (get-buffer-create name)))

(defun urlencode-region-to-register (register start end)
  "URLEncode region into register REGISTER"
  (interactive (list (register-read-with-preview "Copy to register: ")
                     (region-beginning)
                     (region-end)))
  (let ((text (filter-buffer-substring start end)))
       (set-register register (url-hexify-string text))))


(defun urldecode-region-to-register (register start end)
  "URLDecode region ingo register REGISTER"
  (interactive (list (register-read-with-preview "Copy to register: ")
                     (region-beginning)
                     (region-end)))
  (let ((text (filter-buffer-substring start end)))
       (set-register register (url-unhex-string text))))

(defun urlencode-region (start end)
  "URLEncode the contents of the selected region"
  (interactive "r")
  (save-excursion
    (let ((text (delete-and-extract-region start end)))
      (insert (url-hexify-string text)))))

(defun urldecode-region (start end)
  "URLDecode the contents of the selected region"
  (interactive "r")
  (save-excursion
    (let ((text (delete-and-extract-region start end)))
      (insert (url-unhex-string text)))))
