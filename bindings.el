;;; ~/.doom.d/+bindings.el -*- lexical-binding: t; -*-

(map!
 :gnvime "C-<f1>" #'ace-jump-mode
 :leader
      (:desc "open" :prefix "o"
        :desc "Mail" :n "m" #'=email))