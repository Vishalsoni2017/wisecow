#!/bin/bash

echo "Enter Application URL with http/https"
read URL

IsApplicationUP(){

    http_status_code=$(curl -s -o /dev/null -w "%{http_code}" $URL) # -s for silent mode prevent error msg |-o output of http redirect to /dev/null which is null file | -w specifies a custom format for the output, including only the HTTP status code

    if [ "$http_status_code" -eq 200 ]; 
    then
        echo "Application $URL is Up & Http status code is : $http_status_code"
    else 
        echo "Application $URL is down & Http status code is : $http_status_code"
    fi
}

IsApplicationUP

