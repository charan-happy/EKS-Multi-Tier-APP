

resource "aws_key_pair" "charan_eks_key" {
  key_name   = "charan-eks-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC/O4BTEefLquSBc//HbVwZJ/JXGRj83n8jfimvbt8WOwE8Mf9DhwmbDykF6iO6Agb065dJGQWWZ9tTknaR03eSU01kh66bZYIiy5zdqiIaGBwyGmykTqKDA+ev5+fwK+H+2z3bUt/ZupVgGXM9jF5bm3LSvZ/QmoFXX4g3cPneKMXJydIzqJ3bmkUKrF8sCJmT9CeKbQZBDcojBqaHVU6igTOsfceVfAoEzlZmWwmKlypoWUR+sfekX856XfF06TXn6Of+3ebKMOirh/O/MNxU0YArO7m175fyPpN+XMHn89i1EFXLF/xFbocgcI7frgpDTGkUlYAHnHt4vQfEuiyvvLKBAEkanvy+/IVozRRV1DvsuPUvK92jB730pEgEMsDvPYuJ7wWSlfA/eXfUq4Xhj9Rf8L0XhMIJqBxrXydJAhZE2q3TxlN6azm7Jbn+3qLHGYxv61WZ1uw8J0aDvkrmTXhm+qaAyE5rKaPuKTa2syg0ebWy+V+AVU0KF7I3gGQyO6my6sEOyk828IGUAGThtEhY2xuLvaU48qoQTB2Ue0CfkhIBWmybuaK8aZGQD7FvIS6WawiWIAQVeDlPdytNzN3Zpb8iwpIqBuanv0m3vVdJxkoxgqOy3r/rV9Kr/nR4EhSgU2sM4DAYdIVqZP1rqBoFFNfIRfaMsXvZZ4375Q== Nagac@NagacharanWorld"
}

# Bootstrap IAM User Access
resource "aws_eks_access_entry" "charan" {
  cluster_name  = module.eks.cluster_name
  principal_arn = "arn:aws:iam::533267421594:user/Terraform-practice"
  type          = "STANDARD"
  depends_on = [ module.eks ]
}

resource "aws_eks_access_policy_association" "charan_admin" {
  cluster_name  = module.eks.cluster_name
  principal_arn = "arn:aws:iam::533267421594:user/Terraform-practice"
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  access_scope {
    type = "cluster"
  }
  depends_on = [aws_eks_access_entry.charan]
}


module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = var.vpc_id
  subnet_ids      = var.subnets
  cluster_endpoint_public_access = true
  eks_managed_node_groups = {
    workers = {
      desired_capacity = var.desired_capacity
      max_capacity     = var.max_capacity
      min_capacity     = var.min_capacity
      instance_type    = var.instance_type
      key_name         = aws_key_pair.charan_eks_key.key_name
      subnets          = var.subnets
    }
  }
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}