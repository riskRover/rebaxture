module "kind_cluster" {
  source = "./modules/kind-cluster"

  ami_id              = "ami-0c55b159cbfafe1f0"  # Replace with the correct AMI
  instance_type       = "t2.micro"
  key_name            = "my-ssh-key"
  kubernetes_version  = "v1.24.0"
  ssh_private_key_path = "~/.ssh/my-ssh-key.pem"
}

output "kind_config_yaml" {
  value = module.kind_cluster.kind_config_yaml
}

output "control_plane_ip" {
  value = module.kind_cluster.control_plane_ip
}

output "worker_node_1_ip" {
  value = module.kind_cluster.worker_node_1_ip
}

output "worker_node_2_ip" {
  value = module.kind_cluster.worker_node_2_ip
}