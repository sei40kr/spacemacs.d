;; -*- lexical-binding: t -*-

(defun custom//treemacs-noop (&rest _))

(defun custom//treemacs-no-actions ()
  (treemacs-pulse-on-failure "There is nothing to do here."))

(defun custom/treemacs-collapse-or-up (&rest _)
  (interactive "P")
  (treemacs-do-for-button-state
   :on-root-node-open   (treemacs--collapse-root-node btn)
   :on-root-node-closed (custom//treemacs-no-actions)
   :on-dir-node-open    (treemacs--collapse-dir-node btn)
   :on-dir-node-closed  (treemacs-goto-parent-node)
   :on-file-node-open   (treemacs--collapse-file-node btn)
   :on-file-node-closed (treemacs-goto-parent-node)
   :on-tag-node-open    (treemacs--collapse-tag-node btn)
   :on-tag-node-closed  (treemacs-goto-parent-node)
   :on-tag-node-leaf    (treemacs-goto-parent-node)
   :on-nil              (custom//treemacs-no-actions)))

(defun custom/treemacs-expand-or-down (&optional arg)
  (interactive "P")
  (treemacs-do-for-button-state
   :on-root-node-open   (treemacs-next-line 1)
   :on-root-node-closed (treemacs--expand-root-node btn)
   :on-dir-node-open    (treemacs-next-line 1)
   :on-dir-node-closed  (treemacs--expand-dir-node btn :recursive arg)
   :on-file-node-open   (treemacs-visit-node-default)
   :on-file-node-closed (treemacs-visit-node-default)
   :on-tag-node-open    (treemacs-next-line 1)
   :on-tag-node-closed  (treemacs--expand-tag-node btn)
   :on-tag-node-leaf    (treemacs-visit-node-default)
   :on-nil              (custom//treemacs-no-actions)))

(defun custom/treemacs-root-up (&rest _)
  (interactive "P")
  (treemacs-root-up)
  (when-let* ((btn (treemacs-current-button))
              (_ (treemacs-is-node-collapsed? btn)))
    (treemacs--expand-root-node btn)))

(defun custom/treemacs-select-down (&optional arg)
  (interactive "P")
  (treemacs-do-for-button-state
   :on-root-node-open   (custom//treemacs-noop)
   :on-root-node-closed (treemacs--expand-root-node btn)
   :on-dir-node-open    (custom//treemacs-noop)
   :on-dir-node-closed  (treemacs--expand-dir-node btn :recursive arg)
   :on-file-node-open   (custom//treemacs-noop)
   :on-file-node-closed (treemacs--expand-file-node btn)
   :on-tag-node-open    (custom//treemacs-noop)
   :on-tag-node-closed  (treemacs--expand-tag-node btn)
   :on-tag-node-leaf    (custom//treemacs-noop)
   :on-nil              (custom//treemacs-noop))
  (when-let* ((btn (treemacs-current-button))
              (_ (treemacs-collect-child-nodes btn)))
    (treemacs-next-line 1)))

(defun custom/treemacs-select-up (&rest _)
  (interactive "P")
  (treemacs-do-for-button-state
   :on-root-node-open   (custom/treemacs-root-up)
   :on-root-node-closed (custom/treemacs-root-up)
   :on-dir-node-open    (treemacs-goto-parent-node)
   :on-dir-node-closed  (treemacs-goto-parent-node)
   :on-file-node-open   (treemacs-goto-parent-node)
   :on-file-node-closed (treemacs-goto-parent-node)
   :on-tag-node-open    (treemacs-goto-parent-node)
   :on-tag-node-closed  (treemacs-goto-parent-node)
   :on-tag-node-leaf    (treemacs-goto-parent-node)
   :on-nil              (custom//treemacs-no-actions)))

(defun custom/treemacs-config ()
  (setq treemacs-RET-actions-config
        '((root-node-open   . custom/treemacs-expand-or-down)
          (root-node-closed . custom/treemacs-expand-or-down)
          (dir-node-open    . custom/treemacs-expand-or-down)
          (dir-node-closed  . custom/treemacs-expand-or-down)
          (file-node-open   . custom/treemacs-expand-or-down)
          (file-node-closed . custom/treemacs-expand-or-down)
          (tag-node-open    . custom/treemacs-expand-or-down)
          (tag-node-closed  . custom/treemacs-expand-or-down)
          (tag-node-leaf    . custom/treemacs-expand-or-down))
        treemacs-TAB-actions-config
        '((root-node-open   . treemacs-toggle-node)
          (root-node-closed . treemacs-toggle-node)
          (dir-node-open    . treemacs-toggle-node)
          (dir-node-closed  . treemacs-toggle-node)
          (file-node-open   . treemacs-toggle-node)
          (file-node-closed . treemacs-toggle-node)
          (tag-node-open    . treemacs-toggle-node)
          (tag-node-closed  . treemacs-toggle-node)
          (tag-node-leaf    . custom//treemacs-no-actions))
        treemacs-recenter-after-file-follow 'always
        treemacs-recenter-after-tag-follow  'always
        treemacs-show-cursor t)

  (with-eval-after-load 'treemacs
    (require 'treemacs-persp)

    (setq treemacs-sorting 'alphabetic-asc)

    (evil-define-key 'treemacs treemacs-mode-map
      (kbd "K")  #'custom/treemacs-select-up
      (kbd "L")  #'treemacs-next-neighbour
      (kbd "gr") #'treemacs-refresh
      (kbd "h")  #'custom/treemacs-collapse-or-up
      (kbd "l")  #'custom/treemacs-expand-or-down)
    (bind-key (kbd "H") #'treemacs-previous-neighbour evil-treemacs-state-map)
    (bind-key (kbd "J") #'custom/treemacs-select-down treemacs-mode-map)
    (bind-key (kbd "R") #'treemacs-root-down          treemacs-mode-map)
    (bind-key (kbd "r") #'treemacs-rename             treemacs-mode-map)))
