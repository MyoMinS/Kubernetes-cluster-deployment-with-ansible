output "ip" {
  value = aws_instance.ec2_kubernetes_cluster[*].public_ip
}