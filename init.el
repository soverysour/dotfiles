(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))

(use-package hl-todo
  :ensure t
  :hook (prog-mode . hl-todo-mode)
  :config
  (setq hl-todo-highlight-punctuation ":"
        hl-todo-keyword-faces
        `(("TODO"       warning bold)
          ("FIXME"      error bold)
          ("HACK"       font-lock-constant-face bold)
          ("REVIEW"     font-lock-keyword-face bold)
          ("NOTE"       success bold)
          ("DEPRECATED" font-lock-doc-face bold))))

(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

(use-package evil :ensure t :init (evil-mode t))
(use-package evil-mc :ensure t :init
  (evil-mc-mode 1)
  (global-evil-mc-mode 1))

(use-package flycheck :ensure t :config
  (add-hook 'after-init-hook #'global-flycheck-mode))
(use-package nord-theme :ensure t :init (load-theme 'nord t))

(use-package general :ensure t)
(use-package neotree :ensure t)
(use-package sly :ensure t)
(use-package flycheck-rust :ensure t)
(use-package rust-mode :ensure t :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
(use-package ag :ensure t)
(use-package vertico :ensure t :init (vertico-mode +1))
(use-package which-key :ensure t :config (which-key-mode +1))

(use-package projectile
  :ensure t
  :init
  (setq projectile-project-search-path '("~/Documents/repositories"))
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (projectile-mode +1)
  (customize-set-value 'projectile-completion-system 'ido))

(general-define-key
 "M-§" 'neotree-toggle
 "M-±" 'neotree-change-root)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(global-display-line-numbers-mode)
(set-frame-font "Source Code Pro 16" nil t)

(setq display-line-numbers-type 'relative)
(setq inhibit-startup-screen t)
(setq inferior-lisp-program "sbcl")

(setq-default indent-tabs-mode nil)
(desktop-save-mode 1)

(setq make-backup-files nil)

(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq electric-indent-mode nil)
(setq rust-format-on-save t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
