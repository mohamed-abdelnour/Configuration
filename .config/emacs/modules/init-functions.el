;;; init-functions.el --- functions -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Miscellaneous functions.

;;; Code:

(cl-defun append-emacs-dir (&optional (suffix ""))
  "Return string with SUFFIX appended to Emacs's configuration directory."
  (format "%s%s" (expand-file-name "~/.config/emacs") suffix))

(defun kill-all-buffers ()
  "Kill all buffers."
  (interactive)
  (kill-matching-buffers ".*" nil t))

(defun plain-font (face)
  "Make FACE plain."
  (set-face-attribute face nil :weight 'normal :slant 'normal))

(defun plain-fonts ()
  "Make all fonts plain."
  (interactive)
  (mapc 'plain-font (face-list)))

(provide 'init-functions)

;;; init-functions.el ends here
