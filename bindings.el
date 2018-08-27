;;; ~/.doom.d/+bindings.el -*- lexical-binding: t; -*-

(map!
 :gnvime "C-c <left>"  #'winner-undo
 :gnvime "C-c <right>" #'winner-redo
 :gnvime "C-<f1>"  #'ace-jump-mode
 :leader
      (:desc "open" :prefix "o"
       :desc "Mail" :n "m" #'=email
       :desc "Org-Brain Visualiser" :n "v" #'org-brain-visualize)

      (:desc "toggle" :prefix "t"
        :desc "Truncate Lines" :n "v" #'toggle-truncate-lines)

      (:desc "structural edit" :prefix "k"
        :desc "Raise" :n "r" #'sp-extract-before-sexp)

        (:desc "insert" :prefix "i"
          :desc "ClipLink" :nv "c" #'org-brain-cliplink-resource))
