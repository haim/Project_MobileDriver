#!/bin/bash

echo $1
echo $2
echo $3

java -jar $1cucumber-sandwich.jar -f $2 -o $3