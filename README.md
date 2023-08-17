# Chat-App-using-Socket.io
A simple chat app using socket.io
  
See it in action - [Kunal Chat App](https://kunal-chat-app.herokuapp.com)

1.	Install the dependencies for use terraform, all of these can be found at https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
2.	Create and folder named terraform, we will work inside of these.
3.	Create a file named provider.tf 
4.	Fill the file provider.tf with the region, that in this case is “us-west-2”
5.	Create a file named vpc.tf 
6.	In the file of vpc.tf make a resource named “aws_vpc” “vpc”, inside will have the cidr_block. Also we have to make anothers instance named "aws_internet_gateway" "internet-gateway", also "aws_subnet"     "public-subnet-a", in this case we need to use 2 subnet for having two EC2 instances. 
7.	Create a file named ec2.tf.
8.	ec2.tf will have inside the configurations for connect to the ec2 instances, we create a resource named "aws_instance" "ec2-instance-a", in this case also we will make two of them, havind inside the ami, the instance_type and the subnet_id.
9.	Create a file named load_balance.tf.
10.	Load_balance.tf will have inside a resource "aws_lb" "load-balancer" that will have the type of load_balancer, the security_groups.id and subnets.id.
11.	Also is needed a resource for load balancer listener that will have load_balancer_arn and a target_group_arn inside a default action, this will start a communication between load_balancer and target_group, is also required resource "aws_lb_target_group_attachment" "targer-group-attachment-a" and a “b” one, for connect target_group and instance.

