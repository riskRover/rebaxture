resource "aws_security_group" "kind_sg" {
  name        = "kind-sg"
  description = "Security group for KIND cluster EC2 instances"

  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 2375
    to_port     = 2375
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "kind-sg"
  }
}

# EC2 instances for control-plane and worker nodes
resource "aws_instance" "control_plane" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = [aws_security_group.kind_sg.name]

  tags = {
    Name = "control-plane"
  }
}

resource "aws_instance" "worker_node_1" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = [aws_security_group.kind_sg.name]

  tags = {
    Name = "worker-node-1"
  }
}

resource "aws_instance" "worker_node_2" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = [aws_security_group.kind_sg.name]

  tags = {
    Name = "worker-node-2"
  }
}

# Fetch private IPs of EC2 instances
data "aws_instance" "control_plane_ip" {
  instance_id = aws_instance.control_plane.id
}

data "aws_instance" "worker_node_1_ip" {
  instance_id = aws_instance.worker_node_1.id
}

data "aws_instance" "worker_node_2_ip" {
  instance_id = aws_instance.worker_node_2.id
}

# Generate kind-config.yaml dynamically using the template
data "template_file" "kind_config" {
  template = file("${path.module}/kind-config.tpl")

  vars = {
    control_plane_ip = data.aws_instance.control_plane_ip.private_ip
    worker_node_1_ip = data.aws_instance.worker_node_1_ip.private_ip
    worker_node_2_ip = data.aws_instance.worker_node_2_ip.private_ip
    kubernetes_version = var.kubernetes_version
  }
}

# Output the rendered kind-config.yaml content
output "kind_config_yaml" {
  value = data.template_file.kind_config.rendered
}

# Optionally, write the kind-config.yaml to a local file
resource "local_file" "kind_config" {
  content  = data.template_file.kind_config.rendered
  filename = "${path.module}/kind-config.yaml"
}

# Create Docker network on each instance using remote-exec
resource "null_resource" "docker_network_control_plane" {
  provisioner "remote-exec" {
    inline = [
      "docker network create --driver bridge kind-net"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file(var.ssh_private_key_path)
      host        = aws_instance.control_plane.public_ip
    }
  }

  depends_on = [aws_instance.control_plane]
}

resource "null_resource" "docker_network_worker_1" {
  provisioner "remote-exec" {
    inline = [
      "docker network create --driver bridge kind-net"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file(var.ssh_private_key_path)
      host        = aws_instance.worker_node_1.public_ip
    }
  }

  depends_on = [aws_instance.worker_node_1]
}

resource "null_resource" "docker_network_worker_2" {
  provisioner "remote-exec" {
    inline = [
      "docker network create --driver bridge kind-net"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file(var.ssh_private_key_path)
      host        = aws_instance.worker_node_2.public_ip
    }
  }

  depends_on = [aws_instance.worker_node_2]
}