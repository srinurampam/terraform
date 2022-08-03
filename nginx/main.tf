resource "aws_instance" "web" {

  instance_type = "t2.micro"
  ami           = "ami-068257025f72f470d"
  user_data     = file("init-nginx.sh")
  key_name      = "terraform"
  vpc_security_group_ids = [aws_security_group.web-sg.id]


          tags   =  {
       Name     = "my_instance"

}
 }
 resource "aws_security_group" "web-sg" {
  
  ingress {
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
}
