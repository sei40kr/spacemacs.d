(defun my/file-class-name ()
  (file-name-nondirectory (file-name-sans-extension (buffer-file-name))))
