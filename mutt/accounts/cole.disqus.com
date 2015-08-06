set from  = "cole@disqus.com"
set record = "+disqus/[Gmail].Sent Mail"
set sendmail = "msmtp -a disqus"

set sig_dashes = no
set signature = "~/.mutt/accounts/signature"
