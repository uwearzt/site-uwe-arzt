#!/bin/bash
# ------------------------------------------------------------------------------
# Copyright 2016 by Uwe Arzt mailto:mail@uwe-arzt.de, https://uwe-arzt.de
# under BSD License, see https://uwe-arzt.de/bsd-license
# ------------------------------------------------------------------------------
set -ex
#set -e

SERVER=uwe-arzt.de

SITEDIR=site-uwe-arzt
TESTDIR=test-site-uwe-arzt

DIR=${SITEDIR}
SETTINGS="--verbose"

for i in "$@"
do
case $i in
    -t|--test)
        DIR=${TESTDIR}
				SETTINGS="${SETTINGS} --buildDrafts"
    ;;
    *)
        echo "Unknown Option"
				exit 1
    ;;
esac
done

rm -rf public/*
hugo ${SETTINGS}
rsync -r -c --delete --progress public/* ${SERVER}:${DIR}/
rsync etc/htaccess ${SERVER}:${DIR}/.htaccess
rsync etc/robots.txt ${SERVER}:${DIR}/robots.txt
rsync ${HOME}/.recaptcha/private-key ${SERVER}:${DIR}/cgi-bin

