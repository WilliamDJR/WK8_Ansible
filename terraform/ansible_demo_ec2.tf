data "aws_ami" "ubuntu22" {
    most_recent = true
    owners = ["099720109477"] # Canonical
    filter {
      name   = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu*22.04*"]
    }    
}

resource "aws_instance" "example" {
    for_each = toset(["example","jenkins-master", "jenkins-node"])
  
    ami = data.aws_ami.ubuntu22.id
    
    instance_type = "t2.micro"
    key_name = "${aws_key_pair.deployer.key_name}"
  
    tags = {
      Name  = each.value
      Project = "JRAnsible"
    }
}

resource "aws_key_pair" "deployer" {
  key_name   = "ansible-deployer-key"
  public_key = file("${var.public_key_file_path}") 
}

resource "aws_security_group_rule" "allow_80" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = var.default_security_group_id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_8080" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = var.default_security_group_id
  cidr_blocks       = ["0.0.0.0/0"]
}
