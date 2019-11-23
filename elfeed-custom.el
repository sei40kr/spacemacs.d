;; -*- lexical-binding: t -*-

(defun custom/elfeed-init ()
  (setq elfeed-feeds '(
                       "https://hackernoon.com/feed"
                       )
        elfeed-goodies/powerline-default-separator nil))
