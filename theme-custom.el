;; -*- lexical-binding: t -*-

(defun custom/theme-config ()
  (setq doom-modeline-buffer-file-name-style #'truncate-upto-root
        doom-themes-neotree-project-size 1.0
        doom-themes-neotree-folder-size  1.0
        doom-themes-neotree-chevron-size 0.8
        fci-rule-color "#444444")

  ;; LSP
  (with-eval-after-load 'doom-themes
    (let* ((cyan (alist-get 'cyan doom-themes--colors))
           (green (alist-get 'green doom-themes--colors))
           (n (if (display-graphic-p) 0 1)))
      (setq lsp-ui-imenu-colors `(,(nth n cyan) ,(nth n green)))))

  ;; Org
  (with-eval-after-load 'org-mode
    (doom-themes-org-config))

  ;; Treemacs
  (with-eval-after-load 'treemacs
    (setq doom-themes-treemacs-theme "doom-colors"
          doom-themes-treemacs-enable-variable-pitch nil)
    (doom-themes-treemacs-config)
    (custom-set-faces
     '(treemacs-root-face ((t (:inherit font-lock-string-face :weight bold :height 1.0)))))))
