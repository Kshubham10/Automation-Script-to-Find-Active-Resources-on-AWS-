# Automation-Script-to-Find-Active-Resources-on-AWS-
In this project we are going to create a script which will list all the active resources of the services in a specific region.
This script can be used by manager, any developer or anyone who is interested in understanding what are the active resources on the AWS account.
We will put the name of this script " aws_resource_list.sh"
In this script they have to pass two parameters, one will be the region and other will be service.
For example someone run this script followed by <us-east1> followed by <EC2>, it will list out all the active EC2 instances in us-east1 region.
This kind of scripts are very helpfull when we want to do cost-optimization in our organization.
We can also run this as a cron job and email report will be send to the management. 
