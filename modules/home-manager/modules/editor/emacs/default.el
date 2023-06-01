(eval-when-compile
  (require 'use-package))
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)                ;; if you use any :bind variant

;; Use no-littering to automatically set common paths to the new user-emacs-directory
(use-package no-littering
  :ensure t
  :config
  (setq auto-save-file-name-transforms `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))
  )

(use-package all-the-icons
  :if (display-graphic-p))
(load-theme 'gruvbox-dark-medium t)

;; Enable Evil
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))
(use-package evil-nerd-commenter
  :bind ("M-;" . evilnc-comment-or-uncomment-lines))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package hydra
  :defer 1)

(use-package lsp-mode
  :commands lsp
  :hook
  (haskell-mode . lsp-deferred)
  (haskell-literate-mode . lsp-deferred)
  (rust-mode . lsp-deferred)
  (go-mode . lsp-deferred)
  (lsp-mode . lsp-enable-which-key-integration)
  :custom
  (lsp-rust-analyzer-cargo-watch-command "clippy"))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-sideline-enable t)
  (setq lsp-ui-sideline-show-hover nil)
  (setq lsp-ui-doc-position 'bottom)
  (lsp-ui-doc-show))

(use-package haskell-mode
  :custom
  (haskell-stylish-on-save t)
  :hook
  ;; (haskell-mode . structured-haskell-mode)
  )
(use-package nix-haskell-mode
  :hook (haskell-mode . nix-haskell-mode))

(use-package rust-mode
  :config
  (setq rust-format-on-save t))
(use-package rustic)
(use-package cargo
  :hook
  (rust-mode . cargo-minor-mode))

(use-package yasnippet
  :ensure
  :hook
  (prog-mode . yas-minor-mode)
  (text-mode . yas-minor-mode)
  :config
  (yas-reload-all))

(use-package company
  :after lsp-mode
  :hook
  (lsp-mode . company-mode)
  (after-init . global-company-mode)
  :bind (:map company-active-map
         ("<tab>" . company-complete-selection))
        (:map lsp-mode-map
         ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay (lambda () (if (company-in-string-or-comment) nil 0)))
  (company-selection-wrap-around t)
  )
(use-package company-quickhelp
  :init (company-quickhelp-mode))
(company-quickhelp-mode)
(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :hook
  (flycheck-mode . flycheck-haskell-setup)
  (flycheck-mode . flycheck-rust-setup)
  (flycheck-mode . flycheck-inline-mode)
  )
(use-package flycheck-hledger
  :after (flycheck ledger-mode)
  :demand t)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package sideline
  :hook (flycheck-mode . sideline-mode)
  :init
  (setq sideline-backends-right '(sideline-flycheck)))
(use-package sideline-flycheck :hook (flycheck-mode . sideline-flycheck-setup))

(use-package dirvish
  :config
  (dirvish-override-dired-mode))

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :custom ((projectile-completion-system 'ivy))
  :init
  (projectile-mode +1))
(use-package counsel-projectile
  :after projectile
  :config (counsel-projectile-mode))

(use-package nix-mode
  :mode ("\\.nix\\'" "\\.nix.in\\'"))
(use-package nix-drv-mode
  :ensure nix-mode
  :mode "\\.drv\\'")
(use-package nix-shell
  :ensure nix-mode
  :commands (nix-shell-unpack nix-shell-configure nix-shell-build))
(use-package nix-repl
  :ensure nix-mode
  :commands (nix-repl))

(use-package flymake-shellcheck
  :commands flymake-shellcheck-load
  :init
  (add-hook 'sh-mode-hook 'flymake-shellcheck-load))

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))
(use-package ivy-rich
  :after ivy
  :init
  (ivy-rich-mode 1))
(use-package counsel
  :bind (("C-M-j" . 'counsel-switch-buffer)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :custom
  (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
  :config
  (counsel-mode 1))
(use-package ivy-prescient
  :after counsel
  :custom
  (ivy-prescient-enable-filtering nil)
  :config
  ;; Uncomment the following line to have sorting remembered across sessions!
  ;(prescient-persist-mode 1)
  (ivy-prescient-mode 1))
(use-package lsp-ivy
  :after lsp)

(use-package helpful
  :commands (helpful-callable helpful-variable helpful-command helpful-key)
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package command-log-mode
  :commands command-log-mode)

