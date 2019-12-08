#!/bin/bash
# ------------------------------------------------------------------------------
# Copyright 2018 Uwe Arzt, mail@uwe-arzt.de
# SPDX-License-Identifier: Apache-2.0
# ------------------------------------------------------------------------------
set -e
# set -x

export PATH=/Users/uwe/repo/rust/zola/target/debug:$PATH
echo "---------------------------------------------------------------------"
type zola
zola --version
echo "---------------------------------------------------------------------"

zola build
zola serve
