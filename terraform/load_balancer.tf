resource "aws_lb" "example_lb" {
  name               = "example-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups   = [aws_security_group.example_sg.id]
  subnets            = [aws_subnet.public_subnet_a.id, aws_subnet.public_subnet_b.id]
}

resource "aws_lb_listener" "example_lb_listener" {
  load_balancer_arn = aws_lb.example_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.example_tg.arn
    type             = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Hello, this is a sample response."
      status_code  = "200"
    }
  }
}

resource "aws_lb_target_group" "example_tg" {
  name        = "example-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.example_vpc.id
}

resource "aws_instance" "example_instance" {
  ami           = "ami-04e35eeae7a7c5883"  # Change this to your desired AMI ID
  instance_type = "t2.micro"  # Change this to your desired instance type
  subnet_id     = aws_subnet.public_subnet_a.id
  security_groups = [aws_security_group.example_sg.id]

  // Add other instance-specific settings here
}

resource "aws_lb_target_group_attachment" "example_tg_attachment" {
  target_group_arn = aws_lb_target_group.example_tg.arn
  target_id        = aws_instance.example_instance.id
  port             = 80
}
