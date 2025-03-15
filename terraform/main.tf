provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "ec2_kubernetes_cluster" {
  ami = lookup(var.ami,var.os)
  instance_type = "t2.micro"
  key_name = data.aws_key_pair.name.key_name
  subnet_id = data.aws_subnet.name.id
  security_groups = [data.aws_security_group.name.id]
  tags = {
    "Env" = "Kubernetes"
    "Name" = "Kubernetes_Cluster"
  }
  count = 2
}
