;;; ~/.doom.d/+bindings.el -*- lexical-binding: t; -*-

(map!
 :gnvime "C-<f1>" #'ace-jump-mode
 :leader
      (:desc "open" :prefix "o"
       :desc "Mail" :n "m" #'=email
       :desc "Org-Brain Visualiser" :n "v" #'org-brain-visualize)

      (:desc "insert" :prefix "i"
        :desc "ClipLink" :nv "c" #'org-brain-cliplink-resource))
