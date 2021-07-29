;;; init-modus.el --- Modus themes -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Modus themes.

;;; Code:

(use-package modus-themes
  :bind ("<f5>" . modus-themes-toggle)
  :config (modus-themes-load-vivendi)
  :init
  (setq modus-themes-syntax '(faint))
  (modus-themes-load-themes))

(provide 'init-modus)

;;; init-modus.el ends here
