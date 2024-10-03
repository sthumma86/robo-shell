#!/bin/bash

#script to create EC2 instances automatically .
#using for loop


AMI=ami-0b4f379183e5706b9
SG_ID=sg-01f91316b0bb612cb #replace with your securitygroup id
INSTANCES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payments" "dispatch" "web") # array datatype

for in in "${INSTANCES[@]}"
do
    echo "instance is: $i"
    if [$i == "mongodb" || ] [$i == "mysql" || ] [$i == "shiipping" || ]
    then 
        INSTANCE_TYPE="t3.small"
    else
        INSTANCE_TYPE="t2.micro"
    fi

    aws ec2 run-instances --image-id ami-0b4f379183e5706b9 --count 1 --instance-type $INSTANCE_TYPE --security-group-ids sg-01f91316b0bb612cb 

done

