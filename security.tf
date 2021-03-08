resource "aws_security_group" "general_sg" {
  description = "HTTP, HTTPS and ICMP egress to anywhere"
  vpc_id      = aws_vpc.main.id
  tags = var.compute_instance_tag
}

resource "aws_security_group" "bastion_sg" {
  description = "SSH ingress to Bastion and SSH egress to App"
  vpc_id      = aws_vpc.main.id
  tags = var.compute_instance_tag
}

resource "aws_security_group" "app_sg" {
  description = "SSH ingress from Bastion and all TCP traffic ingress from ALB Security Group"
  vpc_id      = aws_vpc.main.id
  tags = var.compute_instance_tag
}


resource "aws_security_group" "rds_sg" {
  description = "rdp ingress access from app instance to rds"
  vpc_id      = aws_vpc.main.id
  tags = var.compute_instance_tag
}

resource "aws_security_group_rule" "out_http" {
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.general_sg.id
}

resource "aws_security_group_rule" "out_ssh_bastion" {
  type                     = "egress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.bastion_sg.id
  source_security_group_id = aws_security_group.app_sg.id
}

resource "aws_security_group_rule" "out_internet_app" {
  type              = "egress"
  description       = "Allow TCP internet traffic egress from app layer"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.app_sg.id
}

resource "aws_security_group_rule" "in_ssh_bastion_from_anywhere" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.bastion_sg.id
}

resource "aws_security_group_rule" "in_ssh_app_from_bastion" {
  type                     = "ingress"
  description              = "Allow SSH from a Bastion Security Group"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.app_sg.id
  source_security_group_id = aws_security_group.bastion_sg.id
}

resource "aws_security_group_rule" "rds_access" {
  type                     = "ingress"
  description              = "Allow rdp ingress from a app ec2 instance Security Group"
  from_port                = 3389
  to_port                  = 3389
  protocol                 = "rdp"
  security_group_id        = aws_security_group.rds_sg.id
  source_security_group_id = aws_security_group.app_sg.id   
}