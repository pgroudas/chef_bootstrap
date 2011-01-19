#!/bin/bash

$HOME/Software/ec2-api-tools/bin/ec2-run-instances ami-cef405a7 -f /$HOME/code/chef_bootstrap/dist/chef_install.sh -g default -g ssh -g webserver -k microkey -n 1 -t t1.micro

