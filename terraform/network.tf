provider "aws" {
  region = "us-west-2"  # Change this to your desired region
}

resource "aws_vpc" "example_vpc" {
  cidr_block = "10.0.0.0/16"  # Change this to your desired VPC CIDR block
}

resource "aws_subnet" "public_subnet_a" {
  vpc_id     = aws_vpc.example_vpc.id
  cidr_block = "10.0.1.0/24"  # Change this to your desired subnet CIDR block for AZ a
  availability_zone = "us-west-2a"  # Change this to your desired availability zone for AZ a
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet_a"
  }
}

resource "aws_subnet" "public_subnet_b" {
  vpc_id     = aws_vpc.example_vpc.id
  cidr_block = "10.0.2.0/24"  # Change this to your desired subnet CIDR block for AZ b
  availability_zone = "us-west-2b"  # Change this to your desired availability zone for AZ b
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet_b"
  }
}
