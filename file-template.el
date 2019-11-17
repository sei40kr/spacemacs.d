;; -*- lexical-binding: t -*-

(defvar custom--file-templates
  '(
    (c-mode                      . "template.c")
    (c++-mode                    . "template.cpp")
    (crystal-mode                . "template.cr")
    (css-mode                    . "template.css")
    (scss-mode                   . "template.scss")
    (dockerfile-mode             . "_Dockerfile")
    (editorconfig-conf-mode      . "template.editorconfig")
    ("_test\\.go\\'"             . "template_test.go")
    (go-mode                     . "template.go")
    (haskell-mode                . "template.hs")
    (java-mode                   . "template.java")
    (kotlin-mode                 . "template.kt")
    (perl-mode                   . "perl5-template.pl")
    (cperl-mode                  . "perl5-template.pl")
    ("\\`setup\\.py\\'"          . "_setup.py")
    (python-mode                 . "template.py")
    (ruby-mode                   . "template.rb")
    (enh-ruby-mode               . "template.rb")
    (rust-mode                   . "template.rs")
    (scala-mode                  . "template.scala")
    ("\\.bash\\'"                . "template.bash")
    ("\\.zsh\\'"                 . "template.zsh")
    (sh-mode                     . "template.sh")
    (fish-mode                   . "template.fish")
    ("\\-service\\.ya?ml\\'"     . "kubernetes-service.yml")
    ("\\-volumeclaim\\.ya?ml\\'" . "kubernetes-volumeclaim.yml")
    ("\\`\\.travis\\.ya?ml\\'"   . "_travis.yml")
    (yaml-mode                   . "template.yml")
    ))

(defun yatemplate-expand-yas-buffer ()
  "Expand the whole buffer with `yas-expand-snippet'."
  (require 'yasnippet)
  (yas-expand-snippet (buffer-string) (point-min) (point-max)))

(defun custom//file-template-auto-insert-alist ()
  (require 'dash)
  (-map
   (-lambda ((mode . file-name))
     (cons mode
           (vector (concat dotspacemacs-directory "templates/" file-name)
                   #'yatemplate-expand-yas-buffer)))
   custom--file-templates))

(defun custom/file-template-config ()
  (setq auto-insert-query nil
        auto-insert-alist (custom//file-template-auto-insert-alist))
  (auto-insert-mode 1))
