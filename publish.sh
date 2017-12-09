#!/bin/bash
# ------------------------------------------------------------------------------
# Copyright 2016-2017 by Uwe Arzt mailto:mail@uwe-arzt.de, https://uwe-arzt.de
# under BSD License, see https://uwe-arzt.de/bsd-license
# ------------------------------------------------------------------------------
set -ex

# ------------------------------------------------------------------------------
# use self built cobalt
export PATH=/Users/uwe/repo/cobalt.rs/target/debug:$PATH

# use cargo built cobalt
# export PATH=/Users/uwe/.cobalt/bin:$PATH

type cobalt

# ------------------------------------------------------------------------------
SERVER=uwe-arzt.de
DIR=site-uwe-arzt

# ------------------------------------------------------------------------------
cobalt clean
cobalt --log-level=trace build

# ------------------------------------------------------------------------------
rsync --dry-run -r -c --delete --progress build/* ${SERVER}:${DIR}/
# rsync -r -c --delete --progress build/* ${SERVER}:${DIR}/
rsync etc/htaccess ${SERVER}:${DIR}/.htaccess
rsync etc/robots.txt ${SERVER}:${DIR}/robots.txt
# not in public repo
rsync ${HOME}/.recaptcha/.private-key ${SERVER}:${DIR}/cgi-bin/

