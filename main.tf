# create an ec2 instance
# where to create it - provide cloud name
provider "aws" {
# what region to use (where to create these resources)
    region = var.region # we're setting this to ireland
}
# which service to create/resources
resource "aws_instance" "app_instance" {
# which AMI ID
    ami = var.ami_id

# which type of instance
    instance_type = var.instance_type

# that we want a public ip
    associate_public_ip_address = true

# name the service/instance
    tags = {
        Name = var.instance_name
    }

# use the security group
    vpc_security_group_ids = [aws_security_group.tech501-ameenah-tf-allow-port-22-3000-80.id]

# which key to use
    key_name = var.key_name
}

## Adds the security group as per the requirements i'm naming this appropriately,
resource "aws_security_group" "tech501-ameenah-tf-allow-port-22-3000-80" {
    name = var.security_group_name
    description = "Security group allowing ports 22, 3000, and 80"

# allow port 22 from localhost
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = var.port_22_cidr # This is localhost, but it will only work on the machine that is running Terraform. 
        # It works for logging into the AWS if I use 0.0.0.0/0 instead, as I have tested.
    }

# port 3000 rule
    ingress {
        from_port = 3000
        to_port = 3000
        protocol = "tcp"
        cidr_blocks = var.port_3000_cidr
    }

# allow port 80 from all
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = var.port_80_cidr
    }
}



# aws_access_key = "This is not to be hardcoded"
# aws_secret_key = "This is not to be hardcoded"
# aws profile = "This is not to be hardcoded"

