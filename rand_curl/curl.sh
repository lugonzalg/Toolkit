#!/bin/bash

function call
{
    str="$1:$2:$3"
    url="https://plataforma.ibizasmartisland.com:443/api/v1/$UPS/telemetry"
    echo $str
    echo $url
    curl -X 'POST' \
      $url \
      #'http://212.227.169.80:8080/api/v1/$UPS/telemetry' \
      -H 'accept: application/json' \
      -H 'Content-Type: application/json' \
      -d "{\"data_mydata\":\"$str\"}"
}

function tmpCurl
{
  curl -X 'POST' \
  'https://plataforma.ibizasmartisland.com:443/api/v1/$UPS/attributes' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '"string"'
}
    #"data_mydata":"11670:-30.0:40.0"
#function new_curl
#{
#    str=$(($RANDOM % 100))
#   echo $str
#    curl -X 'POST' \
##      'http://212.227.169.80:8080/api/v1/$UPS/telemetry' \
#      -H 'accept: application/json' \
#      -H 'Content-Type: application/json' \
#      -d '{Amp_hour:10}'
#}

#function camara
#{
    #str=$(($RANDOM % 100))
#    for elem in $@; do
#        echo $elem
#    done
#    curl -X 'POST' \
#      "http://212.227.169.80:8080/api/v1/$UPS/telemetry" \
#      -H 'accept: application/json' \
#      -H 'Content-Type: application/json' \
#      -d "{\"data_mydata\":\"C:$1,$2\"}"
#      #-d '{"C":"12,3"}'
#}

while true; do
    val1=$(($RANDOM % 1300))
    val2=$(($RANDOM % 1500))
    val3=$(($RANDOM % 1500))
    call $val1 $val2 $val3
    #camara $val1 $val2
    sleep 10
done
