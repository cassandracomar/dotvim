;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     lua
     vimscript
     csv
     (rust :variables
           rust-backend 'lsp)
     (go :variables
         go-tab-width 4
         go-format-before-save t
         go-use-golang-ci-lint t
         godoc-at-point-function 'godoc-gogetdoc)
     sql
     javascript
     php
     html
     python
     (yaml :variables yaml-enable-lsp nil)
     helm
     (lsp :variables
          lsp-ui-doc-winum-ignore t
          lsp-ui-doc--buffer-prefix " *lsp-ui-doc-"
          lsp-rust-server 'rust-analyzer)
     (haskell :variables
              haskell-completion-backend 'lsp
              haskell-process-type 'stack-ghci)
     (auto-completion
       :variables auto-completion-enable-snippets-in-popup t
                  auto-completion-return-key-behavior 'complete
                  auto-completion-tab-key-behavior 'cycle
                  auto-completion-enable-help-tooltip t)
     emacs-lisp
     git
     ;github
     markdown
     (org :variables
          org-enable-github-support t
          org-enable-reveal-js-support t
          org-projectile-file "TODOs.org")

     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-shell 'eshell
            eshell-prefer-lisp-functions nil
            shell-default-full-span nil)
     (shell-scripts :variables shell-scripts-backend 'lsp)

     syntax-checking
     (ruby :variables
           ruby-version-manager 'rvm
           ruby-test-runner 'rspec)
     terraform
     ansible
     shell-scripts
     (ranger :variables ranger-override-dired-mode t)
     docker
     nginx
     systemd
     terraform
     (version-control :variables
                      version-control-diff-tool 'nil)
     cassandra-miscellaneous
     (treemacs :variables
               treemacs-use-follow-mode 'tag
               treemacs-use-git-mode 'deferred
               treemacs-use-filewatch-mode t)
     dap
     pandoc
     tmux
     elasticsearch
     graphviz
   )
   ;; List of additional packages that will be install
   ;; wrapped in a layer. If you need some configuration for these
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
     (groovy-mode :location elpa)
     (lsp-haskell :location
                  (recipe :fetcher github
                          :repo "emacs-lsp/lsp-haskell"
                          :commit "11334955c38735c2281b7845df895ce3b37b6cb4"))
     (fish-completion :location elpa)
     (bash-completion :location elpa)
     (kubernetes :location (recipe :fetcher github :repo "chrisbarrett/kubernetes-el"))
     (kubernetes-evil :location elpa)
     (kubernetes-tramp :location (recipe :fetcher github :repo "gruggiero/kubernetes-tramp"))
     (org-preview-html :location (recipe :fetcher github :repo "lujun9972/org-preview-html"))
     (org-make-toc :location elpa)
     (quark-emacs-tramp :location (recipe :fetcher github :repo "PythonNut/quark-emacs"))
     (su :location (recipe :fetcher github :repo "PythonNut/su.el"))
     (aweshell :location (recipe :fetcher github :repo "manateelazycat/aweshell"))
     (helm-tramp :location (recipe :fetcher github :repo "masasam/emacs-helm-tramp"))
     (virtualenvwrapper :location elpa)
     (helm-system-packages :location (recipe :fetcher github :repo "emacs-helm/helm-system-packages"))
     (haskell-unicode-tokens :location (recipe :fetcher github :repo "jwiegley/haskell-config"))
     (helm-flx :location elpa)
     (el-patch :location elpa)
     (rg :location elpa)
     (deadgrep :location elpa)
     (shackle :location elpa)
     (helm-rg :location elpa)
     (rustic :location elpa)
     (cargo :location elpa)
     (flycheck-rust :location elpa)
     (eglot :location elpa)
   )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol t)
 '(package-selected-packages
   (quote
    (async dap-mode bui tree-mode yasnippet-snippets yapfify yaml-mode xterm-color web-mode web-beautify vterm vimrc-mode treemacs-magit toml-mode terminal-here tagedit systemd sql-indent smeargle slim-mode shell-pop seeing-is-believing scss-mode sass-mode rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocopfmt rubocop rspec-mode robe rbenv ranger rake racer pytest pyenv-mode py-isort pug-mode prettier-js pippel pipenv pyvenv pip-requirements phpunit phpcbf php-extras php-auto-yasnippets ox-gfm orgit org-re-reveal org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download org-cliplink org-brain noflet nodejs-repl nginx-mode mvn multi-term monokai-theme mmm-mode minitest meghanada maven-test-mode markdown-toc magit-svn magit-gitflow lsp-ui lsp-treemacs lsp-python-ms lsp-java lsp-haskell livid-mode skewer-mode live-py-mode kubernetes-evil kubernetes magit-popup json-navigator hierarchy js2-refactor multiple-cursors js2-mode js-doc jinja2-mode intero insert-shebang importmagic epc ctable concurrent deferred impatient-mode simple-httpd htmlize hlint-refactor hindent helm-pydoc helm-org-rifle helm-org helm-lsp helm-hoogle helm-gitignore helm-git-grep helm-css-scss helm-company helm-c-yasnippet haskell-snippets haml-mode groovy-mode groovy-imports gradle-mode godoctor go-tag go-rename go-impl go-guru go-gen-test go-fill-struct go-eldoc gnuplot gitignore-templates gitignore-mode github-search github-clone gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gist gh marshal logito pcache gh-md geben fuzzy forge ghub closql emacsql-sqlite emacsql treepy flycheck-rust flycheck-pos-tip flycheck-haskell flycheck-bashate fish-mode fish-completion evil-org evil-magit magit git-commit with-editor eshell-z eshell-prompt-extras esh-help ensime sbt-mode scala-mode emmet-mode drupal-mode dockerfile-mode docker transient tablist json-mode docker-tramp json-snatcher json-reformat diff-hl dante lcr dactyl-mode cython-mode csv-mode company-web web-completion-data company-terraform terraform-mode hcl-mode company-tern tern company-statistics company-shell company-quickhelp pos-tip company-phpactor phpactor composer php-runtime company-php ac-php-core xcscope php-mode company-lua lua-mode company-lsp lsp-mode dash-functional company-go go-mode company-ghci company-ghc ghc haskell-mode company-cabal company-ansible company-anaconda company cmm-mode chruby cargo markdown-mode rust-mode bundler inf-ruby browse-at-remote blacken bash-completion auto-yasnippet yasnippet attrap ansible-doc ansible anaconda-mode pythonic ac-ispell auto-complete ws-butler writeroom-mode winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package treemacs-projectile treemacs-evil toc-org symon symbol-overlay string-inflection spaceline-all-the-icons restart-emacs request rainbow-delimiters popwin persp-mode pcre2el password-generator paradox overseer org-plus-contrib org-bullets open-junk-file nameless move-text macrostep lorem-ipsum link-hint indent-guide hybrid-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-mode-manager helm-make helm-ls-git helm-flx helm-descbinds helm-ag google-translate golden-ratio font-lock+ flycheck-package flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu elisp-slime-nav editorconfig dumb-jump dotenv-mode doom-modeline diminish devdocs define-word column-enforce-mode clean-aindent-mode centered-cursor-mode auto-highlight-symbol auto-compile aggressive-indent ace-link ace-jump-helm-line))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
).
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(monokai
                         spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Inconsolata for Powerline"
                               :size 36
                               :weight normal
                               :width normal
                               :powerline-scale 1.0)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text t
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 5
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'original
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state t
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 100
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 50
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols nil
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'all
   dotspacemacs-mode-line-theme 'spacemacs
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (when (> (length command-line-args) 1)
    (setq inhibit-splash-screen t)
    (setq inhibit-startup-message t)
    (setq initial-scratch-message nil)
  )
  (setq-default indent-tabs-mode nil)
  (setenv "SSH_AUTH_SOCK" (shell-command-to-string "gpgconf --list-dirs agent-ssh-socket"))
  (setenv "GPG_AGENT_INFO" (shell-command-to-string "gpgconf --list-dirs agent-socket"))
  (add-hook 'after-init-hook 'global-company-mode)
  ;(require 'window-purpose)
)

(defconst haskell-unicode-conversions
  '(("[ (]\\(->\\)[) \n]"      . ?→)
    ("[ (]\\(/=\\)[) ]"        . ?≠)
    ("[ (]\\(<=\\)[) ]"        . ?≤)
    ("[ (]\\(>=\\)[) ]"        . ?≥)
    ;("[ (]\\(=\\)[) ]"         . ?≡)
    ("[ (]\\(\\.\\)[) ]"       . ?∘)
    ("[ (]\\(&&\\)[) ]"        . ?∧)
    ("[ (]\\(||\\)[) ]"        . ?∨)
    ("[ (]\\(\\*\\)[) ]"       . ?×)
    ("[ (]\\(\\+\\+\\)[) ]"    . ?⧺)
    ("[ (]\\(\\+\\+\\+\\)[) ]" . ?⧻)
    ("[ (]\\(|||\\)[) ]"       . ?⫴)
    ("[ (]\\(!!\\)[) ]"        . ?‼)
    ("[ (]\\(\\\\\\)[(_a-z]"   . ?λ)
    (" \\(<-\\)[ \n]"          . ?←)
    (" \\(-<\\) "              . ?↢)
    (" \\(>-\\) "              . ?↣)
    (" \\(=>\\)[ \n]"          . ?⇒)
    (" \\(>=>\\) "             . ?↣)
    (" \\(<=<\\) "             . ?↢)
    ("[ (]\\(>>=\\)[ )]"       . ?↦)
    ("[ (]\\(=<<\\)[ )]"       . ?↤)
    ("[ (]\\(>>\\)[ )]"        . ?≫)
    ("[ (]\\(<<\\)[ )]"        . ?≪)
    (" \\(:=\\) "              . ?≔)
    (" \\(=:\\) "              . ?≕)
    (" \\(=def\\) "            . ?≝)
    (" \\(<*>\\) "             . ?⊛)
    (" \\(=\\?\\) "            . ?≟)
    (" \\(\\.\\.\\.\\) "       . ?…)
;    (" \\([|\\) "              . ?\〚)
;    (" \\(|]\\) "              . ?\〛)
    ("[ (]\\(\\<not\\>\\)[ )]" . ?¬)
    ("[ (]\\(<<<\\)[ )]"       . ?⋘)
    ("[ (]\\(>>>\\)[ )]"       . ?⋙)
    (" \\(::\\) "              . ?⦂)
    ("\\(`union`\\)"           . ?⋃)
    ("\\(`intersect`\\)"       . ?⋂)
    ("\\(`isSubsetOf`\\)"      . ?⊆)
    ("\\(`isProperSubsetOf`\\)" . ?⊂)
    ("\\(`elem`\\)"            . ?∈)
    ("\\(`notElem`\\)"         . ?∉)
    ("\\<\\(`mempty'\\)\\>"    . ?∅)
    ("[ (]\\(<>\\)[) ]"        . ?⨁)
    ("\\[\\]"                  . ?ε)
    ;; ("\\(\\<True\\>\\)"       . "𝗧𝗿𝘂𝗲")
    ;; ("\\(\\<False\\>\\)"      . "𝗙𝗮𝗹𝘀𝗲")
    ("\\(\\<undefined\\>\\)"   . ?⊥)
    ("\\<\\(forall \\)\\>"     . ?∀)
    ("\\<\\(exists \\)\\>"     . ?∃)
    ))

(defun haskell-setup-unicode-conversions ()
  (if (and nil (featurep 'proof-site))
      (use-package haskell-unicode-tokens
        :load-path "site-lisp/proofgeneral/generic/"
        :config
        (hook-into-modes #'(lambda ()
                             (ignore-errors
                               (unicode-tokens-mode 1))
                             (unicode-tokens-use-shortcuts 0))
                         '(haskell-mode-hook
                           literate-haskell-mode-hook)))
    (mapc (lambda (mode)
            (font-lock-add-keywords
             mode
             (append (mapcar (lambda (chars)
                               `(,(car chars)
                                 ,(if (characterp (cdr chars))
                                      `(0 (ignore
                                           (compose-region (match-beginning 1)
                                                           (match-end 1)
                                                           ,(cdr chars))))
                                    `(0 ,(cdr chars)))))
                             haskell-unicode-conversions)
                     '(("(\\|)" . 'esk-paren-face)
                       ;; ("\\<[a-zA-Z]+\\([0-9]\\)\\>"
                       ;;  1 haskell-subscript)
                       ))))
          '(haskell-mode literate-haskell-mode))))

(defface esk-paren-face
  '((((class color) (background dark))
     (:foreground "grey50"))
    (((class color) (background light))
     (:foreground "grey55")))
  "Face used to dim parentheses."
  :group 'starter-kit-faces)

(defun pcomplete/e ()
  (let ((prec (pcomplete-arg 'last -1)))
    (cond ((string= "e" prec)
           (while (pcomplete-here*
                   (funcall pcomplete-command-completion-function)
                   (pcomplete-arg 'last) t))))))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (setq warning-minimum-level ':error)
  (global-evil-surround-mode 1)
  (defalias #'forward-evil-word #'forward-evil-symbol)
  ;; make evil-search-word look for symbol rather than word boundaries
  (setq-default evil-symbol-word-search t)

  (helm-flx-mode +1)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Magit - forge configuration
  ;;
  ;; Set the files that are searched for writing tokens
  ;; by default ~/.authinfo will be used
  ;; and write a token in unencrypted format
  (setq auth-sources '("~/.authinfo.gpg"))
  ;;
  ;; End of Magit - forge configuration
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ; lsp stuff
  (use-package lsp
    :defer t
    :config
    (lsp-register-custom-settings
     '(("gopls.completeUnimported" t t)
       ("yaml.validate" t t)
       ("yaml.hover" t t)
       ("yaml.completion" t t)
       ("yaml.schemaStore.enable" t t)))
    )
  (use-package lsp-mode
    :commands lsp
    :init (setq lsp-prefer-capf t)
    :config
    (require 'lsp-clients)
    (lsp-treemacs-sync-mode 1)
    :hook
    (sh-mode . lsp)
    )

  ; rust stuff
  (use-package rustic
    :defer t
    :init
    (setq rustic-lsp-server 'rust-analyzer)
    (setq rustic-lsp-client 'lsp-mode)
    (setq rustic-format-trigger 'on-save)
    (setq rust-format-on-save t)
    :config
    :hook (lsp-rust-analyzer-inlay-hints-mode (rustic-mode . rust-mode)))

  ; groovy stuff
  (use-package groovy-mode
    :defer t
    :config (message "Loaded groovy mode"))
  (add-to-list 'auto-mode-alist '("Jenkinsfile$" . groovy-mode))
  (push "~/.emacs.d/private/" load-path)

  ; haskell stuff
  (use-package lsp-haskell
    :defer t
    :config (message "Loaded lsp-haskell"))
  (use-package haskell-mode
    :defer t
    :init
    (setq lsp-haskell-process-path-hie "/usr/bin/hie-wrapper")
    :hook (lsp turn-on-haskell-indentation haskell-setup-unicode-conversions))

  (add-to-list 'auto-mode-alist '("\\.yaml\\.j2\\'" . yaml-mode))

  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0 ;; default is 0.2
        gc-cons-threshold 200000000
        read-process-output-max (* 1024 1024))

  (defun ex-save-kill-buffer-and-close ()
    (interactive)
    (save-buffer)
    (kill-this-buffer)
    )
  (evil-ex-define-cmd "q" 'kill-this-buffer)
  (evil-ex-define-cmd "wq" 'ex-save-kill-buffer-and-close )
  (evil-ex-define-cmd "x" 'ex-save-kill-buffer-and-close )
  (evil-ex-define-cmd "e" 'find-file )

  (spacemacs/set-leader-keys-for-major-mode 'org
    "i h" (lambda ()
            (interactive)
            (evil-org-org-insert-heading-respect-content-below)
            (evil-insert)))
  (use-package evil-org
    :defer t
    :after org
    :init
    (setq org-want-todo-bindings t)
    (setq org-todo-keywords '((type "TODO(t)" "WORKING(w!)" "BLOCKED(b@/!)" "STALLED(s!)" "|" "DONE(d!)" "DEFERRED(f!)" "CANCELED(c)")))
    :config
    (evil-org-set-key-theme '(textobjects insert navigation additional shift todo heading))
    :hook
    (org-mode . visual-line-mode)
    )

  (use-package org-babel
    :defer t
    :after org
    :config
    (org-babel-do-load-languages org-babel-load-languages ((dot . t)))
    )

  (require 'cl-lib)
  (require 'company)
  (require 'dash)
  (require 'f)
  (require 'projectile)
  (setq eshell-history-size 9999999)


  (defun pinentry-emacs (desc prompt ok error)
    (let ((str (read-passwd (concat (replace-regexp-in-string "%22" "\"" (replace-regexp-in-string "%0A" "\n" desc)) prompt ": "))))
      str))

  (let ((tty (shell-command-to-string "tty")))
    (setenv "GPG_TTY" tty)
    (setenv "SSH_AUTH_SOCK" "/run/user/1000/gnupg/S.gpg-agent.ssh"))

  (defun tramp-aware-woman (man-page-path)
    (interactive)
    (let ((dir (eshell/pwd)))
      (woman-find-file
       (if (file-remote-p dir)
           (let ((vec (tramp-dissect-file-name dir)))
             (tramp-make-tramp-file-name
              (tramp-file-name-method vec)
              (tramp-file-name-user vec)
              (tramp-file-name-host vec)
              man-page-path))
         man-page-path))))

  (use-package kubernetes
    :config
    (setq kubernetes-poll-frequency 20)
    (setq kubernetes-redraw-frequency 20))

  (use-package helm-tramp)
  (use-package aweshell
    :init
    (require 'em-term)
    (require 'vterm)
    (require 'em-smart)

    (defun pcmpl-git-commands ()
      "Return the most common git commands by parsing the git output."
      (with-temp-buffer
        (call-process-shell-command "git" nil (current-buffer) nil "help" "--all")
        (goto-char 0)
        (search-forward "Main Porcelain Commands")
        (let (commands)
          (while (re-search-forward
                  "^[[:blank:]]+\\([[:word:]-.]+\\)[[:blank:]]*\\([[:word:]-.]+\\)?"
                  nil t)
            (push (match-string 1) commands)
            (when (match-string 2)
              (push (match-string 2) commands)))
          (sort commands #'string<))))

    (defconst pcmpl-git-commands (pcmpl-git-commands)
      "List of `git' commands.")

    (defvar pcmpl-git-ref-list-cmd "git for-each-ref refs/ --format='%(refname)'"
      "The `git' command to run to get a list of refs.")

    (defun pcmpl-git-get-refs (type)
      "Return a list of `git' refs filtered by TYPE."
      (with-temp-buffer
        (insert (shell-command-to-string pcmpl-git-ref-list-cmd))
        (goto-char (point-min))
        (let (refs)
          (while (re-search-forward (concat "^refs/" type "/\\(.+\\)$") nil t)
            (push (match-string 1) refs))
          (nreverse refs))))

    (defun pcmpl-git-remotes ()
      "Return a list of remote repositories."
      (split-string (shell-command-to-string "git remote")))

    (defun pcomplete/git ()
      "Completion for `git'."
      ;; Completion for the command argument.
      (pcomplete-here* pcmpl-git-commands)
      (cond
       ((pcomplete-match "help" 1)
        (pcomplete-here* pcmpl-git-commands))
       ((pcomplete-match (regexp-opt '("pull" "push")) 1)
        (pcomplete-here (pcmpl-git-remotes)))
       ;; provide branch completion for the command `checkout'.
       ((pcomplete-match "checkout" 1)
        (pcomplete-here* (append (pcmpl-git-get-refs "heads")
                                 (pcmpl-git-get-refs "tags"))))
       (t
        (while (pcomplete-here (pcomplete-entries))))))

    (defun vterm-exec (&rest args)
      (interactive)
      (evil-insert-state nil)
      (vterm-send-string (string-join args " "))
      (vterm-send-string "; exit")
      (vterm-send-return)
      )
    (defun eshell-exec-visual-named (buf-name &rest args)
      "Run the specified PROGRAM in a terminal emulation buffer.
      ARGS are passed to the program.  At the moment, no piping of input is
      allowed."
      (let* (eshell-interpreter-alist
             (original-args args)
             (current-dir (pwd))
             (interp (eshell-find-interpreter (car args) (cdr args)))
             (in-ssh-tramp (and (tramp-tramp-file-p default-directory)
                                (equal (tramp-file-name-method
                                        (tramp-dissect-file-name default-directory))
                                       "ssh")))
             (program (if in-ssh-tramp
                          "ssh"
                        (car interp)))
             (args (if in-ssh-tramp
                       (let ((dir-name (tramp-dissect-file-name default-directory)))
                         (eshell-flatten-list
                          (list
                           "-t"
                           (tramp-file-name-host dir-name)
                           (format
                            "\"export TERM=xterm-256color; cd %s; exec %s\""
                            (tramp-file-name-localname dir-name)
                            (string-join
                             (append
                              (list (tramp-file-name-localname (tramp-dissect-file-name (car interp))))
                              (cdr args))
                             " ")))))
                     (eshell-flatten-list
                      (eshell-stringify-list (append (cdr interp)
                                                     (cdr args))))))
             (term-buf
              (generate-new-buffer
               (concat "*"
                       (if in-ssh-tramp
                           (format "%s %s" default-directory (string-join original-args " "))
                         (file-name-nondirectory program))
                       "*")))
             (eshell-buf (current-buffer)))
        (save-current-buffer
          (switch-to-buffer term-buf)
          (rename-buffer buf-name)
          (vterm-mode)
          (set (make-local-variable 'term-term-name) eshell-term-name)
          (make-local-variable 'eshell-parent-buffer)
          (setq eshell-parent-buffer eshell-buf)
                                        ;(term-exec term-buf program program nil args)
          (apply 'vterm-exec program args)
          (let ((proc (get-buffer-process term-buf)))
            (if (and proc (eq 'run (process-status proc)))
                (set-process-sentinel proc 'eshell-term-sentinel)
              (error "Failed to invoke visual command")))
          (term-char-mode)
          (if eshell-escape-control-x
              (term-set-escape-char ?\C-x))))
      nil)

    (defun eshell/visual (&rest args)
      "Create a terminal buffer for a single visual command in Eshell."
      (if (equal "sudo" (car args))
          (apply 'eshell-exec-visual-named (cadr args) args)
        (apply 'eshell-exec-visual-named (car args) args))
      )

    (defun eshell-exec-visual (&rest args)
      (apply 'eshell/visual args))

    ;; cache file-name forever
    (setq remote-file-name-inhibit-cache nil)

    ;; make sure vc stuff is not making tramp slower
    (setq vc-ignore-dir-regexp
          (format "%s\\|%s"
                  vc-ignore-dir-regexp
                  tramp-file-name-regexp))

    (setq tramp-verbose 1)

    ;; projectile has the fun side-effect of wanting to calculate the
    ;; project name, which makes tramp oh-so-much-slower.
    (setq projectile-mode-line "Projectile")

    :config
    (with-eval-after-load 'tramp
      (eval-when-compile (require 'tramp))
      ;; Define a rsyncx method analogous to scpx
      (add-to-list 'tramp-remote-path 'tramp-own-remote-path)
      (add-to-list 'tramp-methods
                   `("rsyncx"
                     (tramp-login-program "ssh")
                     (tramp-login-args (("-l" "%u") ("-p" "%p") ("%c") ("-e" "none")
                                        ("-t" "-t") ("%h") ("/bin/bash")))
                     (tramp-async-args (("-q")))
                     (tramp-remote-shell "/bin/bash")
                     (tramp-remote-shell-login ("-l"))
                     (tramp-remote-shell-args ("-c"))
                     (tramp-copy-program
                      ,(if (and (eq system-type 'darwin)
                                (file-executable-p "/usr/bin/rsync"))
                           "/usr/bin/rsync"
                         "rsync"))
                     (tramp-copy-args (("-t" "%k") ("-p") ("-r") ("-s") ("-c")))
                     (tramp-copy-env (("RSYNC_RSH")
                                      ("ssh" "%c")))
                     (tramp-copy-keep-date t)
                     (tramp-copy-keep-tmpfile t)
                     (tramp-copy-recursive t)))
      )



    (defun eshell/git (command &rest args)
      (pcase command
        ("pr" (apply #'algernon/git-pr args))
        ("log" (apply #'algernon/git-log args))
        ("status" (progn
                    (magit-status)
                    (eshell/echo)))
        ("grep" (apply #'algernon/git-grep args))
        (_ (let ((command (s-join " " (append (list "git" command) args))))
             (message command)
             (shell-command-to-string command)))))

    ;; =================================
    ;; automatically request root access
    ;; =================================

    (use-package su
      :init
      (eval-when-compile
        (with-demoted-errors "Load error: %s"
          (require 'el-patch)))

      (el-patch-feature su)

      (el-patch-defcustom su-auto-make-directory t
                          "Automatically become other users to create directories"
                          :type 'boolean
                          :group 'su)

      (el-patch-defcustom su-auto-write-file t
                          "Automatically become other users to write files"
                          :type 'boolean
                          :group 'su)

      (el-patch-defcustom su-auto-read-file t
                          "Automatically become other users to read files"
                          :type 'boolean
                          :group 'su)

      (el-patch-defcustom su-enable-helm-integration t
                          "Enable integration with helm"
                          :type 'boolean
                          :group 'su)

      (el-patch-defcustom su-enable-semantic-integration t
                          "Enable integration with semantic"
                          :type 'boolean
                          :group 'su)

      (autoload #'su--nadvice-make-directory-auto-root "su")
      (autoload #'su--nadvice-find-file-noselect "su")
      (autoload #'su--nadvice-supress-find-file-hook "su")
      (autoload #'su--nadvice-find-file-noselect-1 "su")

      (el-patch-define-minor-mode su-mode
                                  "Automatically read and write files as users"
                                  :init-value nil
                                  :group 'su
                                  :global t
                                  (if su-mode
                                      (progn
                                        (when su-auto-make-directory
                                          (advice-add 'basic-save-buffer :around
                                                      #'su--nadvice-make-directory-auto-root)

                                          (when su-enable-helm-integration
                                            (with-eval-after-load 'helm-files
                                              (advice-add 'helm-find-file-or-marked :around
                                                          #'su--nadvice-make-directory-auto-root))))

                                        (when su-auto-write-file
                                          (add-hook 'find-file-hook #'su--edit-file-as-root-maybe)
                                          (advice-add 'find-file-noselect :around
                                                      #'su--nadvice-find-file-noselect)

                                          (when su-enable-semantic-integration
                                            (with-eval-after-load 'semantic/fw
                                              (advice-add 'semantic-find-file-noselect :around
                                                          #'su--nadvice-supress-find-file-hook))))

                                        (when su-auto-read-file
                                          (advice-add 'find-file-noselect-1 :around
                                                      #'su--nadvice-find-file-noselect-1)))

                                    (remove-hook 'find-file-hook #'su--edit-file-as-root-maybe)
                                    (advice-remove 'basic-save-buffer
                                                   #'su--nadvice-make-directory-auto-root)
                                    (advice-remove 'helm-find-file-or-marked
                                                   #'su--nadvice-make-directory-auto-root)
                                    (advice-remove 'find-file-noselect
                                                   #'su--nadvice-find-file-noselect)
                                    (advice-remove 'semantic-find-file-noselect
                                                   #'su--nadvice-supress-find-file-hook)
                                    (advice-remove 'find-file-noselect-1
                                                   #'su--nadvice-find-file-noselect-1)))

      (su-mode +1)

      :config
      (eval-when-compile
        (with-demoted-errors "Load error: %s"
          (require 'el-patch)))


      (defun nadvice/su-disable-maybe-setup (flag)
        (if (and (not flag) (bound-and-true-p su-auto-save-mode))
            (su-auto-save-mode -1)))

      (el-patch-feature su)
      (el-patch-define-minor-mode su-auto-save-mode
                                  "Automatically save buffer as root"
                                  :lighter su-auto-save-mode-lighter
                                  (if su-auto-save-mode
                                      ;; Ensure that su-auto-save-mode is visible by moving it to the
                                      ;; beginning of the minor mode list
                                      (progn
                                        (el-patch-add
                                         (advice-add 'set-buffer-modified-p :before
                                                     #'nadvice/su-disable-maybe-setup))
                                        (let ((su-auto-save-mode-alist-entry
                                               (assoc 'su-auto-save-mode minor-mode-alist)))
                                          (setq minor-mode-alist
                                                (delete su-auto-save-mode-alist-entry minor-mode-alist))
                                          (push su-auto-save-mode-alist-entry minor-mode-alist))
                                        (add-hook 'before-save-hook #'su--before-save-hook nil t))

                                    (el-patch-add
                                     (advice-remove 'set-buffer-modified-p
                                                    #'nadvice/su-disable-maybe-setup))
                                    (remove-hook 'before-save-hook #'su--before-save-hook t))))

    (su-mode 1)
    (su-auto-save-mode 1)
    )
  (add-hook 'eshell-mode-hook
            (lambda ()
              (setenv "TERM" "xterm-256color")
              (setq xterm-color-preserve-properties t)
              (add-to-list 'eshell-preoutput-filter-functions 'xterm-color-filter)
              (setq eshell-output-filter-functions
                    (remove 'eshell-handle-ansi-color eshell-output-filter-functions))
              (setq with-editor-emacsclient-executable "/usr/bin/emacsclient")
              (when (and (executable-find "fish")
                         (require 'fish-completion nil t))
                (global-fish-completion-mode)
                (setq fish-completion-fallback-on-bash-p t))

              (add-to-list 'eshell-modules-list 'eshell-rebind)
              (add-to-list 'eshell-modules-list 'eshell-tramp)
              (setq eshell-cmpl-dir-ignore "\\`\\(CVS\\)/\\'")
              (setq su-mode t)
              (setq su-auto-save-mode t)
              (setq su-auto-save-mode-lighter nil)
              (setq eshell-where-to-jump 'begin)
              (setq eshell-review-quick-commands nil)
              (setq eshell-smart-space-goes-to-end t)

              (add-to-list 'eshell-visual-commands "htop")
              (add-to-list 'eshell-visual-commands "openfortivpn")
              (setq eshell-exit-hook nil)
              (setq eshell-destroy-buffer-when-process-dies t)
              )
            )

  (eshell-git-prompt-use-theme 'powerline)
  (add-hook 'shell-mode-hook  'with-editor-export-editor)
  (add-hook 'term-exec-hook   'with-editor-export-editor)
  (add-hook 'eshell-mode-hook 'su-mode)
  (add-hook 'eshell-mode-hook 'su-auto-save-mode)
  (add-hook 'eshell-mode-hook 'with-editor-export-git-editor)
  (add-hook 'eshell-mode-hook 'with-editor-export-editor)
  (remove-hook 'before-save-hook #'su--before-save-hook t)
  (add-hook 'eshell-mode-hook
            (lambda ()
              (setq company-backends '(company-projectile-cd company-capf aweshell-autosuggest))))

  (global-git-commit-mode t)

  (use-package org-preview-html)
  (use-package org-make-toc)

  (helm-flx-mode 1)
  (setq helm-flx-for-helm-find-files t ;; t by default
        helm-flx-for-helm-locate t) ;; nil by default

  (custom-set-variables
   '(helm-ag-base-command "rg --vimgrep --no-heading --smart-case --color always -z"))
  (require 'rg)
  (evil-leader/set-key "/" #'spacemacs/helm-project-do-rg-region-or-symbol)
  (rg-enable-menu)

  (use-package kubernetes-tramp :defer t)
  (setq helm-display-function #'pop-to-buffer) ; make helm play nice
  (setq helm-show-completion-display-function #'pop-to-buffer) ; make helm play nice
;  (setq shackle-rules '(
;                        (".*HELM Eshell History" :popup nil :frame nil :same t :align 'below :size 0.4)
;                        (".*HELM Pcomplete" :popup nil :frame nil :same t :align 'below :size 0.4)
;                        (".*helm.*" :popup nil :frame nil :regex t :same t :align 'below :size 0.4)
;                        ))
;  (shackle-mode)
  (setq x-wait-for-event-timeout nil)
  )



(defvar-local company-projectile-cd-prefix "cd ")

(defun company-projectile-cd (command &optional arg &rest ignored)
  "Company shell completion for any projectile path."
  (interactive (list 'interactive))
  (case command
    (interactive (company-begin-backend 'company-projectile-cd))
    (prefix
     (company-grab-symbol-cons company-projectile-cd-prefix
                               (length company-projectile-cd-prefix)))
    (candidates
     (company-projectile-cd--candidates
      (company-grab-symbol-cons company-projectile-cd-prefix
                                (length company-projectile-cd-prefix))))
    (post-completion
     (company-projectile-cd--expand-inserted-path arg))))

(defun company-projectile-cd--candidates (input)
  "Return candidates for given INPUT."
  (company-projectile-cd--reset-root)
  (when (consp input)
    (let ((search-term (substring-no-properties
                        (car input) 0 (length (car input))))
          (prefix-found (cdr input)))
      (when prefix-found
        (if (projectile-project-p)
            (company-projectile-cd--projectile search-term)
          (company-projectile-cd--find-fallback search-term))))))

(defun company-projectile-cd--projectile (search-term)
  (-filter (lambda (path)
             (string-match-p (regexp-quote
                              search-term)
                             path))
           (-snoc
            (projectile-current-project-dirs)
            ;; Throw project root in there also.
            (projectile-project-root))))

(defun company-projectile-cd--find-fallback (search-term)
  (ignore-errors
    (-map (lambda (path)
            (string-remove-prefix "./" path))
          (apply #'process-lines
                 (list "find" "." "-type" "d"  "-maxdepth" "2" "-iname"
                       (format "\*%s\*" search-term))))))

(defun company-projectile-cd--expand-inserted-path (path)
  "Replace relative PATH insertion with its absolute equivalent if needed."
  (unless (f-exists-p path)
    (delete-region (point) (- (point) (length path)))
    (insert (concat (projectile-project-root) path))))

(defun company-projectile-cd--reset-root ()
  "Reset project root. Useful when cd'ing in and out of projects."
  (projectile-reset-cached-project-root)
  (when (projectile-project-p)
    (projectile-project-root)))

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aweshell-complete-selection-key "C-SPC")
 '(evil-want-Y-yank-to-eol t)
 '(helm-ag-base-command "rg --vimgrep --no-heading --smart-case --color always -z")
 '(lsp-yaml-schemas
   '#s(hash-table size 65 test eql rehash-size 1.5 rehash-threshold 0.8125 data (kubernetes "/*")))
 '(package-selected-packages
   '(gh marshal logito pcache ghub closql emacsql-sqlite emacsql treepy rustic eglot exec-path-from-shell graphviz-dot-mode helm-rg es-mode spark ace-window shackle anaconda-mode helm lsp-mode org-super-agenda rust-mode evil undo-tree rg wgrep kubernetes-tramp deadgrep el-patch fill-column-indicator yasnippet-snippets yapfify yaml-mode xterm-color ws-butler writeroom-mode winum which-key web-mode web-beautify vterm volatile-highlights virtualenvwrapper vimrc-mode vi-tilde-fringe uuidgen use-package treemacs-projectile treemacs-persp treemacs-magit treemacs-evil toml-mode toc-org terminal-here tagedit systemd symon symbol-overlay string-inflection sql-indent spaceline-all-the-icons smeargle slim-mode shell-pop seeing-is-believing scss-mode sass-mode rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocopfmt rubocop rspec-mode robe restart-emacs rbenv ranger rake rainbow-delimiters racer pytest pyenv-mode py-isort pug-mode prettier-js popwin pippel pipenv pip-requirements phpunit phpcbf php-extras php-auto-yasnippets password-generator paradox pandoc-mode ox-pandoc ox-gfm overseer orgit org-re-reveal org-projectile org-preview-html org-present org-pomodoro org-mime org-make-toc org-download org-cliplink org-bullets org-brain open-junk-file noflet nodejs-repl nginx-mode nameless mvn multi-term multi-eshell move-text monokai-theme mmm-mode minitest meghanada maven-test-mode markdown-toc magit-svn magit-section magit-gitflow macrostep lsp-ui lsp-python-ms lsp-java lsp-haskell lorem-ipsum livid-mode live-py-mode link-hint kubernetes-evil json-navigator js2-refactor js-doc jinja2-mode intero insert-shebang indent-guide importmagic impatient-mode hybrid-mode hungry-delete hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-tramp helm-themes helm-system-packages helm-swoop helm-pydoc helm-purpose helm-projectile helm-org-rifle helm-org helm-mode-manager helm-make helm-lsp helm-ls-git helm-hoogle helm-gitignore helm-git-grep helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haskell-unicode-tokens haskell-snippets groovy-mode groovy-imports gradle-mode google-translate golden-ratio godoctor go-tag go-rename go-impl go-guru go-gen-test go-fill-struct go-eldoc gnuplot gitignore-templates github-search github-clone gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gist gh-md geben fuzzy forge font-lock+ flycheck-rust flycheck-pos-tip flycheck-package flycheck-haskell flycheck-elsa flycheck-bashate flx-ido fish-mode fish-completion fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-org evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras eshell-git-prompt esh-help ensime emmet-mode elisp-slime-nav editorconfig dumb-jump drupal-mode dotenv-mode doom-modeline dockerfile-mode docker diminish devdocs define-word dap-mode dante dactyl-mode cython-mode csv-mode company-web company-terraform company-tern company-statistics company-shell company-quickhelp company-phpactor company-php company-lua company-lsp company-go company-ghci company-ghc company-cabal company-ansible company-anaconda column-enforce-mode cmm-mode clean-aindent-mode chruby centered-cursor-mode cargo bundler browse-at-remote blacken bash-completion aweshell auto-yasnippet auto-sudoedit auto-highlight-symbol auto-compile attrap ansible-doc ansible airline-themes aggressive-indent ace-link ace-jump-helm-line ac-ispell))
 '(safe-local-variable-values
   '((cargo-process--command-doc . "+nightly doc --open")
     (cargo-process--command-run . "+nightly run")
     (cargo-process--command-test . "+nightly test")
     (cargo-process--command-build . "+nightly build")
     (javascript-backend . tide)
     (javascript-backend . tern)
     (javascript-backend . lsp)
     (go-backend . go-mode)
     (go-backend . lsp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
