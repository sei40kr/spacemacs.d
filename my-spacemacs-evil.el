;; -*- lexical-binding: t -*-

(defun my/config-spacemacs-evil ()
  (define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))

  (eval-after-load 'clean-aindent-mode
    '(bind-key (kbd "C-w") #'clean-aindent--bsunindent))
  (eval-after-load 'company
    '(bind-key (kbd "C-w") nil company-active-map))
  (eval-after-load 'helm
    '(bind-key (kbd "C-w") #'backward-kill-word helm-map)))
