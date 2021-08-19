;;; init.el --- init -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Entry point for the configuration.

;;; Code:

;; Bootstrap.
(require 'init-bootstrap)

;; No-littering.
(require 'init-littering)

;; Garbage Collector Magic Hack.
(require 'init-gcmh)

;; Miscellaneous functions.
(require 'init-functions)

;; Org-mode.
(require 'init-org)

;; Packages.
(require 'init-completion)
(require 'init-doom-quit)
(require 'init-eshell)
(require 'init-esup)
(require 'init-evil)
(require 'init-flycheck)
(require 'init-formatter)
(require 'init-languages)
(require 'init-lsp)
(require 'init-magit)
(require 'init-modus)
(require 'init-packages)
(require 'init-projects)
(require 'init-treesitter)

;; Miscellaneous options --- loaded last.
(require 'init-miscellaneous)

;;; init.el ends here
