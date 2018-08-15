;;; ~/.doom.d/autoload/autoload.el -*- lexical-binding: t; -*-


;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Clojure config ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;###autoload
(defun kill-all-java ()
  (interactive)
  (shell-command "wmic process where \"name like '%java%'\" delete"))


