;; -*- lexical-binding: t -*-

(defun my/projectile-switch-project-action ()
  (interactive)
  (projectile-dired)

  (when (neo-global--window-exists-p)
    (save-selected-window
      (neotree-refresh))))

(defun my/init-spacemacs-project ()
  (eval-after-load 'helm-projectile
    '(setq projectile-switch-project-action
           #'my/projectile-switch-project-action)))
