;; -*- lexical-binding: t -*-

(defun custom/evil-init ()
  (setq evil-want-C-i-jump t
        evil-want-C-u-scroll t
        evil-want-Y-yank-to-eol t
        evil-escape-key-sequence "jk"
        ;; hybrid-mode
        hybrid-style-use-evil-search-module t))

(defun custom/evil-config ()
  (which-key-define-key-recursively global-map [escape] #'ignore)
  (which-key-define-key-recursively evil-emacs-state-map [escape] #'ignore)

  (global-set-key (kbd "C-h") #'delete-backward-char)
  (global-set-key (kbd "C-w") #'backword-kill-word)
  (with-eval-after-load 'clean-aindent-mode
    (bind-key (kbd "C-w") #'clean-aindent--bsunindent))
  (with-eval-after-load 'evil-ex
    (bind-key (kbd "C-h") #'evil-ex-delete-backward-char evil-ex-search-keymap))
  (with-eval-after-load 'company
    (bind-key (kbd "C-h") nil company-active-map)
    (bind-key (kbd "C-w") nil company-active-map))
  (with-eval-after-load 'helm
    (bind-key (kbd "C-w") #'backward-kill-word helm-map))
  (with-eval-after-load 'elisp-mode
    (bind-key (kbd "C-h") #'backward-delete-char-untabify emacs-lisp-mode-map))
  (with-eval-after-load 'org-mode
    (bind-key (kbd "C-h") #'org-delete-backward-char org-mode-map))

  ;; evil-mc
  (add-hook 'prog-mode-hook #'turn-on-evil-mc-mode)
  (add-hook 'text-mode-hook #'turn-on-evil-mc-mode)
  (defun custom/evil-escape-everything ()
    (interactive)
    (spacemacs/evil-search-clear-highlight)
    (when (bound-and-true-p evil-mc-mode)
      (evil-mc-undo-all-cursors)))
  (with-eval-after-load 'evil-core
    (evil-global-set-key 'normal
                         (kbd "<escape>") #'custom/evil-escape-everything))

  (spacemacs/toggle-camel-case-motion-globally-on))
