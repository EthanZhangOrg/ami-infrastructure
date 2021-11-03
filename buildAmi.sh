#!/bin/bash

./packer build \
    -var 'aws_access_key=${{ secrets.AWS_ACCESS_KEY_ID }}' \
    -var 'aws_secret_key=${{ secrets.AWS_SECRET_ACCESS_KEY }}' \
    -var 'subnet_id=${{ secrets.SUBNET_ID }}' \
    -var 'source_ami=${{ secrets.SOURCE_AMI }}' \
    -var 'ami_users=${{ secrets.AMI_USERS }}' \
    ami.json