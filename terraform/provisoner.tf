resource "terraform_data" "id" {
  provisioner "local-exec" {
    command = <<EOT
      sed -i '' "s/^master ansible_host=.*/master ansible_host=$master_IP/" kube_inventory.conf
      sed -i '' "s/^worker1 ansible_host=.*/worker1 ansible_host=$worker1_IP/" kube_inventory.conf
      sleep 30
      ansible-playbook -i kube_inventory.conf main.yml
    EOT
    environment = {
      master_IP = aws_instance.ec2_kubernetes_cluster[0].public_ip
      worker1_IP = aws_instance.ec2_kubernetes_cluster[1].public_ip
    }
    working_dir = abspath("../playbooks")
  }
}