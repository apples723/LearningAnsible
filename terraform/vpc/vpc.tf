#creates a vpc for the purpose of this demo
#only has 1 public subnet
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.77"

  name = "ansible-vpc"
  cidr = "192.168.10.0/24"  
  azs = ["us-west-1a"]
  public_subnets  = ["192.168.10.0/24"]

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
      "Enviornment" = "Sandbox"
  }
}
resource "aws_security_group" "ansible" {
  name        = "ansible-tst"
  vpc_id      = module.vpc.vpc_id
ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}
 egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}
output "vpc_id" {
    value = module.vpc.vpc_id
  
}
output "public_subnet" {
    value = module.vpc.public_subnets
}
output "ansible_sg" {
    value = aws_security_group.ansible.id
}
