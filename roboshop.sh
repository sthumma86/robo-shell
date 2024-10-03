#!/bin/bash

#script to create EC2 instances automatically .
#using for loop


AMI=ami-0b4f379183e5706b9
SG_ID=sg-01f91316b0bb612cb #replace with your securitygroup id
INSTANCES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payments" "dispatch" "web") # array datatype

for i in "${INSTANCES[@]}"
do
    echo "Instance is: $i"

    if [ $i == "mongodb" ] || [ $i == "mysql" ] || [ $i == "shipping" ]
    then 
        INSTANCE_TYPE="t3.small"
    else
        INSTANCE_TYPE="t2.micro"
    fi

    aws ec2 run-instances --image-id $AMI --instance-type $INSTANCE_TYPE --security-group-ids sg-01f91316b0bb612cb --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]"

done

