;;; init-doom-quit.el --- doom-quit -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Use Doom Emacs's exit prompt!

;;; Code:

(defun confirm-exit (prompt)
  "Set `last-nomenu-event' to 0 and pass PROMPT to `yes-or-no-p'.
This forces the use of keyboard input for `yes-or-no-p'."
  (setq last-nonmenu-event 0)
  (yes-or-no-p prompt))

(use-package doom-quit
  :straight (doom-quit
             :host github
             :repo "hlissner/doom-emacs"
             :depth 1
             :pre-build (("doom_quit_gen"))
             :files ("modules/ui/doom-quit/doom-quit.el")))

(provide 'init-doom-quit)

;;; init-doom-quit.el ends here
