;;; init-org.el --- Org-mode -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Org-mode.

;;; Code:

(use-package org
  :config
  (require 'org-tempo)
  (require 'ox-md)
  :defer t)

(provide 'init-org)

;;; init-org.el ends here
