#!/bin/bash

AMI_ID="ami-09c813fb71547fc4f"
SG_ID="sg-0499ce052d4a6c9a2"
INSTANCES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "frontend")
ZONE_ID="Z041097235OVJ7AUAD5IE"
DOMAINE_NAME="srivenkata.shop"



for instance in "${INSTANCES[@]}"
do
    # Launch an EC2 instance
    INSTANCE_ID=$(aws ec2 run-instances \
        --image-id "$AMI_ID" \
        --instance-type t2.micro \
        --security-group-ids "$SG_ID" \
        --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$instance}]" \
        --query "Instances[0].InstanceId" --output text)
    
    echo "Launched instance '$instance' with Instance ID: $INSTANCE_ID"

    if [ "$instance" != "frontend" ]; then
        # Retrieve private IP for non-frontend
        IP=$(aws ec2 describe-instances \
            --instance-ids "$INSTANCE_ID" \
            --query "Reservations[0].Instances[0].PrivateIpAddress" --output text)
    else
        # Retrieve public IP for frontend
        IP=$(aws ec2 describe-instances \
            --instance-ids "$INSTANCE_ID" \
            --query "Reservations[0].Instances[0].PublicIpAddress" --output text)
    fi

    echo "$instance IP address: $IP"
done
