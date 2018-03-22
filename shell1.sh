#!/bin/sh
echo "Login name : $LOGNAME"
echo "User name :  $USER"
echo "Current shell : $SHELL"
echo "Home directory : $HOME" 
echo "Operating System : $OSTYPE"
echo "Current path : $PATH"
echo "Current working directory : `pwd`"
echo "No.of users currently logged in:`who | wc -l`"
