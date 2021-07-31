;;; init-evil.el --- evil -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Configuration for Evil.

;;; Code:

(use-package evil
  :bind ([remap evil-scroll-page-up] . evil-scroll-up)
  :custom
  (evil-undo-system 'undo-redo)
  (evil-want-C-i-jump nil)
  (evil-want-keybinding nil)
  :init
  (setq evil-disable-insert-state-bindings t)
  (evil-mode))

(use-package evil-collection
  :after evil
  :config (evil-collection-init)
  :demand t)

(provide 'init-evil)

;;; init-evil.el ends here
