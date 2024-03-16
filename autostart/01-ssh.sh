logger -f $HOME/.xsession-errors "SSH...."
export SSH_ASKPASS=/usr/bin/ksshaskpass
/usr/bin/ssh-add $HOME/.ssh/id_rsa </dev/null
