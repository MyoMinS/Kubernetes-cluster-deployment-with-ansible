terraform {
  backend "s3" {
    bucket = "terraform-state-file-store-mms"
    key = "ec2_kubernetes_cluster.tf.state"
    region = "ap-southeast-1"
  }
}