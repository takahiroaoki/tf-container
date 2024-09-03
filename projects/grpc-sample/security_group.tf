# ---------------------------------------------
# Security group: app server
# ---------------------------------------------
resource "aws_security_group" "app_sg" {
  name        = "${local.project}-app-sg"
  description = "app security group"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name    = "${local.project}-app-sg"
    Project = local.project
  }
}

resource "aws_security_group_rule" "app_in_ssh" {
  security_group_id = aws_security_group.app_sg.id
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "app_out_tcp3306" {
  security_group_id        = aws_security_group.app_sg.id
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = 3306
  to_port                  = 3306
  source_security_group_id = aws_security_group.db_sg.id
}

# ---------------------------------------------
# Security group: db server
# ---------------------------------------------
resource "aws_security_group" "db_sg" {
  name        = "${local.project}-db-sg"
  description = "database role security group"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name    = "${local.project}-db-sg"
    Project = local.project
  }
}

resource "aws_security_group_rule" "db_in_tcp3306" {
  security_group_id        = aws_security_group.db_sg.id
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = 3306
  to_port                  = 3306
  source_security_group_id = aws_security_group.app_sg.id
}