;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-
;; Example: https://gist.github.com/hjertnes/9d1ceecb403b3bad1764b41c4ca284b7
;;; Code:

(def-package! ace-jump-mode)
(def-package! autodisass-java-bytecode)

(when (featurep! :feature evil)
  (load! "bindings"))

(after! ace-window
  (setq aw-scope 'global))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; org mode ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-agenda-span 14)
;;
;; Reveal.js + Org mode
(require 'ox-reveal)
(setq org-reveal-root "file:///c:/users/pg50466/repos/reveal.js")
(setq org-reveal-title-slide nil)
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
  (paredit-mode)
  (define-clojure-indent
    (check-let 2))
  (setq cljr-warn-on-eval nil)
  (setq treemacs-silent-refresh t))

 (set-popup-rule! "^\\*cider-repl" :quit 'current :select nil :width 85 :side 'right :slot 1)
 (set-popup-rule! "^\\*cider-error" :quit 'current :select t :width 85 :height 0.5 :side 'right :slot 2)
 (set-popup-rule! "^\\*cider-test" :quit 'current :select t :width 85 :height 0.25 :side 'right :slot 3))
