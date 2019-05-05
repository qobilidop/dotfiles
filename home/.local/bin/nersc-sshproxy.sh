#!/usr/bin/env bash
# 
# Get a temporary ssh key to NERSC systems
#
# Usage:
#
# $ nersc-sshproxy.sh
#
# See http://www.nersc.gov/users/connecting-to-nersc/mfa/#sshproxy
#

cd "$TMPDIR" || exit
scp cori:/project/projectdirs/mfa/NERSC-MFA/sshproxy.sh .
bash sshproxy.sh -u bdong
