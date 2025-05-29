#This is my Dev Infra

module "dev-infra" {
    source = "./infra-app"

   env                = "dev"
   bucket_name        = "my-dev-bucket"
   instance_count     = 1
   instance_type      = "t2.micro"
   ec2_ami_id        = "ami-0df368112825f8d8f" # Ubuntu 20.04 LTS AMI in eu-west-1
   hash_key           = "studentID"
}

module "prod-infra" {
    source = "./infra-app"

   env                = "prod"
   bucket_name        = "my-prod-bucket"
   instance_count     = 2
   instance_type      = "t2.medium"
   ec2_ami_id        = "ami-0df368112825f8d8f" # Ubuntu 20.04 LTS AMI in eu-west-1
   hash_key           = "studentID"
}

module "stag-infra" {
    source = "./infra-app"

   env                = "stag"
   bucket_name        = "my-stag-bucket"
   instance_count     = 1
   instance_type      = "t2.small"
   ec2_ami_id        = "ami-0df368112825f8d8f" # Ubuntu 20.04 LTS AMI in eu-west-1
   hash_key           = "studentID"
}