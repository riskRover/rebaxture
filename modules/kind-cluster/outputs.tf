output "kind_config_yaml" {
  description = "The rendered kind-config.yaml"
  value       = data.template_file.kind_config.rendered
}

output "control_plane_ip" {
  description = "The private IP of the control-plane EC2 instance"
  value       = data.aws_instance.control_plane_ip.private_ip
}

output "worker_node_1_ip" {
  description = "The private IP of worker-node-1 EC2 instance"
  value       = data.aws_instance.worker_node_1_ip.private_ip
}

output "worker_node_2_ip" {
  description = "The private IP of worker-node-2 EC2 instance"
  value       = data.aws_instance.worker_node_2_ip.private_ip
}