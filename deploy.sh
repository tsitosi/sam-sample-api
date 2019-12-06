#!/bin/bash

CFN_STACK_NAME="myApi"
AWS_REGION="eu-west-1"
ARTIFICAT_BUCKET="marcuram-ireland"

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