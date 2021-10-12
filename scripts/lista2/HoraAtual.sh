#!/bin/bash

hh=$(date +%H) # hour, 0~23
#hh=$1
MM=$(date +%M) # min

if [ $hh -lt 12 ] # AM
then
  PP="AM"
  if [ $hh -lt 6 ] # night
  then
    CC="Boa noite"
  else #morning
    CC="Bom dia"
  fi
else # PM
  PP="PM"
  if [ $hh -lt 18 ] #afternoon
  then
    CC="Boa Tarde"
  else # evening
    CC="Boa noite"
  fi
fi

HH=$(expr 1 + $(expr $(expr $hh + 11) % 12))

echo $CC
echo "$HH:$MM $PP"

