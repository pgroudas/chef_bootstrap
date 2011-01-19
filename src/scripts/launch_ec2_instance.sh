#!/bin/bash
export DIST_DIR="./"
export INSTANCE_TYPE=t1.micro
export DEFAULT_AMI=ami-cef405a7

$DIST_DIR/../lib/ec2-api-tools/bin/ec2-run-instances $DEFAULT_AMI -f $DIST_DIR/bin/chef_install.sh -g default -g ssh -g webserver -k microkey -n 1 -t $INSTANCE_TYPE
