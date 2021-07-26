;;; init-miscellaneous.el --- options -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Miscellaneous options.

;;; Code:

;; Relative line numbers.
(use-package display-line-numbers
  :init
  (setq display-line-numbers-type 'relative)
  (global-display-line-numbers-mode)
  :straight nil)

(defun confirm-exit (prompt)
  "Set `last-nomenu-event' to 0 and pass PROMPT to `yes-or-no-p'.
This forces the use of keyboard input for `yes-or-no-p'."
  (setq last-nonmenu-event 0)
  (yes-or-no-p prompt))

(use-package emacs
  :init
  ;; Default `fill-column' to 80.
  (setq-default fill-column 80)

  ;; Confirm kill Emacs.
  (setq confirm-kill-emacs #'confirm-exit)

  ;; Disable backup files.
  (setq make-backup-files nil)

  ;; Disable dynamic title.
  (setq frame-title-format '("GNU Emacs at " system-name)
        icon-title-format '("GNU Emacs at " system-name))

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

(provide 'init-miscellaneous)

;;; init-miscellaneous.el ends here
