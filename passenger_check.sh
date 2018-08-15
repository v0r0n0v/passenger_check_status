#!/bin/bash

queue=`passenger-status | grep  "Shutting" | awk 'NR < 2 {print $0}'`

#echo $queue

if  [ -n "$queue" ]
    then
        /etc/init.d/nginx restart
        echo "Nginx was restarted because the error was found in the command Passenger status 'Shutting down...' " | mail -s "Nginx was restarted" "youmail@gmail.com" 
#        echo "Nginx was reloaded"
        exit 1
    else
#      echo "The passenger status has no errors."
       exit 0
    fi
