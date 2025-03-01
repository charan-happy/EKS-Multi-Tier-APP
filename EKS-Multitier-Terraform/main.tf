# provider configuration
provider "aws" {
  region = var.region
  
}

# Create an EKS cluster
module "eks" {
  source = "terraform-aws-modules/eks/aws"
  cluster_name = var.cluster_name
    cluster_version = var.cluster_version
    vpc_id = var.vpc_id
    subnet_ids = var.subnets
    eks_managed_node_groups = {
      workers = {
        desired_capacity = var.desired_capacity
        max_capacity     = var.max_capacity
        min_capacity     = var.min_capacity
        instance_type    = var.instance_type
        key_name         = var.key_name
        subnets          = var.subnets
      }
    
    }

}

  output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}