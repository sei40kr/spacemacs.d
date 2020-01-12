;; -*- lexical-binding: t -*-

(defun custom//magit-repos-to-projectile-projects ()
  (require 'magit-repos)
  (setq projectile-known-projects
        (append
         (mapcar #'abbreviate-file-name (magit-list-repos))
         '("/ssh:dmz.yong-ju.me:~/my-cloud"))))

(defun custom/projectile-init ()
  (setq projectile-git-submodule-command nil)

  (with-eval-after-load 'projectile
    (setq projectile-switch-project-action #'projectile-dired))

  (advice-add 'projectile-load-known-projects
              :override #'custom//magit-repos-to-projectile-projects)
  (advice-add 'projectile-remove-known-project
              :override #'(lambda (&optional project)))
  (advice-add 'projectile-add-known-projects
              :override #'(lambda (project-root)))
  (dolist (func '(projectile-cleanup-known-projects
                  projectile-clear-known-projects
                  projectile-save-known-projects
                  projectile-merge-known-projects))
    (advice-add func
                :override #'(lambda ())))

  (dolist (func '(helm-projectile-switch-project
                  spacemacs/helm-persp-switch-project))
    (advice-add func
                :before #'(lambda (_)
                            (custom//magit-repos-to-projectile-projects)))))
