# ---------------------------------------------
# VPC
# ---------------------------------------------
resource "aws_vpc" "vpc" {
  cidr_block                       = "192.168.0.0/20"
  instance_tenancy                 = "default"
  enable_dns_support               = true
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = false

  tags = {
    Name    = "${local.project}-vpc"
    Project = local.project
  }
}

# ---------------------------------------------
# Subnet
# ---------------------------------------------
resource "aws_subnet" "public_subnet_1a" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = "ap-northeast-1a"
  cidr_block              = "192.168.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name    = "${local.project}-public-subnet-1a"
    Project = local.project
    Type    = "public"
  }
}

# ---------------------------------------------
# Route table
# ---------------------------------------------
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name    = "${local.project}-public-rt"
    Project = local.project
    Type    = "public"
  }
}

resource "aws_route_table_association" "public_rt_1a" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id      = aws_subnet.public_subnet_1a.id
}

# ---------------------------------------------
# Internet gateway
# ---------------------------------------------
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name    = "${local.project}-igw"
    Project = local.project
  }
}

resource "aws_route" "public_rt_igw_r" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}