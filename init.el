;; -*- mode: emacs-lisp; lexical-binding: t -*-
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
   dotspacemacs-configuration-layer-path '("~/.emacs.d/private/layers")

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; Spacemacs
     spacemacs-evil
     spacemacs-project
     ;; Chat
     ;; Checkers
     syntax-checking
     ;; Completion
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior nil
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip t)
     helm
     ;; Emacs
     (org :variables
          org-want-todo-bindings t
          org-enable-github-support t
          org-enable-reveal-js-support t
          org-enable-sticky-header t)
     ;; E-mail
     ;; Framework
     react
     ruby-on-rails
     (vue :variables
          vue-backend 'lsp)
     ;; Filetree
     (treemacs :variables
               treemacs-lock-width t)
     ;; Fun
     ;; International support
     japanese
     ;; Programming and markup languages
     (c-c++ :variables
            c-c++-backend 'lsp-clangd
            c-c++-enable-clang-format-on-save t
            c++-enable-organize-includes-on-save t
            c-c++-enable-google-style t
            c-c++-enable-google-newline t
            c-c++-enable-rtags-completion nil
            c-c++-adopt-subprojects t)
     (crystal :variables
              crystal-enable-auto-format t)
     csv
     emacs-lisp
     (ess :variables ess-disable-underscore-assign t)
     (go :variables
         go-backend 'lsp
         go-format-before-save t
         go-tab-width 4)
     (haskell :variables
              haskell-completion-backend 'intero
              haskell-enable-hindent t)
     (html :variables
           less-enable-lsp t
           scss-enable-lsp t
           web-fmt-tool 'prettier)
     (java :variables java-backend 'lsp)
     (javascript :variables
                 javascript-fmt-tool 'prettier
                 javascript-backend 'lsp
                 javascript-repl 'nodejs
                 javascript-lsp-linter nil)
     (json :variables json-fmt-tool 'prettier)
     latex
     lua
     major-modes
     (markdown :variables markdown-live-preview-engine 'vmd)
     perl5
     perl6
     php
     plantuml
     (python :variables
             python-backend 'lsp
             python-formatter 'black)
     (ruby :variables
           ruby-enable-enh-ruby-mode t
           ruby-version-manager nil
           ruby-backend 'lsp)
     (rust :variables
           rust-backend 'lsp
           rust-format-on-save t)
     (scala :variables
            scala-enable-eldoc t
            scala-auto-insert-asterisk-in-comments t
            scala-backend 'scala-metals
            scala-auto-start-backend t)
     (shell-scripts :variables
                    shell-scripts-backend 'lsp)
     (solidity :variables
               solidity-flycheck-solc-checker-active t
               solidity-flycheck-solium-checker-active t)
     sql
     (typescript :variables
                 typescript-fmt-tool 'prettier
                 typescript-backend 'lsp
                 typescript-linter 'eslint
                 typescript-lsp-linter nil)
     yaml
     ;; Readers
     (deft :variables
       deft-directory "~/Dropbox/deft")
     elfeed
     ;; Music
     ;; Operating systems
     osx
     ;; Pair programming
     floobits
     ;; Source control
     (git :variables git-magit-status-fullscreen t)
     github
     (version-control :variables
                      version-control-global-margin t
                      version-control-diff-tool (if (display-graphic-p)
                                                    'diff-hl
                                                  'git-gutter+)
                      version-control-diff-side 'right)
     ;; Themes
     colors
     themes-megapack
     ;; Tools
     ansible
     (cmake :variables cmake-enable-cmake-ide-support t)
     dap
     (dash :variables
           dash-autoload-common-docsets nil
           helm-dash-docset-newpath (case system-type
                                      ('darwin "~/Library/Application Support/Dash/DocSets")
                                      ('gnu/linux "~/.local/share/Zeal/Zeal/docsets")
                                      (otherwise nil)))
     (docker :variables
             docker-dockerfile-backend 'lsp)
     imenu-list
     ipython-notebook
     (lsp :variables
          lsp-ui-remap-xref-keybindings t
          lsp-navigation 'peek
          lsp-prefer-flymake nil
          lsp-ui-doc-enable nil
          lsp-ui-sideline-show-diagnostics nil)
     nginx
     (node :variables node-add-modules-path t)
     pandoc
     prettier
     ;; (ranger :variables
     ;;   ranger-show-hidden t)
     (restclient :variables restclient-use-org t)
     (shell :variables
            shell-default-shell 'vterm
            shell-default-height 30
            shell-default-position 'bottom)
     systemd
     vagrant
     (xclipboard :variables xclipboard-enable-cliphist t)
     ;; Vim
     evil-commentary
     (evil-snipe :variables
                 evil-snipe-enable-alternate-f-and-t-behaviors t
                 evil-snipe-repeat-scope 'line)
     ;; Misc
     (multiple-cursors :variables multiple-cursors-backend 'evil-mc))

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages
   '(
     flycheck-popup-tip
     (helm-gitignore :location local)
     (rails-snippets :location local)
     (react-snippets :location local)
     (redux-snippets :location local)
     (jest-snippets :location local)
     (competitive-programming-snippets :location local)
     (emacs-atcoder-tools :location local)
     )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(avy-migemo
                                    company-plsense
                                    ddskk
                                    migemo
                                    pangu-spacing
                                    yatemplate)

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(200000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'hybrid

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
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
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(doom-one)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(doom
                                  :separator nil
                                  :separator-scale 1.0)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts.
   dotspacemacs-default-font '("Iosevka"
                               :size 13.0
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
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
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location nil

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 96

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 96

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols nil

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling nil

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers 'relative

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'current

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "Spacemacs@%t"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  )

(defun custom//load-all ()
  (dolist (file-name '("functions"
                       "file-template"
                       "flycheck-custom"
                       "elfeed-custom"
                       "evil-custom"
                       "docsets"
                       "projectile-custom"
                       "treemacs-custom"
                       "theme-custom"))
    (load (concat dotspacemacs-directory file-name))))

(defun custom//require-all ()
  (require 'rails-snippets)
  (require 'react-snippets)
  (require 'redux-snippets)
  (require 'jest-snippets)
  (require 'competitive-programming-snippets)
  (require 'atcoder-tools))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  (custom//load-all)

  (custom/flycheck-init)
  (custom/evil-init)
  (custom/projectile-init)
  (custom/docsets-init)
  (custom/elfeed-init)

  ;; Programming
  (spacemacs/add-to-hooks #'spacemacs/toggle-fill-column-indicator-on
                          '(prog-mode-hook git-commit-mode-hook))

  ;; built-ins
  (setq create-lockfiles nil
        select-enable-clipboard nil)

  ;; avy
  (setq avy-timeout-seconds 0.0)

  ;; emmet-mode
  (setq emmet-self-closing-tag-style " /")

  ;; go
  (setq gofmt-command "goimports"
        gofmt-show-errors 'echo)

  ;; helm
  (setq helm-mini-default-sources '(helm-source-buffers-list))

  ;; Java
  (setq lsp-java-import-gradle-enabled nil
        lsp-java-save-action-organize-imports t
        lsp-java-autobuild-enabled nil
        lsp-java-format-settings-url "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml"
        lsp-java-code-generation-hash-code-equals-use-java7objects t
        lsp-java-code-generation-hash-code-equals-use-instanceof t
        lsp-java-code-generation-use-blocks t
        lsp-java-code-generation-generate-comments t
        lsp-java-code-generation-to-string-code-style "STRING_BUILDER_CHAINED")
  (with-eval-after-load 'lsp-java
    (let* ((lombok-path (concat dotspacemacs-directory "/lombok-1.18.6.jar")))
      (add-to-list 'lsp-java-vmargs (concat "-javaagent:" lombok-path) 'append)
      (add-to-list 'lsp-java-vmargs
                   (concat "-Xbootclasspath/a:" lombok-path)
                   'append)))

  ;; javascript
  (setq js2-mode-show-parse-errors nil
        js2-mode-show-strict-warnings nil)

  ;; magit
  (setq magit-refresh-status-buffer nil
        magit-repolist-columns '(("Name" 25 magit-repolist-column-ident nil)
                                 ("Version" 25 magit-repolist-column-version nil)
                                 ("Path" 99 magit-repolist-column-path nil))
        magit-repository-directories `(("~/.dotfiles" . 0)
                                       ("~/.emacs.d" . 0)
                                       ("~/.spacemacs.d" . 0)
                                       ("~/develop/workspace" . 2)
                                       (,(concat (getenv "GOPATH") "/src/github.com/sei40kr") . 1))
        magit-revision-insert-related-refs nil)
  (with-eval-after-load 'magit
    (remove-hook 'magit-refs-sections-hook 'magit-insert-tags)
    (remove-hook 'server-switch-hook 'magit-commit-diff))
  ;; Allow to escape a key sequence with Esc
  ;; cf https://github.com/syl20bnr/spacemacs/issues/11998
  (with-eval-after-load 'transient
    (define-key transient-map        (kbd "<escape>") #'transient-quit-one)
    (define-key transient-edit-map   (kbd "<escape>") #'transient-quit-one)
    (define-key transient-sticky-map (kbd "<escape>") #'transient-quit-seq))

  ;; markdown
  (setq markdown-header-scaling t)

  ;; org
  (setq org-confirm-babel-evaluate nil
        org-export-with-section-numbers nil
        org-export-with-title t
        org-export-with-toc nil
        org-export-preserve-breaks t
        ;; org-re-reveal
        org-re-reveal-root (concat (getenv "HOME") "/org/reveal-js"))

  ;; perl5
  (setq cperl-mode-abbrev-table '())

  ;; plantuml
  (let* ((plantuml-jar-path "/usr/share/java/plantuml/plantuml.jar"))
    (setq org-plantuml-jar-path plantuml-jar-path
          plantuml-default-exec-mode 'jar
          plantuml-jar-path plantuml-jar-path))
  (add-to-list 'auto-mode-alist '("\\.pu\\'" . plantuml-mode))

  ;; prettier
  (setq prettier-js-show-errors 'echo)

  ;; ruby
  (setq
   ;; inf-ruby
   inf-ruby-default-implementation "pry"
   ;; rubocopfmt
   rubocopfmt-show-errors 'echo)

  ;; Shell
  (setq terminal-here-terminal-command (pcase system-type
                                         ('darwin '("open" "-a" "Alacritty.app" "."))
                                         ('gnu/linux '("alacritty" "--class" "Alacritty_terminalhere"))))

  ;; vc-hooks
  (setq vc-follow-symlinks t)

  ;; yasnippet
  (setq yas-new-snippet-default "\
# -*- mode: snippet -*-
# name: $1
# contributor : Seong Yong-ju <sei40kr@gmail.com>
# key: ${2:${1:$(yas--key-from-desc yas-text)}}
# --

$0")
  (defun custom//turn-off-yas-auto-indent ()
    (set (make-local-variable 'yas-indent-line) 'fixed))
  (spacemacs/add-to-hooks #'custom//turn-off-yas-auto-indent
                          '(haskell-mode-hook python-mode-hook sass-mode-hook))

  ;; Perspective
  (setq persp-kill-foreign-buffer-behaviour 'kill
        persp-remove-buffers-from-nil-persp-behaviour nil)
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  (custom//require-all)

  (custom//load-all)
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  (custom//require-all)
  (require 'dash)

  (custom/evil-config)
  (custom/file-template-config)
  (custom/treemacs-config)
  (custom/theme-config)

  ;; Fix frame transparency
  (spacemacs/enable-transparency)
  (add-hook 'after-make-frame-functions #'spacemacs/enable-transparency)
  )

(setq custom-file (concat spacemacs-cache-directory ".custom-settings"))
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
