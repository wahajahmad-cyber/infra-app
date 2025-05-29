variable "env" {
    description = "dev"
    type        = string
  
}

variable "bucket_name" {
    description = "This the bucket name of my infrastructure"
    type        = string
  
}

variable "instance_count" {
    description = "Number of EC2 instances to create"
    type        = number
  
}

variable "instance_type" {
    description = "Type of EC2 instance"
    type        = string
    default     = "t2.micro"
}

variable "ec2_ami_id" {
    description = "AMI ID for the EC2 instance"
    type        = string
  
}

variable "hash_key" {
    description = "Hash key for my Infra App"
    type        = string
  
}
