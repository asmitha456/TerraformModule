module "ec2" {
    source = "./ec2-instance"
}

module "s3" {
    source = "./s3-bucket"
}

module "vpc" {
    source = "./vpc"
}

module "sg" {
    source = "./sg"

}
