#!/bin/bash
# ------------------------------------------------------------------------------
# Copyright 2016 by Uwe Arzt mailto:mail@uwe-arzt.de, https://uwe-arzt.de
# under BSD License, see https://uwe-arzt.de/bsd-license
# ------------------------------------------------------------------------------
set -ex
#set -e

export PATH=/Users/uwe/repo/cobalt.rs/target/debug:$PATH
type cobalt

SERVER=uwe-arzt.de

SITEDIR=site-uwe-arzt
TESTDIR=test-site-uwe-arzt

DIR=${TESTDIR}
SETTINGS="--drafts --trace"

for i in "$@"
do
case $i in
    -p|--prod)
        DIR=${SITEDIR}
				SETTINGS=""
    ;;
    *)
        echo "Unknown Option"
				exit 1
    ;;
esac
done

cobalt --config cobalt.yml clean
cobalt --config cobalt.yml build
# cobalt --log-level=debug --config cobalt.yml build
# cobalt --log-level=trace --config cobalt.yml build

rsync -r -c --delete --progress build/* ${SERVER}:${DIR}/
rsync etc/htaccess ${SERVER}:${DIR}/.htaccess
rsync etc/robots.txt ${SERVER}:${DIR}/robots.txt
# not in public repo
rsync ${HOME}/.recaptcha/.private-key ${SERVER}:${DIR}/cgi-bin/

