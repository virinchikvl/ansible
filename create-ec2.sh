#!/bin/bash

NAMES=("Mongodb" "Cart" "Users")
INSTANCE_TYPE=""
SECURITY_GROUP="sg-0aa143e518dfb2e87"
IMAGE_ID="0f3c7d07486cad139"
for i in "${NAMES[@]}"
do 
		if [[ $i == "mongodb" || $i == "mysql" ]]
		then 
				INSTANCE_TYPE="t3.medium"
				else
				INSTANCE_TYPE="t2.micro"
        fi       
		echo " creating  $i instance" 
		    IP_ADDRESS=$(aws ec2 run-instances --image-id $IMAGE_ID --instance-type $INSTANCE_TYPE  --security-group-ids $SECURITY_GROUP |  jq -r '.Instances[0].PrivateIpAddress' )
		echo " created  $i instance : $IP_ADDRESS" 
done
