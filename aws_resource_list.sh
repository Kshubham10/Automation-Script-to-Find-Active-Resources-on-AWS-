#!/bin/bash


################################################################################
# This script lists all AWS resources in the specified region using AWS CLI.
# Author: Shubham/DevOps Engineer
# Supported Services: EC2, S3, RDS, Lambda, IAM, DynamoDB, CloudFormation, VPC, CloudWatch, SNS, SQS, EBS, EKS, Route53, CloudFront
# Usage: ./aws_resource_list.sh <region> <service_name>
# Example: ./aws_resource_list.sh us-east-1 ec2
################################################################################

# Check if the required arguments are provided

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <region> <service_name>"
    exit 1
fi

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Please install it and try again."
    exit 1
fi

# Check if AWS CLI is configured
if [ ! -d ~/.aws ]; then
    echo "AWS CLI is not configured. Please configure it using 'aws configure' and try again."
    exit 1
fi  

# Execute the AWS CLI command to list resources based on the service name
case $2 in
    ec2)
        aws ec2 describe-instances --region $1
        ;;
    s3)
        aws s3api list-buckets --query "Buckets[].Name"
        ;;
    rds)
        aws rds describe-db-instances --region $1
        ;;
    lambda)
        aws lambda list-functions --region $1
        ;;
    iam)
        aws iam list-users
        ;;
    dynamodb)
        aws dynamodb list-tables --region $1
        ;;
    cloudformation)
        aws cloudformation describe-stacks --region $1
        ;;
    vpc)
        aws ec2 describe-vpcs --region $1
        ;;
    cloudwatch)
        aws cloudwatch describe-alarms --region $1
        ;;
    sns)
        aws sns list-topics --region $1
        ;;
    sqs)
        aws sqs list-queues --region $1
        ;;
    ebs)
        aws ec2 describe-volumes --region $1
        ;;
    eks)
        aws eks list-clusters --region $1
        ;;
    route53)
        aws route53 list-hosted-zones
        ;;
    cloudfront)
        aws cloudfront list-distributions
        ;;
    *)
        echo "Unsupported service name. Supported services are: ec2, s3, rds, lambda, iam, dynamodb, cloudformation, vpc, cloudwatch, sns, sqs, ebs, eks, route53, cloudfront."
        exit 1
        ;;
esac
