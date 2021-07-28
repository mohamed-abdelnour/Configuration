;;; init-packages.el --- packages -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Miscellaneous packages and their configurations.

;;; Code:

(use-package doom-modeline
  :init
  (doom-modeline-mode)
  (setq doom-modeline-icon nil))

(use-package doom-themes
  :custom
  (doom-themes-enable-bold nil)
  (doom-themes-enable-italic nil))

(use-package hl-todo
  :init (global-hl-todo-mode))

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
