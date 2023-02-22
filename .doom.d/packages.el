;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(package! elfeed-tube
  :recipe (:host github :repo "karthink/elfeed-tube"))

;; https://github.com/merrickluo/lsp-tailwindcss
(package! lsp-tailwindcss
  :recipe (:host github :repo "merrickluo/lsp-tailwindcss"))

;; Fetch a newer version of consult-lsp which has some bugfixes
(package! consult-lsp
  :pin "771cfad7c383d9dbbb5559a9439cb4de127d2fe6")

(package! flycheck-hledger)
