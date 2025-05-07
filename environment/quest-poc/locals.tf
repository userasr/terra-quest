locals {
  project_name = "quest"
  environment = "poc"
  #Please provide valid VPC ID below:
  vpc_id     = "vpc-000000000000"
  #Please update the CIDR block for the above VPC:
  vpc_cidr_block = ["10.0.0.0/16"]
  #Please provide the subnet Ids belonging to the above VPC(DO NOT PROVIDE SUBNET ID FOR AZ-c AS T2.MICRO IS NOT SUPPORTED):
  vpc_subnet_ids = ["subnet-000000000000", "subnet-000000000000"]
  ami_id = "ami-062f0cc54dbfd8ef1"
  instance_type = "t2.micro"
  key_name = "test"
  #Please provide correct certificate ARN:
  ssl_certificate_arn = "arn:aws:acm:ap-south-1:000000000000:certificate/00000000-0000-0000-0000-000000000000"
  #docker pull dockerasr/rearc-quest:v1
  docker_image_tag = "v1"
}
