;;; init-languages.el --- languages -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Configuration for programming languages.

;;; Code:

(defun set-format-key (keymap formatter)
  "Define a key for running FORMATTER in KEYMAP."
  (define-key keymap (kbd "C-c n") formatter))

;; C
(use-package cc-mode
  :config (set-format-key c-mode-map #'clang-format)
  :straight nil)

;; Haskell
(use-package lsp-haskell)

(use-package haskell-mode
  :config (set-format-key haskell-mode-map #'brittany)
  :custom (lsp-haskell-formatting-provider "brittany")
  :hook (haskell-mode . lsp))

;; Markdown
(use-package markdown-mode
  :config (set-format-key markdown-mode-map #'prettier)
  :mode "\\.md\\'")

;; Nix
(use-package nix-mode
  :config (set-format-key nix-mode-map #'nixpkgs-fmt)
  :mode "\\.nix\\'")

;; Python
(use-package lsp-pyright
  :hook (python-mode . (lambda () (require 'lsp-pyright) (lsp))))

(use-package python
  :config (set-format-key python-mode-map #'black)
  :custom
  (python-indent-guess-indent-offset nil)
  (python-indent-offset 4)
  :straight nil)

;; Rust
(use-package rustic
  :config (set-format-key rustic-mode-map #'rustfmt)
  :hook (rustic-mode . lsp))

;; Shell script
(use-package sh-script
  :config (set-format-key sh-mode-map #'shfmt)
  :straight nil)

;; YAML
(use-package yaml-mode
  :config (set-format-key yaml-mode-map #'prettier))

(provide 'init-languages)

;;; init-languages.el ends here
