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
