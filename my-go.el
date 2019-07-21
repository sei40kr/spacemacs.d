;; -*- lexical-binding: t -*-

(defun my//go-disable-unnecessary-checkers ()
  (require 'flycheck)
  (add-to-list 'flycheck-disabled-checkers 'gometalinter)
  (add-to-list 'flycheck-disabled-checkers 'go-gofmt)
  (add-to-list 'flycheck-disabled-checkers 'go-test)
  (add-to-list 'flycheck-disabled-checkers 'go-megacheck))

(defun my/init-go ()
  (add-hook 'go-mode-hook #'my//go-disable-unnecessary-checkers))
