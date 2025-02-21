data "aws_key_pair" "name" {
  key_name = "ansible"
  include_public_key = true
}

data "aws_security_group" "name" {
    filter {
    name = "tag:Name"
    values = ["Web"]
}
}
data "aws_subnet" "name" {
  filter {
    name = "tag:Name"
    values = ["subnet1"]
  }
}
