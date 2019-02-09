This repo creates Network Infrastructure on AWS with public and private subents, create Jenkins and an App Server.

Steps -

1. create a s3 bucket on AWS and save the bucket name.
2. checkout the repo on your local machine
3. make sure you have terraform installed on your local
4. create aws credentials for the user.
5. create AWS config and credentials file at location ~/.aws and replace aws_access_key and aws_secret_access_key values from previous step.

cat ~/.aws/config
[default]
region=us-east-1

cat ~/.aws/credentials
[default]
aws_access_key_id=xxxxx
aws_secret_access_key=xxxx

6. Update the s3 bucket name in file src/infra-pipeline/dev/tf-backend.tf with the name you created in step 1
7. change directory to src/infra-pipeline/dev and run below commands.

terraform init
terraform plan
terraform apply --auto-approve

8. once successful copy the public_ip from output on console and use any browser to acess Jenkins server.
http://"public_ip_of_jenkins_instance":8080

**How to deploy petclinic app on Appserver**
1. Create a jenkins freestyle project. Configure the scm repo with link https://github.com/kanaskaa/dev-infra.git
2. Under the command section, use execute shell option and add below command to it.
   ansible-playbook -i hosts main.yml --ask-become-pass
3. Run the jenkins jobs and check if it got executed succesfully.

**Note**
* On the app server you might need to configure login access for dockerhub as the docker images are stored in dockerhub.
