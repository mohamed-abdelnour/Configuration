;;; init-formatter.el --- reformatter -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Configuration for `emacs-reformatter`.

;;; Code:

(use-package reformatter)

;; C/C++
(reformatter-define clang-format
  :program "clang-format"
  :args `("--assume-filename" ,buffer-file-name)
  :lighter " ClangFormat")

;; Haskell
(reformatter-define brittany
  :program "brittany"
  :lighter " brittany")

;; Nix
(reformatter-define nixpkgs-fmt
  :program "nixpkgs-fmt"
  :lighter " nixpkgs-fmt")

;; Python
(reformatter-define black
  :program "black"
  :args '("-q" "-")
  :lighter " Black")

;; Rust
(reformatter-define rustfmt
  :program "rustfmt"
  :lighter " Rustfmt")

;; Shell script
(reformatter-define shfmt
  :program "shfmt"
  :args '("-i" "4" "-ci" "-sr")
  :lighter " shfmt")

(provide 'init-formatter)

;;; init-formatter.el ends here
