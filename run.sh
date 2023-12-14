#!/bin/bash
echo "Please ensure you have the necessary IAM permissions .The execution of this script requires following user account permissions: "
echo "- Organization level Security Admin Role"
echo "- Service Usage Admin" 
read -p "Please enter the Organisation id: " org_id
cat <<EOF > ./vars.tfvars
org_id = "$org_id"
api = ["cloudresourcemanager.googleapis.com" ,"compute.googleapis.com","recommender.googleapis.com", "securitycenter.googleapis.com", "orgpolicy.googleapis.com", "sqladmin.googleapis.com", "monitoring.googleapis.com", "pubsub.googleapis.com"]
EOF
terraform init
terraform apply -var-file="vars.tfvars" -auto-approve
echo "Approved"

