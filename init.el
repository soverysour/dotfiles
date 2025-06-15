(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

(use-package evil :ensure t :init (evil-mode t))
(use-package evil-mc :ensure t :init
  (evil-mc-mode 1)
  (global-evil-mc-mode 1))

(use-package raku-mode :ensure t :init
  (define-auto-insert '("\\.rakumod\\'" . "Raku module skeleton") 'raku-module-skeleton)
  (define-auto-insert '("\\.raku\\'" . "Raku script skeleton") 'raku-script-skeleton))
(use-package general :ensure t)
(use-package neotree :ensure t)
(use-package ag :ensure t)
(use-package vertico :ensure t :init (vertico-mode +1))
(use-package which-key :ensure t :config (which-key-mode +1))

(use-package projectile
  :ensure t
  :init
  (setq projectile-project-search-path '("~/Documents/repositories"))
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (projectile-mode +1))

(general-define-key
 "M-§" 'neotree-toggle
 "M-±" 'neotree-change-root)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(load-theme 'zenburn t)
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
