#!/bin/bash
# ------------------------------------------------------------------------------
# Copyright 2018-2021 Uwe Arzt, mail@uwe-arzt.de
# SPDX-License-Identifier: Apache-2.0
# ------------------------------------------------------------------------------
# set -e
# set -x

# ------------------------------------------------------------------------------
SERVER=hetzner01
LOGDIR=/var/log/caddy/
LOGFILE=site-uwe-arzt.log

LOCALSTATSDIR=/tmp/
REPORT=site-uwe-arzt.html

# ------------------------------------------------------------------------------
echo "get logfile"
scp $SERVER:$LOGDIR$LOGFILE $LOCALSTATSDIR

echo "generate report"
goaccess $LOCALSTATSDIR$LOGFILE --log-format=CADDY --output=$LOCALSTATSDIR$REPORT

