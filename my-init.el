;; -*- lexical-binding: t -*-

;; yasnippet

(defun my//file-class-name ()
  (file-name-nondirectory (file-name-sans-extension (buffer-file-name))))

;; others

(defun my//enable-frame-transparency (frame)
  (spacemacs/enable-transparency frame
                                 (cons dotspacemacs-active-transparency
                                       dotspacemacs-inactive-transparency)))

(defun my/init ()
  (setq
   ;; Emacs built-ins
   backup-inhibited t
   create-lockfiles nil
   dired-use-ls-dired nil
   fci-rule-color "#444444"
   require-final-newline t
   select-enable-clipboard nil

   ;; avy
   avy-timeout-seconds 0.0))

(defun my/config ()
  (require 'flycheck-popup-tip)

  ;; Activate snippets
  (require 'competitive-programming-snippets)
  (require 'jest-snippets)
  (require 'rails-snippets)
  (require 'react-snippets)
  (require 'redux-snippets)

  ;; Fix frame transparency
  (my//enable-frame-transparency nil)
  (add-hook 'after-make-frame-functions #'my//enable-frame-transparency))
