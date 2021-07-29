;;; init-projects.el --- projects -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Configuration for working with projects.

;;; Code:

(use-package perspective
  :bind
  ("C-x b" . persp-switch-to-buffer*)
  ("C-x C-b" . persp-ibuffer)
  :init (persp-mode))

(use-package projectile
  :bind (:map projectile-mode-map ("C-c p" . projectile-command-map))
  :init (projectile-mode))

(provide 'init-projects)

;;; init-projects.el ends here
