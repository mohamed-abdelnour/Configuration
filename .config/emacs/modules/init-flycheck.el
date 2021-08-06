;;; init-flycheck.el --- flycheck -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Configuration for Flycheck.


;;; Code:

(use-package consult-flycheck)

(use-package flycheck
  :config (add-to-list 'flycheck-shellcheck-supported-shells 'dash)
  :init (setq-default flycheck-disabled-checkers '(c/c++-clang
                                                   c/c++-cppcheck
                                                   c/c++-gcc)))

(use-package flycheck-posframe
  :after flycheck
  :hook (flycheck-mode . flycheck-posframe-mode))

(provide 'init-flycheck)

;;; init-flycheck.el ends here
