;;; early-init.el --- early init -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; This file contains the configuration that is loaded early during
;; Emacs's start-up.

;;; Code:

;; Suppress the GC at start-up.
(setq gc-cons-threshold most-positive-fixnum)

;; Disable `package.el`.
(setq package-enable-at-startup nil)

;; Set `user-emacs-directory`.
(setq user-emacs-directory (expand-file-name "~/.local/share/emacs"))

;; Set `native-comp-eln-load-path`.
(setcar native-comp-eln-load-path
        (expand-file-name (convert-standard-filename "var/eln-cache/")
                          user-emacs-directory))

;; Add `modules` directory to `load-path`.
(add-to-list 'load-path (expand-file-name "~/.config/emacs/modules"))

;; Add internal border padding.
(add-to-list 'default-frame-alist '(internal-border-width . 6))

;; Set the default background colour.
(add-to-list 'default-frame-alist '(background-color . "#000000"))

;; Set the default font.
(add-to-list 'default-frame-alist '(font . "Iosevka-11"))

;; Disable unwanted UI elements.
(blink-cursor-mode -1)
(column-number-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(scroll-bar-mode -1)

;; Leaner start-up.
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message user-login-name
      inhibit-default-init t
      initial-major-mode 'fundamental-mode
      initial-scratch-message nil)

;; Tab settings.
(setq-default indent-tabs-mode nil
              tab-width 4)

;;; early-init.el ends here
