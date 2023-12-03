;;; flix-mode.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2023 ncihnegn
;;
;; Author: ncihnegn <ncihnegn@users.noreply.github.com>
;; Maintainer: ncihnegn <ncihnegn@users.noreply.github.com>
;; Created: December 02, 2023
;; Modified: December 02, 2023
;; Version: 0.0.1
;; Keywords: languages flix
;; Homepage: https://github.com/ncihnegn/flix-mode
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:

(defvar flix-mode-constants
  '("false"
    "null"
    "true"))

(defvar flix-mode-keywords
  '("!="  "**"  ".."  "::"  ":="  "<-"  "<="  "=="  "=>"  ">="
    "or"  "&&&"  "<+>"  "<<<"  "<=>"  ">>>"  "???"  "^^^"
    "and"  "mod"  "not"  "rem"
    "|||"  "~~~"  "$DEFAULT$"  "*"  "+"  "-"  "/"  ":"  "<"  ">"  "@"
    "Absent"
    "Bool"
    "Impure"
    "Nil"
    "Predicate"
    "Present"
    "Pure"
    "Read"
    "RecordRow"
    "Region"
    "SchemaRow"
    "Type"
    "Write"
    "alias"
    "case"
    "catch"
    "chan"
    "class"
    "def"
    "deref"
    "else"
    "enum"
    "fix"
    "force"
    "if"
    "import"
    "inline"
    "instance"
    "into"
    "lat"
    "law"
    "lawful"
    "lazy"
    "let"
    "match"
    "namespace"
    "opaque"
    "override"
    "pub"
    "ref"
    "region"
    "reify"
    "reifyBool"
    "reifyEff"
    "reifyType"
    "rel"
    "sealed"
    "set"
    "spawn"
    "Static"
    "trait"
    "type"
    "use"
    "where"
    "with"
    "discard"
    "object"))

(defvar flix-mode-font-lock-defaults
  `((
     ;; stuff between double quotes
     ("\"\\.\\*\\?" . font-lock-string-face)
     ( ,(regexp-opt flix-mode-keywords 'words) . font-lock-builtin-face)
     ( ,(regexp-opt flix-mode-constants 'words) . font-lock-constant-face))))

(defconst flix-mode-syntax-table
  (let ((table (standard-syntax-table)))
    ;; ' is a char delimiter
    (modify-syntax-entry ?' "'" table)
    ;; " is a string delimiter
    (modify-syntax-entry ?\" "\"" table)
    ;; / is punctuation, but // is a comment starter
    (modify-syntax-entry ?/ ". 12" table)
    ;; \n is a comment ender
    (modify-syntax-entry ?\n ">" table)
    table))

(define-derived-mode flix-mode prog-mode "Flix"
  "Major mode for the Flix programming language."
  :syntax-table flix-mode-syntax-table
  (setq font-lock-defaults flix-mode-font-lock-defaults))

(add-to-list 'auto-mode-alist
             '("\\.flix" . flix-mode))

(provide 'flix-mode)
;;; flix-mode.el ends here
