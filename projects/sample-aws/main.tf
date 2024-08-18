provider "aws" {
  profile = "terraform"
  region = "ap-northeast-1"
}

resource "aws_instance" "sample-by-terraform" {
  ami = "ami-0091f05e4b8ee6709"
  instance_type = "t2.micro"
  tags = {
    "Name" = "hello"
  }
}