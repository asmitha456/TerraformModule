provider "aws" {
    region = var.region
}
resource "aws_instance" "ec2" {
    ami = "var.ami"
    instance_type = var.instance_type
    subnet_id = aws_subnet.public_subnet.id
    security_group_ids = aws_security_group.terraform_sg.id
    user_data = <<-EOF
                #!/bin/bash
                apt update -y
                apt install httpd -y
                systemctl start httpd.service
                echo "</h1> Automate an instances using terraform modules</h1>" > /var/www/html/index.html
                EOF
    tags = {
        Name = "EC2-instance"
    }
}

output "PublicIP" {
    value = aws_instance.ec2.public_ip
}
