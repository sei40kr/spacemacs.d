;; -*- lexical-binding: t -*-

(defun custom/neotree-config ()
  (setq neo-theme (if (display-graphic-p) 'icons 'ascii)
        neo-mode-line-type 'none
        neo-autorefresh t
        neo-confirm-create-directory                    #'off-p
        neo-confirm-create-file                         #'off-p
        neo-confirm-delete-directory-recursively        #'off-p
        neo-confirm-delete-file                         #'y-or-n-p
        neo-confirm-kill-buffers-for-files-in-directory #'off-p))
