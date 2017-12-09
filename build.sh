#!/bin/bash

# install puppet modules locally
echo 'Installing necessary puppet modules'
cd puppet/
r10k puppetfile install

# run packer template
echo 'Running packer template'
cd ../packer/
packer build -var-file=variables.json template.json | tee packer_output
ami=`awk '/amazon-ebs: AMI:/{print $3}' packer_output`
echo "AMI ID: ${ami}"
rm -f packer_output

# run terraform configuration
echo 'Running terraform configuration'
cd ../terraform/
terraform init
terraform apply -var "ami=`echo $ami`"
