;;; init.el --- init -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Entry point for the configuration.

;;; Code:

;; Add `modules` directory to `load-path`.
(add-to-list
 'load-path
 (expand-file-name "modules/" (file-name-directory load-file-name)))

;; Bootstrap.
(require 'init-bootstrap)

;; No-littering.
(require 'init-littering)

;; Garbage Collector Magic Hack.
(require 'init-gcmh)

;; Org-mode --- loaded as early as possible.
(require 'init-org)

;; Packages.
(require 'init-completion)
(require 'init-doom-quit)
(require 'init-evil)
(require 'init-flycheck)
(require 'init-formatter)
(require 'init-languages)
(require 'init-lsp)
(require 'init-magit)
(require 'init-packages)
(require 'init-projects)
(require 'init-treesitter)

;; Keybindings.
(require 'init-keybindings)

;; Miscellaneous options --- loaded last.
(require 'init-miscellaneous)

;;; init.el ends here
