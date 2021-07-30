;;; init-lsp.el --- lsp -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Configuration for lsp-mode.

;;; Code:

(use-package lsp-mode
  :commands lsp
  :config (define-key lsp-mode-map (kbd "C-c l") lsp-command-map)
  :custom
  (lsp-completion-provider :none)
  (lsp-enable-folding nil)
  (lsp-enable-text-document-color nil)
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-idle-delay 1.0)
  (lsp-keep-workspace-alive nil)
  (lsp-signature-auto-activate nil)
  :hook ((lsp-mode . lsp-enable-which-key-integration)))

(use-package lsp-ui
  :custom
  (lsp-ui-doc-enable nil)
  (lsp-ui-sideline-delay 1.0))

(provide 'init-lsp)

;;; init-lsp.el ends here
