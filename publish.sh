#!/bin/bash
# ------------------------------------------------------------------------------
# Copyright 2018-2020 Uwe Arzt, mail@uwe-arzt.de
# SPDX-License-Identifier: Apache-2.0
# ------------------------------------------------------------------------------
# set -e
# set -x

#export PATH=/Users/uwe/repo/rust/zola/target/debug:$PATH
export PATH=/Users/uwe/repo/rust/zola/target/release:$PATH
echo "---------------------------------------------------------------------"
type zola
zola --version
echo "---------------------------------------------------------------------"

# ------------------------------------------------------------------------------
SERVER=hetzner01
DIR=/var/www/site-uwe-arzt

# ------------------------------------------------------------------------------
zola check
zola build

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
      ssh ${SERVER} "chown www-data:www-data ${DIR}"
      break;;
    No)
      echo "Not uploading"
      break;;
  esac
done
