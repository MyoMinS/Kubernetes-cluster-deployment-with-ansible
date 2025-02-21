resource "terraform_data" "id" {
  provisioner "local-exec" {
    command = <<EOT
      sed -i '' "s/^master ansible_host=.*/master ansible_host=$master_IP/" kube_inventory
      sed -i '' "s/^worker1 ansible_host=.*/worker1 ansible_host=$worker1_IP/" kube_inventory
      sed -i '' "s/^worker2 ansible_host=.*/worker2 ansible_host=$worker2_IP/" kube_inventory
      sed -i '' "s/^worker3 ansible_host=.*/worker3 ansible_host=$worker3_IP/" kube_inventory
      sleep 30
      ansible-playbook -i kube_inventory main.yml
    EOT
    environment = {
      master_IP = aws_instance.ec2_kubernetes_cluster[0].public_ip
      worker1_IP = aws_instance.ec2_kubernetes_cluster[1].public_ip
      worker2_IP = aws_instance.ec2_kubernetes_cluster[2].public_ip
      worker3_IP = aws_instance.ec2_kubernetes_cluster[3].public_ip
    }
    working_dir = abspath("../playbooks")
  }
}