;;; init-flycheck.el --- flycheck -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Configuration for Flycheck.


;;; Code:

(use-package flycheck
  :config (add-to-list 'flycheck-shellcheck-supported-shells 'dash)
  :defer t
  :init (setq-default flycheck-disabled-checkers '(c/c++-clang
                                                   c/c++-cppcheck
                                                   c/c++-gcc)))

(provide 'init-flycheck)

;;; init-flycheck.el ends here
