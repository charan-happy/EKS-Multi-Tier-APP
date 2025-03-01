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
  default = ["subnet-0e422dc910ebb1aa7", "subnet-0b28c981edfc3b2b0"]
}

variable "vpc_id" {
  description = "VPC ID"
  default = "vpc-0ebdbf4bfda1aaff5"
  
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
  default = "t3.medium"
}





