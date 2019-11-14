;; -*- lexical-binding: t -*-

(defun custom/theme-config ()
  (setq doom-modeline-buffer-file-name-style #'truncate-upto-root
        doom-themes-neotree-project-size 1.0
        doom-themes-neotree-folder-size  1.0
        doom-themes-neotree-chevron-size 0.8
        fci-rule-color "#444444")
  (with-eval-after-load 'org-mode
    (doom-themes-org-config))
  (with-eval-after-load 'neotree
    (doom-themes-neotree-config)))
