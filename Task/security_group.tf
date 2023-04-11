# ---- security group for ssh

resource "aws_security_group" "terra_sq" {
  name        = "project-sq"
  description = "security group for bastion server"
  vpc_id      = module.network.vpc_id
  tags = {
    Name = "terraform_sq_22"
  }

}
#----------- inbound traffic

# allow ssh from anywhere
resource "aws_security_group_rule" "sg_inbound_allow_all_Ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.terra_sq.id
}

# security group for 3000 port
resource "aws_security_group" "terra_sq2" {
  name        = "project-sq2"
  description = "security group open port 3000"
  vpc_id      = module.network.vpc_id
  tags = {
    Name = "terraform_sq_3000"
  }

}
#------------------- inbound traffic

#allow http traffic at port 8080
resource "aws_security_group_rule" "sg_inbound_allow_http" {
  type              = "ingress"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  cidr_blocks       = [var.vpc_cidr]
  security_group_id = aws_security_group.terra_sq2.id
}