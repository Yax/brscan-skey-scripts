#!  /bin/bash
if [ "$1" != 'r' ];then
    echo "brscan-skey@$(uname -n)" > /etc//opt/brother/scanner/brscan-skey/brscan_mailmessage.txt
else
    rm /etc//opt/brother/scanner/brscan-skey/brscan_mailmessage.txt
fi
