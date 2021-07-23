;;; init-magit.el --- Magit -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Configuration for Magit!

;;; Code:

(defun magit-wrapper (prog)
  "Set `magit-git-executable' to PROG then call `magit-status' interactively."
  (interactive)
  (setq magit-git-executable prog)
  (call-interactively 'magit-status))

(use-package magit
  :bind (("C-x g" . (lambda () (interactive) (magit-wrapper "git")))
         ("C-c g" . (lambda () (interactive) (magit-wrapper "bare")))))

(provide 'init-magit)

;;; init-magit.el ends here
