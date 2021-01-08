#!/bin/bash
# ------------------------------------------------------------------------------
# Copyright 2018-2021 Uwe Arzt, mail@uwe-arzt.de
# SPDX-License-Identifier: Apache-2.0
# ------------------------------------------------------------------------------
# set -e
# set -x

. zola.sh
echo "---------------------------------------------------------------------"
echo $ZOLA
$ZOLA --version
echo "---------------------------------------------------------------------"

# ------------------------------------------------------------------------------
SERVER=hetzner01
DIR=/var/www/site-uwe-arzt

# ------------------------------------------------------------------------------
$ZOLA check
$ZOLA build

# ------------------------------------------------------------------------------
echo "-------------------------------------------------------------------------"
echo "changed files"
rsync --dry-run -r -c --delete --progress public/* ${SERVER}:${DIR}/

echo "-------------------------------------------------------------------------"
echo "upload?"
select option in Yes No
do
  case $option in
    Yes)
      rsync -r -c --delete --progress  public/* ${SERVER}:${DIR}/
      ssh ${SERVER} "chown -R www-data:www-data ${DIR}"
      break;;
    No)
      echo "Not uploading"
      break;;
  esac
done
