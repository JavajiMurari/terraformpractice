#1. Create VPC
# -------------------------------
resource "aws_vpc" "prod" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "prod_vpc"
  }
}

# -------------------------------
# 2. Create Public Subnet
# -------------------------------
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.prod.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "prod_public_subnet"
  }
}

# -------------------------------
# 3. Create Private Subnet
# -------------------------------
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.prod.id
  cidr_block        = "10.0.1.0/24"

  tags = {
    Name = "prod_private_subnet"
  }
}

# -------------------------------
# 4. Create Internet Gateway
# -------------------------------
resource "aws_internet_gateway" "prod" {
  vpc_id = aws_vpc.prod.id

  tags = {
    Name = "prod_ig"
  }
}

# -------------------------------
# 5. Create Route Table for Public Subnet
# -------------------------------
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.prod.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod.id
  }

  tags = {
    Name = "prod_public_rt"
  }
}

# -------------------------------
# 6. Associate Public Subnet with Route Table
# -------------------------------
resource "aws_route_table_association" "public_assoc" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id      = aws_subnet.public.id
}

# -------------------------------
# 7. Create Security Group
# -------------------------------
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = aws_vpc.prod.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}