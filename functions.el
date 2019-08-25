(defun my/file-class-name ()
  (file-name-nondirectory (file-name-sans-extension (buffer-file-name))))

(defun my/java-package ()
  (mapconcat 'identity (split-string
                        (replace-regexp-in-string
                         ".*src\\(/\\(main\\|test\\)\\)?\\(/java\\|/scala\\)?"
                         ""
                         default-directory)
                        "/"
                        t)
             "."))
