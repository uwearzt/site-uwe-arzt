#!/bin/bash
# ------------------------------------------------------------------------------
# Copyright 2018 Uwe Arzt, mail@uwe-arzt.de
# SPDX-License-Identifier: Apache-2.0
# ------------------------------------------------------------------------------
set -e
# set -x

# ------------------------------------------------------------------------------
# use self built cobalt
# export PATH=/Users/uwe/repo/cobalt.rs/target/debug:$PATH

echo "---------------------------------------------------------------------"
type cobalt
cobalt --version
echo "---------------------------------------------------------------------"

# ------------------------------------------------------------------------------
SERVER=uwe-arzt.de
DIR=site-uwe-arzt

NEWSERVER=hetzner01
NEWDIR=/var/www/site-uwe-arzt-de

# ------------------------------------------------------------------------------
cobalt clean
# cobalt --log-level=trace build
cobalt build

# ------------------------------------------------------------------------------
echo "-------------------------------------------------------------------------"
echo "changed files on 1und1"
rsync --dry-run --filter='P **.log' -r -c --delete --progress build/* ${SERVER}:${DIR}/

echo "-------------------------------------------------------------------------"
echo "upload?"
select option in Yes No
do
    case $option in
        Yes) 
            rsync -r -c --filter='P **.log' --delete --progress  build/* ${SERVER}:${DIR}/
            rsync etc/htaccess ${SERVER}:${DIR}/.htaccess
            rsync etc/robots.txt ${SERVER}:${DIR}/robots.txt
            break;;
        No)
            echo "Not uploading"
            break;;
     esac
done

# ------------------------------------------------------------------------------
echo "-------------------------------------------------------------------------"
echo "changed files on hetzner"
rsync --dry-run -r -c --delete --progress build/* ${NEWSERVER}:${NEWDIR}/

echo "-------------------------------------------------------------------------"
echo "upload?"
select option in Yes No
do
    case $option in
        Yes) 
            rsync -r -c --delete --progress  build/* ${NEWSERVER}:${NEWDIR}/
            rsync etc/robots.txt ${NEWSERVER}:${NEWDIR}/robots.txt
						ssh ${NEWSERVER} "chown www-data:www-data ${NEWDIR}"
            break;;
        No)
            echo "Not uploading"
            break;;
     esac
done
