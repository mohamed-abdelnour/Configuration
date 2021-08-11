;;; init-lsp.el --- lsp -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Configuration for lsp-mode.

;;; Code:

(use-package consult-lsp)

(use-package lsp-mode
  :commands lsp
  :config (define-key lsp-mode-map (kbd "C-c l") lsp-command-map)
  :custom
  (lsp-completion-provider :none)
  (lsp-enable-folding nil)
  (lsp-enable-symbol-highlighting nil)
  (lsp-enable-text-document-color nil)
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-keep-workspace-alive nil)
  (lsp-signature-auto-activate nil)
  :hook (lsp-mode . lsp-enable-which-key-integration))

(provide 'init-lsp)

;;; init-lsp.el ends here
