;;; init-littering.el --- no-littering -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Keep Emacs's configuration directory clean.

;;; Code:

(use-package no-littering
  :custom (auto-save-file-name-transforms
           `((".*" ,(no-littering-expand-var-file-name "auto-save/") t))
           custom-file (no-littering-expand-etc-file-name "custom.el")))

(provide 'init-littering)

;;; init-littering.el ends here
