;;; init-functions.el --- functions -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Miscellaneous functions.

;;; Code:

(cl-defun append-emacs-dir (&optional (suffix ""))
  "Return string with SUFFIX appended to Emacs's configuration directory."
  (format "%s%s" (expand-file-name "~/.config/emacs") suffix))

(defun keyboard-yes-or-no-p (prompt)
  "Set `last-nomenu-event' to 0 and pass PROMPT to `yes-or-no-p'.
This forces the use of keyboard input for `yes-or-no-p'."
  (setq last-nonmenu-event 0)
  (yes-or-no-p prompt))

(defun plain-font (face)
  "Make FACE plain."
  (set-face-attribute face nil :weight 'normal :slant 'normal))

(defun plain-fonts ()
  "Make all fonts plain."
  (interactive)
  (mapc 'plain-font (face-list)))

(provide 'init-functions)

;;; init-functions.el ends here
