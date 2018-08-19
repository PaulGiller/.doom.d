;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-
;; Example: https://gist.github.com/hjertnes/9d1ceecb403b3bad1764b41c4ca284b7
;;; Code:

(def-package! ace-jump-mode)

(when (featurep! :feature evil)
  (load! "bindings"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; mu4e config ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(after! mu4e
  (setq mu4e-maildir            "~/Maildir"
        mu4e-get-mail-command   "offlineimap -o -q"
        mu4e-use-fancy-chars    t
        mu4e-attachment-dir     "~/Maildir/.attachments"
        mu4e-sent-folder        "/[Google Mail].Sent Mail"
        mu4e-drafts-folder      "/[Google Mail].Drafts"
        mu4e-trash-folder       "/[Google Mail].Trash"
        mu4e-refile-folder      "/[Google Mail].All Mail"
        smtpmail-smtp-user      "paulgiller@gmail.com"
        user-mail-address       "paulgiller@gmail.com"
        mu4e-compose-signature  "---\nPaul Giller"
        smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
        smtpmail-auth-credentials
        '(("smtp.gmail.com" 587 "paulgiller@gmail.com" nil))
        smtpmail-default-smtp-server "smtp.gmail.com"
        smtpmail-smtp-server "smtp.gmail.com"
        mu4e-headers-fields '((:account . 24)
                              (:human-date . 12)
                              (:flags . 4)
                              (:from . 25)
                              (:subject))
        smtpmail-smtp-service 587
        mu4e-maildir-shortcuts '( ("/INBOX"               . ?i)
                                  ("/[Google Mail].Sent Mail"   . ?s)
                                  ("/[Google Mail].Trash"       . ?t)
                                  ("/[Google Mail].All Mail"    . ?a))))

(defun htmlize-before-send ()
  "When in an org-mu4e-compose-org-mode message, htmlize it."
  (when (member 'org~mu4e-mime-switch-headers-or-body post-command-hook)
    (message-mode)
    (org-mime-htmlize)))

(advice-add 'message-send-and-exit :before 'htmlize-before-send)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Clojure config ;;;;;;;;;;;;;;;;;;;;;;

(after! clojure-mode
 (add-hook! 'clojure-mode-hook
  (smartparens-strict-mode)
  (setq cljr-warn-on-eval nil))
 (set-popup-rule! "^\\*cider-repl" :quit 'current :select nil :width 85 :side 'right :slot 1)
 (set-popup-rule! "^\\*cider-error" :quit 'current :select t :height 0.5 :side 'right :slot 2))

;;;;;;;;;;;;;;;;;;;;;;;;;;; Org Brain ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(def-package! org-brain
 :init
 (setq org-brain-path "~/org/brain")
 ;; For Evil users (with-eval-after-load 'evil
  ; (evil-set-initial-state 'org-brain-visualize-mode 'emacs)
 :config
 (setq org-id-track-globally t)
 (setq org-id-locations-file "~/.emacs.d/.org-id-locations")
 (push '("b" "Brain" plain (function org-brain-goto-end)
         "* %i%?" :empty-lines 1)
       org-capture-templates)
 (setq org-brain-visualize-default-choices 'all)
 (setq org-brain-title-max-length 35)
 (set-popup-rule! "^\\*org-brain" :ignore t)
 (map! :map org-brain-visualize-mode-map
          :n  "<tab>"   #'forward-button
          :n  "m"     #'org-brain-visualize-mind-map
          :n  "j"     #'forward-button
          :n  "k"     #'backward-button
          :n  "b"     #'org-brain-visualize-back
          :n  "h"     #'org-brain-new-child
          :n  "c"     #'org-brain-add-child
          :n  "C"     #'org-brain-remove-child
          :n  "p"     #'org-brain-add-parent
          :n  "P"     #'org-brain-remove-parent
          :n  "f"     #'org-brain-add-friendship
          :n  "F"     #'org-brain-remove-friendship
          :n  "n"     #'org-brain-pin
          :n  "t"     #'org-brain-set-title
          :n  "T"     #'org-brain-set-tags
          :n  "d"     #'org-brain-delete-entry
          :n  "l"     #'org-brain-add-resource
          :n  "C-y"   #'org-brain-visualize-paste-resource
          :n  "a"     #'org-brain-visualize-attach
          :n  "A"     #'org-brain-archive
          :n  "o"     #'org-brain-goto-current
          :n  "O"     #'org-brain-goto
          :n  "v"     #'org-brain-visualize
          :n  "V"     #'revert-buffer
          :n  "r"     #'org-brain-visualize-random
          :n  "R"     #'org-brain-visualize-wander))

(after! org-brain
  (def-package! org-cliplink)
  (add-hook! 'org-brain-after-visualize-hook #'aa2u-buffer))
