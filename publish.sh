set -ex
rm -rf public/*
hugo --verbose
rsync -r -c --delete --progress public/* uwe-arzt.de:site-uwe-arzt
rsync etc/htaccess uwe-arzt.de:site-uwe-arzt/.htaccess
rsync etc/robots.txt uwe-arzt.de:site-uwe-arzt/robots.txt
rsync ${HOME}/.recaptcha/private-key uwe-arzt.de:site-uwe-arzt/cgi-bin

