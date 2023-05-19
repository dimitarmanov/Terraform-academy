variable "aws_region" {
  type        = string
  default     = "eu-west-1"
  description = "AWS Region"

}

variable "cidr_block" {
    type = map(string)
    default = {
      "full_network" = "10.0.12.0/24"
      "first_subnet" = "10.0.12.0/25"
    }
}

variable "all_ip" {
    type = string
    default = "0.0.0.0/0"
    description = "Allow connection to/from all IP"
  
}

variable "instance_size" {
    type = map(string)
    default = {
      "micro" = "t2.micro"
    }
  
}
variable "company" {
    type = string
    description = "Company name for resource tagging"
    default = "Dma.Inc"
}

variable "project" {
    type = string
    description = "Project name for resource tagging"
    default = "DevOps Project"
}

# 10.0.12.0/24