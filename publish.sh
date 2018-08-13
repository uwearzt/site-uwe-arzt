#!/bin/bash
# ------------------------------------------------------------------------------
# Copyright 2018 Uwe Arzt, mail@uwe-arzt.de
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and 
# limitations under the License.
# ------------------------------------------------------------------------------
set -e
# set -x

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
            # not in public repo
            rsync ${HOME}/.recaptcha/.private-key ${SERVER}:${DIR}/cgi-bin/
            break;;
        No)
            echo "Not uploading"
            break;;
     esac
done
