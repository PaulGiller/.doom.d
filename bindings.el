;;; ~/.doom.d/+bindings.el -*- lexical-binding: t; -*-

(map!
 :gnvime "C-c <left>"  #'winner-undo
 :gnvime "C-c <right>" #'winner-redo
 :gnvime "C-<f1>"  #'ace-jump-mode
 :leader
      (:desc "open" :prefix "o"
       :desc "Mail" :n "m" #'=email)

      (:desc "toggle" :prefix "t"
        :desc "Truncate Lines" :n "v" #'toggle-truncate-lines)

      (:desc "structural edit" :prefix "k"
        :desc "Raise" :n "r" #'paredit-raise-sexp)

        (:desc "insert" :prefix "i"
          :desc "Kill Ring" :nv "y" #'helm-show-kill-ring
          :desc "ClipLink" :nv "c" #'org-brain-cliplink-resource))
