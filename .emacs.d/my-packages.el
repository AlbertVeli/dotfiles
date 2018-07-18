;;; package --- My packages

;;; Commentary:
;;  from elpa

;;; Code:

;; Load color theme (t to load solarized, nil for deep-blue)
(if t
    (progn
      (use-package zenburn-theme :ensure t)
      (eval-after-load "zenburn-theme"
	(load-theme 'zenburn t)))
      ;;(use-package solarized-theme :ensure t)
      ;;(eval-after-load "solarized-theme"
	;;(load-theme 'solarized-dark t)))
  (progn
    (use-package color-theme :ensure t)
    (eval-after-load "color-theme"
      (progn
	(color-theme-initialize)
	(color-theme-deep-blue)))))

(use-package projectile
  :demand t
  :ensure t
  :config (projectile-mode t))

(use-package which-key
  :diminish which-key-mode
  :config
  (which-key-mode)
  (which-key-setup-side-window-bottom)
  (setq which-key-use-C-h-for-paging t
	which-key-prevent-C-h-from-cycling t))

;(use-package magit
;  :ensure t)

(use-package ivy
  :ensure t
  :demand victory
  :config
  (ivy-mode 1)
  ;; add ‘recentf-mode’ and bookmarks to ‘ivy-switch-buffer’.
  (setq ivy-use-virtual-buffers t)
  ;; count candidates
  (setq ivy-count-format "%-4d "))

(use-package counsel
  :ensure t
  :demand victory
  :init
  :config
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-s") 'counsel-grep-or-swiper)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-load-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (global-set-key (kbd "C-c C-r") 'ivy-resume))

(use-package swiper
  :ensure t
  :demand victory)

(use-package yafolding
  :ensure t
  :demand victory
  :config
  (global-set-key (kbd "C-c f") 'yafolding-toggle-all)
  (global-set-key (kbd "C-c e") 'yafolding-toggle-element))

;; M-x google-this
(use-package google-this
  :ensure t)

;; Popup a menu and let us select what to yank from the kill-ring
(use-package popup-kill-ring
  :demand t
  :bind* ("M-y" . popup-kill-ring))

;; on-the-fly syntax checking
(use-package flycheck
  :demand t
  :init
  ;; (add-hook 'after-init-hook 'global-flycheck-mode)
  :config
  (setf flycheck-display-errors-function nil)
  (use-package flycheck-pos-tip
    :config
    (setf flycheck-pos-tip-timeout (* 60 10))
    (flycheck-pos-tip-mode))
  :hook (prog-mode . flycheck-mode))

;;Text completion
;; M-n, M-p to select completion, tab to complete.
(use-package company
  :demand t
  :config
  ;; (add-hook 'after-init-hook 'global-company-mode)

  (setf company-show-numbers t)
  (setf company-minimum-prefix-length 2)
  (setf company-idle-delay 0.1)
  (setf company-global-modes '(not gud-mode))

  (defun company-turn-off-fci (&rest ignore)
    (when (boundp 'fci-mode)
      (setf company-fci-mode-on-p fci-mode)
      (when fci-mode (fci-mode -1))))

  (defun company-maybe-turn-on-fci (&rest ignore)
    (when company-fci-mode-on-p (fci-mode 1)))

  :hook ((prog-mode . company-mode)
    (company-completion-started-hook . company-turn-off-fci)
    (company-completion-finished-hook . company-maybe-turn-on-fci)
    (company-completion-cancelled-hook . company-maybe-turn-on-fci)))

(use-package lsp-mode
  :demand t)

(use-package cquery
  :demand t
  :config
  (setf cquery-extra-init-params '(:completion (:detailedLabel t)))
  (setf cquery-sem-highlight-method 'font-lock)
  (cquery-use-default-rainbow-sem-highlight))

(use-package company-lsp
  :demand t
  :config
  (setf company-transformers nil company-lsp-async t company-lsp-cache-candidates nil)
  (setf company-lsp-async t))

(use-package lsp-ui
  :demand t
  :config
  (setf lsp-ui-sideline-show-symbol t)
  (defun my-cquery-find-vars ()
    (interactive)
    (lsp-ui-peek-find-custom 'vars "$cquery/vars"))

  (defun my-cquery-find-callers ()
    (interactive)
    (lsp-ui-peek-find-custom 'callers "$cquery/callers"))

  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  (bind-key "C-c C-x v" #'my-cquery-find-vars lsp-ui-mode-map)
  (bind-key "C-c C-x c" #'my-cquery-find-callers lsp-ui-mode-map)
  (add-hook 'lsp-mode 'lsp-ui-mode))

(defun my-c-mode-hook-func ()
  (company-mode 1)
  (lsp-cquery-enable)
  (add-to-list 'company-backends 'company-lsp))
(add-hook 'c-mode-hook 'my-c-mode-hook-func)

(use-package nyan-mode
  :demand victory
  :init (nyan-mode t))
