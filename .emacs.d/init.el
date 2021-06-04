;;; package --- Emacs init.el
;;;
;;; Commentary:
;;; Set fonts and enable some packages from elpa

;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(if (eq system-type 'darwin)
    ;; Mac
    (progn
      ;; Fix stupid mac keyboard
      (set 'mac-option-key-is-meta t)
      (set 'mac-right-option-modifier nil)
      ;; Default font
      (set-face-attribute 'default nil
			  :family "Menlo" :height 180))
  ;; Else (Linux)
  (progn
    ;; Default font
    (set-face-attribute 'default nil
			:family "Inconsolata" :foundry "PfEd" :height 144)))

;; Don't warn about downcase/upcase-region
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Don't try to open .d files
(add-to-list 'completion-ignored-extensions ".d")

(setf counsel-find-file-ignore-regexp
    (concat
        ;; File names beginning with # or .
        "\\(?:\\`[#.]\\)"
        ;; File names ending with # or ~
        "\\|\\(?:\\`.+?[#~]\\'\\)"
   ;; File names ending with .d or .o
   "\\|\\(?:\\`.+?[od]\\'\\)"))

;; Set default browser
(setq browse-url-browser-function 'browse-url-chrome)
(setq browse-url-generic-program "google-chrome")

;;backup directory, tilde files go here
(setq backup-directory-alist '(("" . "~/.emacs.d/emacs_backup")))


;; --------------------
;; Initialize packages

(require 'package)
(progn
  (setq package-archives nil)
  (add-to-list 'package-archives
          '("melpa" . "https://melpa.org/packages/")))

(package-initialize)

;;; Prevent Emacs from automatically load packages on startup
;;; use-package takes care of package loading
(setq package-enable-at-startup nil)

;; If never connected to repositories before, download package descriptions so
;; `use-package' can trigger installation of missing packages.
(unless package-archive-contents
  (message "Refreshing ELPA package archives...")
  (package-refresh-contents))

;; Make sure use-package is installed
(unless (package-installed-p 'use-package)
  (message "`use-package' not found. Installing...")
  (package-refresh-contents)
  (package-install 'use-package))

;; Automatically download missing packages
(setf use-package-always-ensure t)

(setq use-package-minimum-reported-time 0
      use-package-verbose t)

;; Don't show startup-screen every time
(setq inhibit-startup-screen t)

;; --------------------
;; Split my packages and custom functions into separate files

(load-file "~/.emacs.d/my-packages.el")

(load-file "~/.emacs.d/my-functions.el")

;;; init.el ends here

;; -------------------------------
;; Automatically added stuff below

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(package-selected-packages '(try))
 '(show-paren-mode t))
(put 'dired-find-alternate-file 'disabled nil)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
