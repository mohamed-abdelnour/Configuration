;;; init-projects.el --- projects -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Configuration for working with projects.

;;; Code:

(use-package ibuffer
  :demand t
  :straight nil)

(use-package perspective
  :bind
  ("C-x b" . persp-switch-to-buffer*)
  ("C-x C-b" . persp-ibuffer)
  :init (persp-mode))

(provide 'init-projects)

;;; init-projects.el ends here
