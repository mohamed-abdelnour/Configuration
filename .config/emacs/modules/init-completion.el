;;; init-completion.el --- completion -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Configuration for completion frameworks.

;;; Code:

(defun +vertico-crm-exit ()
  (interactive)
  (run-at-time 0 nil #'vertico-exit)
  (funcall #'vertico-exit))

(use-package consult
  :bind (:map consult-crm-map
              ("RET" . +vertico-crm-exit)
              ("TAB" . vertico-exit))
  :init (advice-add #'completing-read-multiple
                    :override #'consult-completing-read-multiple)
  :custom
  (consult-async-refresh-delay 0.2)
  (consult-find-command "fd -Hp -c never -t f ARG OPTS"))

(use-package consult-lsp)

(use-package corfu
  :custom
  (corfu-commit-predicate nil)
  (corfu-cycle t)
  (corfu-quit-at-boundary t)
  (corfu-quit-no-match t)
  :init (corfu-global-mode))

(use-package dabbrev
  :bind (("M-/" . dabbrev-completion)
         ("C-M-/" . dabbrev-expand))
  :custom (dabbrev-case-replace nil)
  :straight nil)

(use-package marginalia
  :init (marginalia-mode))

(use-package orderless
  :init
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package vertico
  :init
  (setq vertico-cycle t)
  (vertico-mode))

(use-package vertico-directory
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word))
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy)
  :load-path "./straight/repos/vertico/extensions"
  :straight nil)

(provide 'init-completion)

;;; init-completion.el ends here
