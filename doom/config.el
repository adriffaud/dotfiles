;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Adrien Driffaud"
      user-mail-address "adriffaud@me.com")

(setq doom-font (font-spec :family "IBM Plex Mono" :size 15)
      doom-big-font (font-spec :family "IBM Plex Mono" :size 19))

(after! which-key
  (setq which-key-idle-delay 0.5))

(setq doom-theme 'doom-palenight)

(after! doom-modeline
  (setq doom-modeline-buffer-encoding nil))

(setq evil-split-window-below t
      evil-vsplit-window-right t)

(after! magit
  (setq magit-log-arguments '("--graph" "--decorate" "--color")))

(setq org-directory "~/Documents/Org/"
      org-todo-keywords '((sequence "TODO" "DOING" "BLOCKED" "REVIEW" "|" "DONE" "ARCHIVED")))

(setq org-journal-dir "~/Documents/journal/Org"
      org-image-actual-width nil
      org-journal-file-format "%Y-%m-%d"
      org-journal-date-prefix "#+TITLE: "
      org-journal-date-format "%A, %B %d %Y"
      org-journal-time-prefix "* "
      org-journal-time-format ""
      org-journal-carryover-items "TODO=\"TODO\"|TODO=\"DOING\"|TODO=\"BLOCKED\"|TODO=\"REVIEW\"")

(setq display-line-numbers-type 'relative)
