# personal-aws-server
Automate the build and configuration of my personal aws server.

### Aim
The aim is to use puppet, packer and terraform, to configure and launch an EC2 instance using existing Elastic IP. Ideally, a replacement personal server should be launched without disruption to the old one, if it still exists.

### Features
Server will have the following features:
- git repo for SpaceHorse2.0 project, content served via Apache.
- Jenkins server with job to pull latest codes changes for SpaceHorse project. Triggered from push to git repo. Jenkins served via Apache reverse proxy, under 'jenkins.\*' subdomain.

### Prerequisites
You will need the following installed locally:
- Packer

### Setup
If you have configured your aws credentials using aws-cli, simply run:  
`packer build template.json`  
Alternatively, you can use a variable file (see 'blank_variables.json'):  
`packer build -var-file=variables.json template.json`
