variable "region" {
    default = "us-east-1"
}

variable "zone1" {
    default = "us-east-1a"
}

variable "zone2" {
    default = "us-east-1b"
}

variable "instance_type" {
    default = "t3.micro"
}

variable "AMI" {
    default = {
        us-east-l = "ami-0ecb62995f68bb549"
    }
}