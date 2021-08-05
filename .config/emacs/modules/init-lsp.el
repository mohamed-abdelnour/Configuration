;;; init-lsp.el --- lsp -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Configuration for lsp-mode.

;;; Code:

(defun configure-lsp ()
  (lsp-completion--enable)
  (lsp-diagnostics--enable)
  (lsp-modeline-code-actions-mode)
  (lsp-modeline-diagnostics-mode))

(use-package consult-lsp)

(use-package lsp-mode
  :commands lsp
  :config (define-key lsp-mode-map (kbd "C-c l") lsp-command-map)
  :custom
  (lsp-auto-configure nil)
  (lsp-completion-provider :none)
  (lsp-enable-folding nil)
  (lsp-enable-text-document-color nil)
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-keep-workspace-alive nil)
  (lsp-signature-auto-activate nil)
  :hook ((lsp-configure . configure-lsp)
         (lsp-mode . lsp-enable-which-key-integration)))

(provide 'init-lsp)

;;; init-lsp.el ends here
