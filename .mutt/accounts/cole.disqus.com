set from  = "cole@disqus.com"
set record = "=disqus/Sent"
set sendmail = "msmtp -a disqus"

# Move messages to GMail trash folder. Otherwise we are left with a
# copy of the deleted message in the "All Mail" folder when it is
# deleted from the Inbox or another label. Another fun gotcha with
# GMail's fake folders.
set trash="=disqus/Trash"

set sig_dashes = no
set signature = "~/.mutt/accounts/signature"