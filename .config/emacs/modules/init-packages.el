;;; init-packages.el --- packages -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Miscellaneous packages and their configurations.

;;; Code:

(use-package doom-modeline
  :custom
  (doom-modeline-height 1)
  (doom-modeline-icon nil)
  :init (doom-modeline-mode))

(use-package hl-todo
  :init (global-hl-todo-mode))

(use-package magit)

(use-package modus-themes-exporter
  :commands modus-themes-exporter-export
  :straight (modus-themes-exporter
             :host gitlab
             :repo "protesilaos/dotfiles"
             :files ("emacs/.emacs.d/prot-lisp/modus-themes-exporter.el")))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package rainbow-mode)

(use-package which-key
  :init (which-key-mode))

(provide 'init-packages)

;;; init-packages.el ends here
