;; -*- lexical-binding: t -*-

(defun my/init-plantuml ()
  (add-to-list 'auto-mode-alist '("\\.pu\\'" . plantuml-mode)))
