;;; init-bootstrap.el --- bootstrap `straight.el` -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Bootstrap `straight.el` and integrate it with `use-package`.

;;; Code:

(setq straight-fix-flycheck t
      straight-use-package-by-default t
      straight-vc-git-default-clone-depth 1)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(provide 'init-bootstrap)

;;; init-bootstrap.el ends here
