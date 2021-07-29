;;; init-magit.el --- Magit -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Configuration for Magit!

;;; Code:

(defun magit-wrapper (exe)
  "Set `magit-git-executable' to EXE then call `magit-status' interactively."
  (interactive)
  (setq magit-git-executable exe)
  (call-interactively 'magit-status))

(use-package magit
  :bind (("C-x g" . (lambda () (interactive) (magit-wrapper "git")))
         ("C-c g" . (lambda () (interactive) (magit-wrapper "bare"))))
  :defer t)

(provide 'init-magit)

;;; init-magit.el ends here
