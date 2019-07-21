;; -*- lexical-binding: t -*-

(defun my//javascript-disable-non-modern-checkers ()
  (require 'flycheck)
  (add-to-list 'flycheck-disabled-checkers 'javascript-jshint)
  (add-to-list 'flycheck-disabled-checkers 'javascript-standard))

(defun my/init-javascript ()
  ;; disable non-modern checkers
  (spacemacs/add-to-hooks #'my//javascript-disable-non-modern-checkers
                          '(js2-mode-hook rjsx-mode-hook)))
