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
DIR=site-uwe-arzt

# SETTINGS="--drafts --trace"

cobalt --config cobalt.yml clean
cobalt --config cobalt.yml build
# cobalt --log-level=debug --config cobalt.yml build
# cobalt --log-level=trace --config cobalt.yml build

rsync --dry-run -r -c --delete --progress build/* ${SERVER}:${DIR}/
# rsync -r -c --delete --progress build/* ${SERVER}:${DIR}/
rsync etc/htaccess ${SERVER}:${DIR}/.htaccess
rsync etc/robots.txt ${SERVER}:${DIR}/robots.txt
# not in public repo
rsync ${HOME}/.recaptcha/.private-key ${SERVER}:${DIR}/cgi-bin/

