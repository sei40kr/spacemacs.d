;; -*- lexical-binding: t -*-

(defun my/init-perl ()
  (add-hook 'cperl-mode-hook #'spacemacs/ggtags-mode-enable))
