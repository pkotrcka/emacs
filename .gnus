(setq
 user-mail-address "pkotrcka@vivaldi.net"
 user-full-name "Peter Kotrčka"
      gnus-select-method
      '(nnimap "vivaldi"
               (nnimap-address "mail.vivaldi.net")
               (nnimap-server-port 993)
               (nnimap-stream ssl))
      smtpmail-smtp-server "smtp.vivaldi.net"
      smtpmail-smtp-service 587
      message-send-mail-function 'smtpmail-send-it)
