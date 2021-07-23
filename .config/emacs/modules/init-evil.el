;;; init-evil.el --- evil -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Configuration for Evil.

;;; Code:

(use-package evil
  :init
  (setq evil-undo-system 'undo-redo
        evil-want-C-i-jump nil
        evil-want-C-u-scroll t
        evil-want-keybinding nil)
  (evil-mode))

(use-package evil-collection
  :after evil
  :config (evil-collection-init))

(provide 'init-evil)

;;; init-evil.el ends here
