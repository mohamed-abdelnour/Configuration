;;; init-eshell.el --- Eshell -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Eshell.

;;; Code:

(defun eshell-directory ()
  "Format Eshell's current working directory."
  (let* ((directory (abbreviate-file-name (eshell/pwd))))
    (if (string= "/" directory)
        "/"
      (eshell/basename directory))))

(defun eshell-prompt ()
  "Custom Eshell prompt."
  (concat "[" (eshell-directory) "]\n" (if (= (user-uid) 0) "# " "$ ")))

(use-package eshell
  :custom
  (eshell-prompt-function 'eshell-prompt)
  (eshell-prompt-regexp "^[^#$\n]*[#$] ")
  :straight nil)

(provide 'init-eshell)

;;; init-eshell.el ends here
