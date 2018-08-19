;;; ~/.doom.d/autoload/autoload.el -*- lexical-binding: t; -*-


;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Clojure config ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;###autoload
(defun kill-all-java ()
  (interactive)
  (shell-command "wmic process where \"name like '%java%'\" delete"))

;;;###autoload
(defun org-brain-cliplink-resource ()
  "Add a URL from the clipboard as an org-brain resource.
Suggest the URL title as a description for resource."
  (interactive)
  (let ((url (org-cliplink-clipboard-content)))
    (org-brain-add-resource
     url
     (org-cliplink-retrieve-title-synchronously url)
     t)))

;;;###autoload
(defun aa2u-buffer ()
     (aa2u (point-min) (point-max)))
