resource "aws_security_group" "vm_sg" {
  name        = "${var.project}-vm-sg"
  description = "vm security group"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name    = "${var.project}-vm-sg"
    Project = var.project
  }
}

resource "aws_security_group_rule" "vm_in_ssh" {
  security_group_id = aws_security_group.vm_sg.id
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "vm_out_http" {
  security_group_id = aws_security_group.vm_sg.id
  type              = "egress"
  protocol          = "tcp"
  from_port         = 80
  to_port           = 80
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "vm_out_https" {
  security_group_id = aws_security_group.vm_sg.id
  type              = "egress"
  protocol          = "tcp"
  from_port         = 443
  to_port           = 443
  cidr_blocks       = ["0.0.0.0/0"]
}