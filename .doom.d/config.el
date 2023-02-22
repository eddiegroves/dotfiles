;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Always start Emacs window maximized
(add-hook 'window-setup-hook 'toggle-frame-maximized)

;; I'm using Emacs 29, which has tree-sitter built-in. Doom Emacs doesn't
;; support Emacs 29 and the built-in tree-sitter yet, so the below lets the new
;; ts major modes find dynamic modules built with
;; https://github.com/casouri/tree-sitter-module/
(setq treesit-extra-load-path '("/Users/eddie/Projects/github/tree-sitter-module/dist"))

;; Who am I
(setq user-full-name "Eddie Groves"
      user-mail-address "contact@eddiegroves.com")

;;; ui
(setq doom-theme 'doom-dracula
      ;; I've tried 10s of other popular fonts but keep coming back to Hack. Not
      ;; actively maintained since 2020 https://github.com/source-foundry/Hack
      doom-font (font-spec :family "Hack" :size 15)
      ;; Disable display line numbers
      display-line-numbers-type nil)

;;; ui workspaces
(setq ;; Open magit after switching project
      +workspaces-switch-project-function #'projectile-vc)

;;; ui zen
(setq ;; Increase Zen text scaling by one point
      +zen-text-scale 0.5)

;;; editor format
;; Doom's format module is pretty broken
;; The below fixes set-formatter not working with +onsave
;; https://github.com/doomemacs/doomemacs/issues/6936
(advice-remove 'format-all-buffer--from-hook '+format--all-buffer-from-hook-a)

(after! format
  :config
  (setq ;; Disable any lsp provided formatting
        +format-with-lsp nil)
  ;; Use charpier for formatting all C# modes https://github.com/belav/csharpier
  (set-formatter! 'csharpier "dotnet-csharpier" :modes '(csharp-mode csharp-tree-sitter-mode)))

;;; lang org
(setq org-directory
      ;; Switch between work and home docs based on machine name
      (if (string= (system-name) "Eddies-MacBook-Pro.local")
          "~/Work" "~/Documents"))

;; Toggle automatic line breaking (Auto Fill mode).
(add-hook 'org-mode-hook 'turn-on-auto-fill)

;; Disable visual line based editing (Visual Line mode)
(add-hook 'org-mode-hook (lambda ()
                           (visual-line-mode -1)))

(after! org
  (setq ;; TODO: Document
        org-todo-keywords '((sequence "TODO(t)" "IN PROGRESS(p)" "|" "DONE(d)" ))
        ;; TODO: Document
        org-icalendar-include-body nil
        ;; TODO: Document
        org-priority-highest 65
        ;; TODO: Document
        org-priority-lowest 69
        ;; Disable section-numbers
        org-export-with-section-numbers nil
        ;; Leave underscores as is, but allow ^{text} for super and _{text} for sub
        org-export-with-sub-superscripts '{}
        ;; Always display entities as UTF8 characters
        org-pretty-entities t
        ;; TODO: Document
        org-hide-block-startup t
        ;; Org prompts for confirmation before executing each code block
        org-confirm-babel-evaluate t
        ;; TODO: Document
        org-startup-folded t
        ; Disable :ATTACH: tag when attaching documents
        org-attach-auto-tag nil
        ;; TODO: Document
        org-ellipsis " ▼ "
        ;; TODO: Document
        org-html-table-default-attributes '(:border "2" :cellspacing "0" :cellpadding "6" :rules "all" :frame "border")
        ;; TODO: Document
        org-html-head-extra "<style>body{font-family: sans-serif}</style>"))

;;; lang ledger
(use-package! ledger-mode
  :mode "\\.journal$"
  :init
  ;; My finance setup is Ledger Mode with hledger
  (setq ledger-binary-path "~/Finance/ledger-compatibility-hledger")
  :config
  (map! :map ledger-mode-map
        :localleader
        "b" #'ledger-sort-buffer))

(use-package! flycheck-hledger
  :config
  (setq flycheck-hledger-strict t)
  :after (flycheck ledger-mode))

;;; lang rest
(use-package! jq-mode
  :mode "\\.jq$"
  :config
  ;; Use gojq instead of jq
  (setq org-babel-jq-command "gojq"
        jq-interactive-command "gojq"))

;;; lang web
(after! web-mode
  :config
  ;; Override Doom's html-tidy formatter settings with prettier
  (set-formatter! 'html-tidy '("prettier" "--parser" "html")))

(use-package! lsp-tailwindcss
  :init
  (setq lsp-tailwindcss-add-on-mode t))

;;; email mu4e
;; Provide the mu4e package which is installed via installing mu
;; The path below is manually symlinked so it's alawys in a known location
(add-to-list 'load-path (concat (getenv "HOMEBREW_PREFIX") "/share/mu/../emacs/site-lisp/mu/mu4e"))

(after! mu4e
  (setq
   ;; Always ask when email account to use when opening mu4e
   mu4e-context-policy 'always-ask
   ;; Custom bookmarks
   ;; Changes: 'Unread messages' filters Trash/Bin folders, 'Flagged messages'
   ;; Removes: 'Last 7 days', 'Messages with images'
   mu4e-bookmarks
   '(( :name  "Unread messages"
       :query "flag:unread AND NOT flag:trashed AND NOT maildir:/Trash AND NOT maildir:/[Gmail]/Bin"
       :key ?u)
     ( :name "Today's messages"
       :query "date:today..now"
       :key ?t)
     ( :name "Flagged messages"
       :query "flag:flagged"
       :key ?f)))
  ;; Fastmail email account
  (set-email-account! "fastmail"
                      '((mu4e-maildir . "~/Mail/Fastmail")
                        (mu4e-mu-home . "~/.mu/Fastmail")
                        (mu4e-drafts-folder . "/Drafts")
                        (mu4e-sent-folder . "/Sent")
                        (mu4e-trash-folder . "/Trash")
                        (mu4e-refile-folder . "/Archive"))
                      t)
  ;; Gmail email account
  (set-email-account! "gmail"
                      '((mu4e-maildir . "~/Mail/Gmail")
                        (mu4e-mu-home . "~/.mu/Gmail")
                        (mu4e-drafts-folder . "/[Gmail]/Drafts")
                        (mu4e-sent-folder . "/[Gmail]/Sent Mail")
                        (mu4e-trash-folder . "/[Gmail]/Bin")
                        (mu4e-refile-folder . "/[Gmail]/All Mail"))
                      t)
  ;; External email account
  (set-email-account! "external"
                      '((mu4e-maildir . "~/Mail/External")
                        (mu4e-mu-home . "~/.mu/External")
                        (mu4e-drafts-folder . "/Drafts")
                        (mu4e-sent-folder . "/Sent")
                        (mu4e-trash-folder . "/Trash")
                        (mu4e-refile-folder . "/DT" ))
                      t)
  ;; I still want to use "d" in mu4e to delete stuff and use trash folders but
  ;; do not want to apply the "deleted" flag and instead leave that up to email
  ;; servers which will all auto permanently delete mail after some period of
  ;; time. Use "-N" Instead of "+T-N".
  ;; https://github.com/djcb/mu/issues/1136
  (setf (plist-get (alist-get 'trash mu4e-marks) :action)
        (lambda (docid msg target)
          (mu4e--server-move docid (mu4e--mark-check-target target) "-N"))))

;;; app rss
(after! elfeed
  (setq elfeed-search-filter "@2-months-ago +unread"))

(use-package elfeed-tube
  :after elfeed
  :config
  (elfeed-tube-setup))
