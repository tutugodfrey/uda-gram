#! /bin/bash

# common scripts to help with managing stacks

# Create vpc stack
aws cloudformation create-stack --stack-name udagram-vpc-stack --template-body file://vpc-stack.yml

# Create stack
aws cloudformation create-stack --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --stack-name udagram --template-body file://cloudformation.yml

