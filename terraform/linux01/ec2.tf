#automatically grabs the latest ubuntu 18.04(bionic) ami 
data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}
resource "aws_instance" "linux01"{
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro" #size of instance
  key_name        = "ansible"
  vpc_security_group_ids = [data.terraform_remote_state.vpc.outputs.ansible_sg] #using the data resource "vpc"
  subnet_id = data.terraform_remote_state.vpc.outputs.public_subnet[0] #using the data resource "vpc"
}

