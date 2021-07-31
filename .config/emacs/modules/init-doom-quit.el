;;; init-doom-quit.el --- doom-quit -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Use Doom Emacs's exit prompt!

;;; Code:

(defun confirm-exit (prompt)
  "Exit all recursive editing levels (when applicable).
Pass PROMPT to `keyboard-yes-or-no-p'."
  (when (>= (minibuffer-depth) 1)
    (top-level))
  (keyboard-yes-or-no-p prompt))

(use-package doom-quit
  :demand t
  :straight (doom-quit
             :host github
             :repo "hlissner/doom-emacs"
             :pre-build (("doom_quit_gen"))
             :files ("modules/ui/doom-quit/doom-quit.el")))

(provide 'init-doom-quit)

;;; init-doom-quit.el ends here
