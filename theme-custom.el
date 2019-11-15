;; -*- lexical-binding: t -*-

(defun custom/theme-config ()
  (setq doom-modeline-buffer-file-name-style #'truncate-upto-root
        doom-themes-neotree-project-size 1.0
        doom-themes-neotree-folder-size  1.0
        doom-themes-neotree-chevron-size 0.8
        fci-rule-color "#444444")
  (let* ((cyan (alist-get 'cyan doom-themes--colors))
         (green (alist-get 'green doom-themes--colors))
         (n (if (display-graphic-p) 0 1)))
    (setq lsp-ui-imenu-colors (list (nth n cyan) (nth n green))))
  (with-eval-after-load 'org-mode
    (doom-themes-org-config))
  (with-eval-after-load 'neotree
    (doom-themes-neotree-config)))
