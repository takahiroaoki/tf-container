resource "aws_security_group" "ec2_sg" {
  name        = "${local.project}-ec2-sg"
  description = "ec2 security group"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name    = "${local.project}-ec2-sg"
    Project = local.project
  }
}

resource "aws_security_group_rule" "ec2_in_ssh" {
  security_group_id = aws_security_group.ec2_sg.id
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ec2_out_http" {
  security_group_id = aws_security_group.ec2_sg.id
  type              = "egress"
  protocol          = "tcp"
  from_port         = 80
  to_port           = 80
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ec2_out_https" {
  security_group_id = aws_security_group.ec2_sg.id
  type              = "egress"
  protocol          = "tcp"
  from_port         = 443
  to_port           = 443
  cidr_blocks       = ["0.0.0.0/0"]
}