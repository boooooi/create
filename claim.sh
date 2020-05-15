#!/bin/bash

sleepCounter="3"
loopCounter="1000" # Select amount of wallets (iterations) script will create

echo "########################################## Starting $loopCounter script iterations for creating wallets"

i="0"

while [ $i -lt $loopCounter ] # Number of total loops
do
ACC=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1) # bash generate random 10 character alphanumeric string (lowercase only)
echo "Account name: $ACC"
./hmy keys add $ACC | tee -a new_wallets
i=$[$i+1]
wait &
sleep 1 
done
