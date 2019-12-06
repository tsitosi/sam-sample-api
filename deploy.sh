#!/bin/bash

# VARS
CFN_STACK_NAME="STACKNAME"
AWS_REGION="eu-west-1"
ARTIFICAT_BUCKET="BUCKET-NAME"

# PACKAGE
sam package --template-file infra/template.yaml \
    --s3-bucket ${ARTIFICAT_BUCKET} \
    --output-template-file infra/packaged.yaml \
    --region ${AWS_REGION}

# DEPLOY
sam deploy --template-file infra/packaged.yaml \
    --stack-name ${CFN_STACK_NAME} \
    --region ${AWS_REGION} \
    --capabilities CAPABILITY_IAM