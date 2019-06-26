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
NEWSERVER=hetzner01
NEWDIR=/var/www/site-uwe-arzt

# ------------------------------------------------------------------------------
cobalt clean
# cobalt --log-level=trace build
cobalt build

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
