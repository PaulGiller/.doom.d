;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-
;; Example: https://gist.github.com/hjertnes/9d1ceecb403b3bad1764b41c4ca284b7

(after! mu4e
  (setq mu4e-maildir            "~/Maildir"
        mu4e-get-mail-command   "offlineimap -o -q"
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
        smtpmail-smtp-service 587
        mu4e-maildir-shortcuts '( ("/INBOX"               . ?i)
                                  ("/[Google Mail].Sent Mail"   . ?s)
                                  ("/[Google Mail].Trash"       . ?t)
                                  ("/[Google Mail].All Mail"    . ?a))))

