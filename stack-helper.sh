#! /bin/bash

# Set Default region
REGION=us-west-2

function create_stack () {
  STACK_NAME=$1
  TEMPLATE_BODY=$2
  PARAMETERS=$3
  AWS_PROFILE=${AWS_PROFILE} # get from environment

  # Use region set in env if available
  if [[ ! -z ${AWS_REGION} ]]; then
    REGION=${AWS_REGION}
  fi

  if [[ ! -z $AWS_PROFILE ]]; then
    # Check if AWS_PROFILE is set in ENV and use it
    aws cloudformation create-stack --stack-name $STACK_NAME --region=$REGION --template-body file://$TEMPLATE_BODY --parameters file://$PARAMETERS --profile $AWS_PROFILE
  else
    # Use default AWS Profile
    aws cloudformation create-stack --stack-name $STACK_NAME --region $REGION --template-body file://$TEMPLATE_BODY --parameters file://$PARAMETERS
  fi
  # aws cloudformation create-stack --stack-name $STACK_NAME --template-body file://$PARAMETERS  --parameters file://$3 --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=us-east-1
}

function update_stack () {
  STACK_NAME=$1
  TEMPLATE_BODY=$2
  PARAMETERS=$3
  AWS_PROFILE=${AWS_PROFILE}

  # Use region set in env if available
  if [[ ! -z ${AWS_REGION} ]]; then
    REGION=${AWS_REGION}
  fi

  if [[ ! -z $AWS_PROFILE ]]; then
    aws cloudformation update-stack --stack-name $STACK_NAME --region $REGION --template-body file://$TEMPLATE_BODY  --parameters file://$PARAMETERS --profile $AWS_PROFILE
  else 
     aws cloudformation update-stack --stack-name $STACK_NAME --region $REGION --template-body file://$TEMPLATE_BODY  --parameters file://$PARAMETERS
  fi
}

function delete_stack () {
  STACK_NAME=$1
  if [[ ! -z ${AWS_PROFILE} ]]; then
    aws cloudformation delete-stack --stack-name $STACK_NAME --profile $AWS_PROFILE
  else
    aws cloudformation delete-stack --stack-name $STACK_NAME
  fi
}

function describe_stack () {
  STACK_NAME=$1
  AWS_PROFILE=${AWS_PROFILE}

  if [[ ! -z $AWS_PROFILE ]]; then
    aws cloudformation delete-stack --stack-name $STACK_NAME --profile $AWS_PROFILE
  else 
    aws cloudformation delete-stack --stack-name $STACK_NAME
  fi
}

function list_stack () {
  AWS_PROFILE=${AWS_PROFILE}

  if [[ ! -z $AWS_PROFILE ]]; then
    aws cloudformation list-stacks --profile $AWS_PROFILE
  else
    aws cloudformation list-stacks
  fi
}
