data "aws_ami" "Latest_Ubuntu_22" {
  owners = ["099720109477"]
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "ec2" {
    ami = data.aws_ami.Latest_Ubuntu_22.id
    instance_type = "t2.micro"   
    user_data = "${file("${var.file_data}")}"   
    tags = {
      Name = var.instance_name
    }
}