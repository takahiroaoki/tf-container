# ---------------------------------------------
# Key pair
# ---------------------------------------------
resource "aws_key_pair" "keypair" {
  key_name   = "${local.project}-keypair"
  public_key = file("./credential/${local.project}-keypair.pub")

  tags = {
    Name    = "${local.project}-keypair"
    Project = local.project
  }
}

# ---------------------------------------------
# EC2 instance
# ---------------------------------------------
resource "aws_instance" "app" {
  ami                         = data.aws_ami.grpc_sample.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_subnet_1a.id
  associate_public_ip_address = true
  vpc_security_group_ids = [
    aws_security_group.app_sg.id
  ]
  key_name = aws_key_pair.keypair.key_name
  user_data = base64encode(data.template_file.user_data.rendered)
  user_data_replace_on_change = true

  tags = {
    Name    = "${local.project}-app"
    Project = local.project
    Type    = "app"
  }
}

// AMI generated by https://github.com/takahiroaoki/packer-container
data "aws_ami" "grpc_sample" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["grpc-sample-ami-*"]
  }
}

data "template_file" "user_data" {
  template = file("./resource/user_data.tmpl.sh")

  vars = {
    db_host     = aws_db_instance.mysql_standalone.address
    db_port     = aws_db_instance.mysql_standalone.port
    db_database = aws_db_instance.mysql_standalone.db_name
    db_user     = aws_db_instance.mysql_standalone.username
    db_password = random_string.db_password.result
  }
}