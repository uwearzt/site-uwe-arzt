#!/bin/bash
# ------------------------------------------------------------------------------
# Copyright 2016-2018 by Uwe Arzt mailto:mail@uwe-arzt.de, https://uwe-arzt.de
# under BSD License, see https://uwe-arzt.de/bsd-license.html
# ------------------------------------------------------------------------------
set -e

# ------------------------------------------------------------------------------
# use self built cobalt
# export PATH=/Users/uwe/repo/cobalt.rs/target/debug:$PATH

# use cargo built cobalt
# export PATH=/Users/uwe/.cobalt/bin:$PATH

echo "---------------------------------------------------------------------"
type cobalt
cobalt --version
echo "---------------------------------------------------------------------"

# ------------------------------------------------------------------------------
SERVER=uwe-arzt.de
DIR=site-uwe-arzt

# ------------------------------------------------------------------------------
cobalt clean
# cobalt --log-level=trace build
cobalt build

# ------------------------------------------------------------------------------
echo "-------------------------------------------------------------------------"
echo "changed files"
rsync --dry-run -r -c --delete --progress build/* ${SERVER}:${DIR}/

echo "-------------------------------------------------------------------------"
echo "upload?"
select option in Yes No
do
	case $option in
        Yes) 
			rsync -r -c --delete --progress build/* ${SERVER}:${DIR}/
			rsync etc/htaccess ${SERVER}:${DIR}/.htaccess
			rsync etc/robots.txt ${SERVER}:${DIR}/robots.txt
			# not in public repo
			rsync ${HOME}/.recaptcha/.private-key ${SERVER}:${DIR}/cgi-bin/
            break;;
        No)
            echo "Not uploading"
            break;;
     esac
done

