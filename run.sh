#!/bin/bash
read -p "Please enter the Organisation id: " org_id
cat <<EOF > ./vars.tfvars
org_id = "$org_id"
api = ["cloudresourcemanager.googleapis.com" ,"compute.googleapis.com","recommender.googleapis.com", "securitycenter.googleapis.com", "orgpolicy.googleapis.com", "sqladmin.googleapis.com", "monitoring.googleapis.com", "pubsub.googleapis.com"]
EOF
terraform init
terraform apply -var-file="vars.tfvars" -auto-approve
echo "Approved"