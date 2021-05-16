#! /bin/bash

# common scripts to help with managing stacks

# Create stack
aws cloudformation create-stack --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --stack-name udagram --template-body file://cloudformation.yml

