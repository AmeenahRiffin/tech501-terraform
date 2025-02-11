# create an ec2 instance
# where to create it - provide cloud name
provider "aws" {
# what region to use (where to create these resources)
    region = "eu-west-1" # we're setting this to ireland
}
# which service to create/resources
resource "aws_instance" "app_instance" {
# which AMI ID
    ami = "ami-0c1c30571d2dae5c9"

# which type of instance
    instance_type = "t3.micro"

# that we want a public ip
    associate_public_ip_address = true

# name the service/instance
    tags = {
        Name = "tech501-ameenah-terraform-app"
    }
}

# aws_access_key = "This is not to be hardcoded"
# aws_secret_key = "This is not to be hardcoded"
# aws profile = "This is not to be hardcoded"

# name of the service/instance
# tag the service/instance

