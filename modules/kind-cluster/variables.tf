variable "ami_id" {
  description = "The AMI ID to use for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "The name of the SSH key pair"
  type        = string
}

variable "kubernetes_version" {
  description = "The version of Kubernetes to use"
  type        = string
  default     = "v1.24.0"
}

variable "ssh_private_key_path" {
  description = "Path to the SSH private key to use for remote-exec"
  type        = string
}