#!/bin/bash

while read str
do
  if [[ $str == *"name"* ]]; then
    str=${str#*:}
    echo -n $str
    echo -ne '\t \t'
  fi

  if [[ $str == *"ip"* ]]; then
    str=${str#*:}
    echo $str
  fi
done < /vagrant/hosts.yaml

