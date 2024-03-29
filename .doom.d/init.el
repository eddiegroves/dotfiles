;;; init.el -*- lexical-binding: t; -*-

;; This file controls what Doom modules are enabled and what order they load
;; in. Remember to run 'doom sync' after modifying it!

;; NOTE Press 'SPC h d h' (or 'C-h d h' for non-vim users) to access Doom's
;;      documentation. There you'll find a link to Doom's Module Index where all
;;      of our modules are listed, including what flags they support.

;; NOTE Move your cursor over a module's name (or its flags) and press 'K' (or
;;      'C-c c k' for non-vim users) to view its documentation. This works on
;;      flags as well (those symbols that start with a plus).
;;
;;      Alternatively, press 'gd' (or 'C-c c d') on a module to browse its
;;      directory (for easy access to its source code).

(doom! :input

       :completion
       company
       vertico

       :ui
       doom
       doom-dashboard
       hl-todo
       modeline
       (popup +defaults)
       (treemacs +lsp)
       workspaces
       zen

       :editor
       (evil +everywhere)
       ;;file-templates
       ;;fold
       (format +onsave)
       ;;god
       ;;lispy
       ;;multiple-cursors
       ;;objed
       ;;parinfer
       ;;rotate-text
       snippets
       ;;word-wrap

       :emacs
       dired
       ;;electric
       ;;ibuffer
       undo
       ;;vc

       :term
       ;;eshell
       ;;shell
       ;;term
       vterm

       :checkers
       syntax
       ;;(spell +flyspell)
       ;;grammar

       :tools
       direnv
       ;;editorconfig
       ;;(eval +overlay)
       ;;gist
       (lookup +dictionary +offline)
       lsp
       magit
       ;;make
       ;;pass
       ;;pdf
       ;;rgb
       ;;taskrunner
       ;;tmux
       tree-sitter
       terraform
       ;;upload

       :os
       (:if IS-MAC macos)
       ;;tty

       :lang
       ;;common-lisp
       (csharp +dotnet +lsp +tree-sitter)
       ;;data
       ;;(dart +flutter)
       ;;emacs-lisp
       ;;(graphql +lsp)
       (json +lsp +tree-sitter)
       (javascript +lsp +tree-sitter)
       ;;kotlin
       ;;latex
       ledger
       ;;markdown
       ;;nix
       (org +roam2)
       plantuml
       (kotlin +lsp)
       (python +lsp +tree-sitter +pyright)
       (rest +jq)
       (rust +lsp +tree-sitter)
       (sh +fish +powershell +lsp +tree-sitter)
       (web +lsp +tree-sitter)
       (yaml +lsp)

       :email
       (mu4e +org +gmail)

       :app
       (rss +org)

       :config
       (default +bindings +smartparens))
