;; -*- lexical-binding: t -*-

(defun my//typescript-setup-flycheck ()
  ;; (flycheck-add-mode 'typescript-tide 'typescript-mode)
  ;; (flycheck-add-next-checker 'typescript-tide 'javascript-eslint 'append)

  ;; (flycheck-add-mode 'tsx-tide 'typescript-tsx-mode)
  ;; (flycheck-add-next-checker 'tsx-tide 'javascript-eslint 'append)

  (dolist (mode '(typescript-mode typescript-tsx-mode))
    (flycheck-add-mode 'javascript-eslint mode))

  (spacemacs/add-to-hooks #'my//typescript-setup-flycheck-eslint
                          '(typescript-mode-hook typescript-tsx-mode-hook) t))

(defun my//typescript-setup-flycheck-eslint ()
  (when-let* ((found (executable-find "eslint_d")))
    (set (make-local-variable 'flycheck-javascript-eslint-executable) found)))

(defun my/init-typescript ()
  (eval-after-load 'flycheck
    '(my//typescript-setup-flycheck)))
