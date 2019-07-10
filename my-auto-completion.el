;; -*- lexical-binding: t -*-

(defun my/init-auto-completion ()
  (setq yas-new-snippet-default "\
# -*- mode: snippet -*-
# name: $1
# contributor : Seong Yong-ju <sei40kr@gmail.com>
# key: ${2:${1:$(yas--key-from-desc yas-text)}}
# --

$0"))
