;;; init-completion.el --- completion -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Configuration for completion frameworks.

;;; Code:

(use-package consult
  :bind
  ("C-c b" . consult-buffer)
  ("C-c f" . consult-find)
  ("C-c k" . consult-man)
  ("C-c l" . consult-line)
  ("C-c r" . consult-ripgrep)
  :custom
  (consult-async-input-debounce 0.1)
  (consult-async-input-throttle 0.2)
  (consult-async-refresh-delay  0.15)
  (consult-find-command "fd -HLp -E .git -c never -t f ARG OPTS")
  (consult-line-numbers-widen t)
  (consult-narrow-key "<")
  :init (advice-add #'completing-read-multiple
                    :override #'consult-completing-read-multiple))

(use-package consult-lsp)

(use-package corfu
  :bind (:map corfu-map
              ("C-n" . corfu-next)
              ("C-p" . corfu-previous))
  :custom
  (corfu-commit-predicate nil)
  (corfu-cycle t)
  (corfu-quit-no-match nil)
  :init (corfu-global-mode))

(use-package dabbrev
  :bind (("M-/" . dabbrev-completion)
         ("C-M-/" . dabbrev-expand))
  :custom (dabbrev-case-replace nil)
  :straight nil)

(use-package embark
  :bind (("C-c a" . embark-act)
         ("C-h B" . embark-bindings))
  :custom
  (embark-indicator 'embark-minimal-indicator)
  (prefix-help-command #'embark-prefix-help-command))

(use-package embark-consult
  :after (embark consult)
  :demand t
  :hook (embark-collect-mode . consult-preview-at-point-mode))

(use-package marginalia
  :bind ("M-A" . marginalia-cycle)
  :init (marginalia-mode))

(use-package orderless
  :init (setq completion-styles '(orderless)
              completion-category-defaults nil
              completion-category-overrides nil))

(use-package vertico
  :custom (vertico-cycle t)
  :init (vertico-mode))

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
