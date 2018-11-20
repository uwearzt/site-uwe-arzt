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
NEWSERVER=hetzner01
DIR=site-uwe-arzt

# ------------------------------------------------------------------------------
cobalt clean
# cobalt --log-level=trace build
cobalt build

# ------------------------------------------------------------------------------
echo "-------------------------------------------------------------------------"
echo "changed files on 1und1"
rsync --dry-run --filter='P **.log' --filter='P **/.private-key' -r -c --delete --progress build/* ${SERVER}:${DIR}/

echo "-------------------------------------------------------------------------"
echo "upload?"
select option in Yes No
do
    case $option in
        Yes) 
            rsync -r -c --filter='P **.log' --filter='P **/.private-key' --delete --progress  build/* ${SERVER}:${DIR}/
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
rsync --dry-run --filter='P **.log' --filter='P **/.private-key' -r -c --delete --progress build/* ${NEWSERVER}:${DIR}/

echo "-------------------------------------------------------------------------"
echo "upload?"
select option in Yes No
do
    case $option in
        Yes) 
            rsync -r -c --filter='P **.log' --filter='P **/.private-key' --delete --progress  build/* ${NEWSERVER}:${DIR}/
            rsync etc/htaccess ${NEWSERVER}:${DIR}/.htaccess
            rsync etc/robots.txt ${NEWSERVER}:${DIR}/robots.txt
            break;;
        No)
            echo "Not uploading"
            break;;
     esac
done
