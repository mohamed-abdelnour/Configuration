;;; init-keybindings.el --- keybindings -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Global keybindings.

;;; Code:

(global-unset-key (kbd "C-x C-b"))
(global-unset-key (kbd "C-x C-d"))

;; `consult'
(evil-define-key 'normal 'global (kbd "C-c f f") 'consult-find)
(evil-define-key 'normal 'global (kbd "C-c f g") 'consult-ripgrep)

(provide 'init-keybindings)

;;; init-keybindings.el ends here
