#!/bin/sh

# Environment variables to set for the workshop

mySSH_COMMAND=`echo $WORKSHOP_VARS | jp .ssh_command`
mySSH_PASSWORD=`echo $WORKSHOP_VARS | jp .ssh_password`
