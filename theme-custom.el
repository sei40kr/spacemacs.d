;; -*- lexical-binding: t -*-

(defun custom//pick-doom-color (key)
  (nth (if (display-graphic-p) 0 1) (alist-get key doom-themes--colors)))

(defun custom//doom-tabbar-generate-bar-xpm ()
  (let* ((width (if (eq system-type 'darwin) 3 6))
         (height 25)
         (color (custom//pick-doom-color 'blue)))
    (propertize " " 'display
                (create-image (concat "/* XPM */\n"
                                      "static char * percent[] = {\n"
                                      (format "    \"%i %i 2 1\",\n" width height)
                                      (format "    \". c %s\",\n" color)
                                      (format "    \"  c %s\",\n" color)
                                      (apply #'concat
                                             (mapcar #'(lambda (line)
                                                         (format "    \"%s\",\n" line))
                                                     (make-list height (make-string width 46))))
                                      "};\n")
                              'xpm t
                              :ascent 'center))))

(defvar custom--doom-tabbar-bar-xpm nil)

(defun custom//doom-tabbar-refresh-bar-xpm ()
  (setq custom--doom-tabbar-bar-xpm (custom//doom-tabbar-generate-bar-xpm)))

(defun custom//doom-tabbar-tab-label-function (tab)
  (concat (when (and (display-graphic-p)
                     (eq tab (tabbar-selected-tab (tabbar-current-tabset))))
            custom--doom-tabbar-bar-xpm)
          "  " (tabbar-buffer-tab-label tab) "  "))

(defun custom/theme-config ()
  (setq doom-modeline-buffer-file-name-style #'truncate-upto-root
        doom-themes-neotree-project-size 1.0
        doom-themes-neotree-folder-size  1.0
        doom-themes-neotree-chevron-size 0.8
        fci-rule-color "#444444")

  ;; LSP
  (with-eval-after-load 'doom-themes
    (let* ((cyan (custom//pick-doom-color 'cyan))
           (green (custom//pick-doom-color 'green)))
      (setq lsp-ui-imenu-colors '(cyan green))))

  ;; Org
  (with-eval-after-load 'org-mode
    (doom-themes-org-config))

  ;; Treemacs
  (with-eval-after-load 'treemacs
    (setq doom-themes-treemacs-theme "doom-colors"
          doom-themes-treemacs-enable-variable-pitch nil)
    (doom-themes-treemacs-config)
    (custom-set-faces
     '(treemacs-root-face ((t (:inherit font-lock-string-face :weight bold :height 1.0))))))

  ;; tabbar
  (with-eval-after-load 'tabbar
    (with-eval-after-load 'doom-themes
      (setq tabbar-tab-label-function #'custom//doom-tabbar-tab-label-function)
      (custom//doom-tabbar-refresh-bar-xpm))
    (let* ((base5 (custom//pick-doom-color 'fg-alt))
           (bg (custom//pick-doom-color 'bg))
           (bg-alt (custom//pick-doom-color 'bg-alt))
           (fg (custom//pick-doom-color 'fg)))
      (set-face-attribute 'tabbar-default nil
                          :background bg-alt)
      (set-face-attribute 'tabbar-modified nil)
      (set-face-attribute 'tabbar-selected nil
                          :weight 'bold
                          :background bg
                          :foreground fg)
      (set-face-attribute 'tabbar-separator nil)
      (set-face-attribute 'tabbar-highlight nil
                          :background nil
                          :foreground nil)
      (set-face-attribute 'tabbar-unselected nil
                          :foreground base5)
      (set-face-attribute 'tabbar-selected-modified nil
                          :inherit 'tabbar-selected))))
