set from  = "cole@disqus.com"
set record = "+disqus/[Gmail].Sent Mail"
set sendmail = "/usr/bin/msmtp -a disqus"
