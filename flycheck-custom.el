;; -*- lexical-binding: t -*-

(defvar custom--flycheck-disabled-checkers
  '(
    ((go-mode-hook) . (gometalinter go-gofmt go-test go-megacheck))
    ((js2-mode-hook rjsx-mode-hook) . (javascript-jshint javascript-standard))
    ((rust-mode-hook) . (rust-cargo))
    ))

(defun custom/flycheck-init ()
  (setq flycheck-check-syntax-automatically '(save mode-enabled)
        flycheck-display-errors-delay 0.3
        ;; flycheck-pos-tip
        tooltip-delay 0.3
        tooltip-hide-delay 999
        tooltip-short-delay 0.1
        flycheck-pos-tip-timeout 999
        flycheck-pos-tip-display-errors-tty-function #'flycheck-popup-tip-show-popup
        ;; flycheck-popup-tip
        flycheck-popup-tip-error-prefix "* ")
  (when (not (display-graphic-p))
    (with-eval-after-load 'flycheck
      (require 'flycheck-popup-tip)))

  (dolist (hooks-and-checkers custom--flycheck-disabled-checkers)
    (let* ((hooks (car hooks-and-checkers))
           (checkers (cdr hooks-and-checkers)))
      (spacemacs/add-to-hooks
       #'(lambda ()
           (require 'flycheck)
           (dolist (checker checkers)
             (add-to-list 'flycheck-disabled-checkers checker)))
       hooks)))

  (add-hook 'python-mode-hook
            #'(lambda ()
                (when (eq (spacemacs//python-backend) 'lsp)
                  (require 'flycheck)
                  (add-to-list 'flycheck-disabled-checkers 'python-mypy)))))
