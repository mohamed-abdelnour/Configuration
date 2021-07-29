;;; init-esup.el --- ESUP -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Emacs Start-Up Profiler.

;;; Code:

(defun run-esup ()
  "Run ESUP, making sure that `early-init.el' is loaded."
  (interactive)
  (let* ((early (append-emacs-dir "/early-init.el"))
         (init (append-emacs-dir "/init.el"))
         (esup-init (expand-file-name "~/.cache/esup/init.el"))
         (create-file (format "cat %s %s > %s" early init esup-init)))
    (shell-command create-file)
    (esup esup-init)))

(use-package esup
  :defer t)

(provide 'init-esup)

;;; init-esup.el ends here
