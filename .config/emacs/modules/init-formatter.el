;;; init-formatter.el --- reformatter -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Configuration for `emacs-reformatter`.

;;; Code:

(use-package reformatter
  :defer t)

;; Black
(reformatter-define black
  :program "black"
  :args '("-q" "-")
  :lighter " Black")

;; ClangFormat
(reformatter-define clang-format
  :program "clang-format"
  :args `("--assume-filename" ,buffer-file-name)
  :lighter " ClangFormat")

;; Prettier
(reformatter-define prettier
  :program "prettier"
  :args `("--stdin-filepath" ,buffer-file-name)
  :lighter " Prettier")

;; Rustfmt
(reformatter-define rustfmt
  :program "rustfmt"
  :lighter " Rustfmt")

;; brittany
(reformatter-define brittany
  :program "brittany"
  :lighter " brittany")

;; nixpkgs-fmt
(reformatter-define nixpkgs-fmt
  :program "nixpkgs-fmt"
  :lighter " nixpkgs-fmt")

;; shfmt
(reformatter-define shfmt
  :program "shfmt"
  :args '("-i" "4" "-ci" "-sr")
  :lighter " shfmt")

(provide 'init-formatter)

;;; init-formatter.el ends here
