#create security group
resource "aws_security_group" "terraform_sg" {
    name = "allow ssh"
    description = "sg for to allow ssh"
    vpc_id = aws_vpc.my_vpc.id 
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_block = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "Terraform-sg"
    }
}
