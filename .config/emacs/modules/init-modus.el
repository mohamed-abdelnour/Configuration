;;; init-modus.el --- Modus themes -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Modus themes.

;;; Code:

(use-package modus-themes
  :custom-face (bold ((t :weight normal)))
  :init
  (setq modus-themes-mode-line '(borderless))
  (modus-themes-load-themes)
  (modus-themes-load-vivendi))

(provide 'init-modus)

;;; init-modus.el ends here
