# brscan-skey-scripts
Modified and improved brscan-skey scripts for my paperless workflow

These scripts are based on https://download.brother.com/welcome/dlf006652/brscan-skey-0.3.2-0.amd64.deb. Brother files come with their own license - LICENSE_ENG.txt, all my changes are unlicensed.

Service file should be placed in /etc/systemd/system then:
sudo systemctl enable brscan-skey.service
sudo systemctl start brscan-skey.service

Dependencies:
ghostscript, libtiff-tools
