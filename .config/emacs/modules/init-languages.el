;;; init-languages.el --- languages -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Configuration for programming languages.

;;; Code:

;; C
(use-package cc-mode
  :bind (:map c-mode-map ("C-c n" . clang-format))
  :straight nil)

;; Haskell
(use-package lsp-haskell)

(use-package haskell-mode
  :bind (:map haskell-mode-map ("C-c n" . brittany))
  :custom (lsp-haskell-formatting-provider "brittany")
  :hook (haskell-mode . lsp))

;; Nix
(use-package nix-mode
  :bind (:map nix-mode-map ("C-c n" . nixpkgs-fmt))
  :mode "\\.nix\\'")

;; Python
(use-package lsp-pyright
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp))))

(use-package python
  :bind (:map python-mode-map ("C-c n" . black))
  :custom
  (python-indent-guess-indent-offset nil)
  (python-indent-offset 4)
  :straight nil)

;; Rust
(use-package rustic
  :hook (rustic-mode . lsp)
  :bind (:map rustic-mode-map ("C-c n" . rustfmt)))

;; Shell script
(use-package sh-script
  :bind (:map sh-mode-map ("C-c n" . shfmt))
  :straight nil)

(provide 'init-languages)

;;; init-languages.el ends here
