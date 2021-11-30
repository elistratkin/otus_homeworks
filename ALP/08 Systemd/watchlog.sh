#!/bin/bash

WORD=$1
LOG=$2
DATE=`date`

if grep $WORD $LOG &> /dev/null
then
   logger "$DATE: I Am Groot"
else
   exit 0
fi
