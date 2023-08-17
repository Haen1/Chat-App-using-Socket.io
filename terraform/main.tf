
resource "aws_security_group" "example_sg" {
  vpc_id = aws_vpc.example_vpc.id
}

resource "aws_launch_configuration" "example_lc" {
  name_prefix   = "example-lc-"
  image_id      = "ami-04e35eeae7a7c5883"
  instance_type = "t2.micro"

  security_groups = [aws_security_group.example_sg.id]
}

resource "aws_autoscaling_group" "example_asg" {
  name                 = "example-asg"
  launch_configuration = aws_launch_configuration.example_lc.name
  min_size             = 2
  max_size             = 3
  desired_capacity     = 2

  vpc_zone_identifier = [aws_subnet.public_subnet_a.id, aws_subnet.public_subnet_b.id]
}




