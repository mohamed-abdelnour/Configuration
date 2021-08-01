;;; init-miscellaneous.el --- options -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Miscellaneous options.

;;; Code:

;; Relative line numbers.
(use-package display-line-numbers
  :custom (display-line-numbers-type 'relative)
  :init (global-display-line-numbers-mode)
  :straight nil)

(use-package emacs
  :bind ("s-q" . top-level)
  :init
  ;; Default `fill-column' to 80.
  (setq-default fill-column 80)

  ;; Disable backup files.
  (setq make-backup-files nil)

  ;; Disable dialog boxes.
  (setq use-dialog-box nil)

  ;; Disable dynamic title.
  (setq frame-title-format '("GNU Emacs at " system-name)
        icon-title-format '("GNU Emacs at " system-name))

  ;; Enable recursive minibuffers.
  (setq enable-recursive-minibuffers t)

  ;; Hide commands which do not work in current mode.
  (setq read-extended-command-predicate
        #'command-completion-default-include-p)

  ;; Improve performance.
  (setq read-process-output-max (expt 2 20))

  ;; Safe variables.
  (add-to-list 'safe-local-variable-values
               '(eval . (add-to-list 'flycheck-disabled-checkers 'emacs-lisp)))

  ;; Short answers.
  (setq use-short-answers t)

  ;; Silently add a newline at the end of a file.
  (setq require-final-newline t)

  ;; "Smooth-scrolling".
  (pixel-scroll-mode)
  (setq scroll-preserve-screen-position t
        scroll-conservatively 101)

  :straight nil)

(use-package mb-depth
  :init (minibuffer-depth-indicate-mode)
  :straight nil)

(provide 'init-miscellaneous)

;;; init-miscellaneous.el ends here
