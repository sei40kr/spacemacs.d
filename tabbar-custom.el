;; -*- lexical-binding: t -*-

(defun custom/tabbar-init ()
  (setq tabbar-separator '(0 . nil)
        tabbar-use-images nil
        tabbar-scroll-left-button '(("" . nil) . ("" . nil))
        tabbar-buffer-home-button '(("" . nil) . ("" . nil))
        tabbar-scroll-right-button '(("" . nil) . ("" . nil))))

(defun custom/tabbar-config ()
  (tabbar-mode +1)
  (define-key tabbar-mode-map (kbd "M-h")       #'tabbar-backward-tab)
  (define-key tabbar-mode-map (kbd "M-l")       #'tabbar-forward-tab)
  (define-key tabbar-mode-map (kbd "M-<left>")  #'tabbar-backward-tab)
  (define-key tabbar-mode-map (kbd "M-<right>") #'tabbar-forward-tab))
