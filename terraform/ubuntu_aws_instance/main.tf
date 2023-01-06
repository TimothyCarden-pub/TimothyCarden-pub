provider "aws" {
  region = "us-west-2"
}

terraform {
  backend "s3" {
    bucket         = "idevops-terraform-backend"
    key            = "global/s3/timothy.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform_state_locking"
    encrypt        = true
  }
}

resource "aws_instance" "carden_flask" {
  ami           = "ami-03f8756d29f0b5f21"
  key_name      = "padawan"
  instance_type = "t3.micro"
  tags = {
    Name = "<Carden-Timothy>"
  }
  vpc_security_group_ids = [aws_security_group.allow_ssh_timothy.id]
  availability_zone = var.availabilityZones
}

output "ec2_ip" {
  value = aws_instance.carden_flask.public_ip
}

resource "aws_security_group" "allow_ssh_timothy" {
  name        = "allow_ssh_timothy"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpcid

  ingress {
    description      = "ssh from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "http port"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh_timothy"
  }
}

resource "aws_lb" "lb" {
  name                       = "${var.appName}-LB"
  internal                   = false
  ip_address_type            = "ipv4"
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.allow_ssh_timothy.id]
  subnets                    = var.subnets
  enable_deletion_protection = false
  tags = {
    Name = "${var.appName}-LB"
  }
}

resource "aws_lb_target_group" "lb-target-group" {
  name        = "${var.appName}-LB-TG"
  port        = var.port
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpcid

  health_check {
    path                = "/"
    port                = var.port
    healthy_threshold   = 6
    unhealthy_threshold = 2
    timeout             = 2
    interval            = 5
    matcher             = var.hcstatuscode
  }

  tags = {
    Name = "${var.appName}-LB-TG"
  }
}

resource "aws_lb_target_group_attachment" "lb-attachment" {
  target_group_arn = aws_lb_target_group.lb-target-group.arn
  target_id        = aws_instance.carden_flask.id
  port             = var.port
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.lb.arn
  # port              = 443
  # protocol          = "HTTPS"
  port              = var.port
  protocol          = "HTTP"
  # ssl_policy        = "ELBSecurityPolicy-2016-08"
  # certificate_arn   = var.acmarn
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb-target-group.arn
  }
}

output "private-dns" {
  value = aws_instance.carden_flask.private_dns
}

output "instance-id" {
  value = aws_instance.carden_flask.id
}

output "aws-lb-dns" {
  value = aws_lb.lb.dns_name
}

output "aws_route_53-fqdn" {
  value = aws_route53_record.www.fqdn
}

resource "aws_route53_record" "www" {
  zone_id         = var.hostedZone
  name            = "tcarden.idevops.io"
  type            = "CNAME"
  ttl             = 60
  records         = [aws_lb.lb.dns_name]
  allow_overwrite = true
}