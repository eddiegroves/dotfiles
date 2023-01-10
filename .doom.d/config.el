;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;; Always start Emacs window maximized
(add-hook 'window-setup-hook 'toggle-frame-maximized)

;;; Who am I
(setq user-full-name "Eddie Groves"
      user-mail-address "contact@eddiegroves.com")

;;; ui
(setq doom-theme 'doom-dracula
      ;; I've tried 10s of other popular fonts but keep coming back to Hack. Not
      ;; actively maintained since 2020 https://github.com/source-foundry/Hack
      doom-font (font-spec :family "Hack" :size 15)
      ;; Disable display line numbers
      display-line-numbers-type nil)

;;; tools lsp
(after! lsp-mode
  (setq lsp-enable-suggest-server-download nil))

;;; lang org
(setq org-directory "~/Documents/")

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

;;; app rss
(after! elfeed
  (setq elfeed-search-filter "@2-months-ago +unread"))

(use-package elfeed-tube
  :after elfeed
  :config
  (elfeed-tube-setup))
