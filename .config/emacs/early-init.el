;;; early-init.el --- early init -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; This file contains the configuration that is loaded early during
;; Emacs's start-up.

;;; Code:

;; Set `user-emacs-directory`.
(setq user-emacs-directory (expand-file-name "~/.local/share/emacs"))

;; Disable `package.el`.
(setq package-enable-at-startup nil)

;; Suppress the GC at start-up.
(setq gc-cons-threshold most-positive-fixnum)

;; Add internal border padding.
(add-to-list 'default-frame-alist '(internal-border-width . 6))

;; Set default font.
(add-to-list 'default-frame-alist '(font . "Iosevka-11"))

;; Set theme.
(setq modus-themes-syntax '(faint))
(load-theme 'modus-vivendi t)

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
