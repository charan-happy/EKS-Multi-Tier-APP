variable "region" {
  description = "AWS region"
  default = "us-east-1"
  
}
variable "cluster_name" {
  description = "EKS cluster name"
  default = "charan-eks-cluster"
  
}

variable "cluster_version" {
  description = "EKS cluster version"
  default = "1.28"
}

variable "subnets" {
  description = "Subnets"
  default = ["subnet-0b1e7b7b4b1b1b1b1", "subnet-0b1e7b7b4b1b1b1b2"]
}

variable "vpc_id" {
  description = "VPC ID"
  default = "vpc-0b1e7b7b4b1b1b1b1"
  
}

variable "desired_capacity" {
  description = "Desired capacity of the worker nodes"
  default = 2
}

variable "max_capacity" {
  description = "Maximum capacity of the worker nodes"
  default = 3
}

variable "min_capacity" {
  description = "Minimum capacity of the worker nodes"
  default = 1
}

variable "instance_type" {
  description = "Instance type of the worker nodes"
  default = "t2.micro"
}

variable "key_name" {
  description = "Key name for the worker nodes"
  default = "charan-eks-key"
}



