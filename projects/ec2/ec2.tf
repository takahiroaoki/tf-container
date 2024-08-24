# ---------------------------------------------
# Key pair
# ---------------------------------------------
resource "aws_key_pair" "keypair" {
  key_name   = "${var.project}-keypair"
  public_key = file("./credential/ec2-keypair.pub")

  tags = {
    Name    = "${var.project}-keypair"
    Project = var.project
  }
}

# ---------------------------------------------
# EC2 instance
# ---------------------------------------------
resource "aws_instance" "ec2" {
  ami                         = data.aws_ami.app.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnet_1a.id
  associate_public_ip_address = true
  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]
  key_name = aws_key_pair.keypair.key_name

  tags = {
    Name    = "${var.project}-ec2"
    Project = var.project
    Type    = "ec2"
  }
}