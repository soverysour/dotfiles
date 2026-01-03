(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(setq lsp-clients-lua-language-server-bin "/opt/homebrew/Cellar/lua-language-server/3.15.0/libexec/bin/lua-language-server")
(setq lsp-clients-lua-language-server-main-location "/opt/homebrew/Cellar/lua-language-server/3.15.0/libexec/bin/main.lua")

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

(use-package ivy :ensure t)
(use-package lsp-ivy :ensure t)
(use-package d-mode :ensure t)
(use-package lua-mode :ensure t)
(use-package company :ensure t)
(use-package company-dcd :ensure t)
(use-package lsp-mode :ensure t)
(use-package flycheck :ensure t)
(use-package nord-theme :ensure t :init (load-theme 'nord t))
(use-package general :ensure t)
(use-package neotree :ensure t)
(use-package sly :ensure t)
(use-package flycheck-rust :ensure t)
(use-package rust-mode :ensure t)
(use-package ag :ensure t)
(use-package vertico :ensure t :init (vertico-mode +1))
(use-package which-key :ensure t :config (which-key-mode +1))
(use-package cmake-mode :ensure t)

(use-package projectile :ensure t
  :init
  (setq projectile-project-search-path '(("~/Documents/repositories" . 3)))
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (projectile-global-mode +1)
  (customize-set-value 'projectile-completion-system 'ido)
  (projectile-discover-projects-in-search-path))

(use-package dap-mode :ensure t
  :after lsp-mode
  :config
  (dap-auto-configure-mode)
  (dap-mode 1)
  (dap-ui-mode 1)
  (dap-ui-controls-mode 1)
  :bind (("C-c d b" . dap-breakpoint-toggle)
         ("C-c d r" . dap-debug)
         ("C-c d s" . dap-continue)))


(require 'dap-lldb)
(setq dap-lldb-debug-program (shell-command-to-string "xcrun -f lldb-dap"))

(add-hook 'd-mode-hook 'company-dcd-mode)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
(add-hook 'rust-mode-hook #'lsp-deferred)
(add-hook 'lua-mode-hook #'lsp-deferred)
(add-hook 'c-mode-hook #'lsp-deferred)
(add-hook 'c++-mode-hook #'lsp-deferred)
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'after-init-hook #'global-company-mode)

(general-define-key
 "M-§" 'neotree-toggle
 "M-±" 'neotree-change-root)

(global-display-line-numbers-mode)
(set-frame-font "Source Code Pro 16" nil t)

(setq display-line-numbers-type 'relative)
(setq inhibit-startup-screen t)
(setq inferior-lisp-program "sbcl")

(setq-default indent-tabs-mode nil)
(desktop-save-mode 0)

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
