;;; init-treesitter.el --- tree-sitter -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Tree-sitter.

;;; Code:

(use-package tree-sitter
  :config (global-tree-sitter-mode)
  :hook (tree-sitter-after-on . tree-sitter-hl-mode))

(use-package tree-sitter-langs
  :demand t)

(provide 'init-treesitter)

;;; init-treesitter.el ends here
