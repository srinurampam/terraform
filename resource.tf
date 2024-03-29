resource "aws_vpc" "Main" {                
   cidr_block       = var.main_vpc_cidr     
   instance_tenancy = "default"

          tags   =  {
       Name     = "my_vpcT"

}
 }

 resource "aws_internet_gateway" "IGW" {    
    vpc_id =  aws_vpc.Main.id    

          tags   =  {
       Name     = "my_igwT"

}           
 }

 
 resource "aws_subnet" "publicsubnets" {    
   vpc_id =  aws_vpc.Main.id
   cidr_block = "${var.public_subnets}"

          tags   =  {
       Name     = "my_subT"

}        
 }
     
 resource "aws_route_table" "PublicRT" {    
    vpc_id =  aws_vpc.Main.id
         route {
    cidr_block = "0.0.0.0/0"               
    gateway_id = aws_internet_gateway.IGW.id

     }
 }

 resource "aws_route_table_association" "PublicRTassociation" {
    subnet_id = aws_subnet.publicsubnets.id
    route_table_id = aws_route_table.PublicRT.id
 }
 
