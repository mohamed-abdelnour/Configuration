;;; init-packages.el --- packages -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Miscellaneous packages and their configurations.

;;; Code:

(use-package doom-modeline
  :init
  (doom-modeline-mode)
  (setq doom-modeline-icon nil))

(use-package pdf-tools
  :init (pdf-tools-install))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode))

(provide 'init-packages)

;;; init-packages.el ends here
