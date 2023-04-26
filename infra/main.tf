terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = var.regiao_aws
}

resource "aws_instance_template" "maquina" {
  image_id           = "ami-0a695f0d95cefc163"
  instance_type = var.instancia

  key_name = var.chave
  tags = {
    Name = "Terraform Ansible Python"
  }
  security_group_names = [var.grupo_de_seguranca]
  user_data = filebase64("ansible.sh")
}

resource "aws_key_pair" "chaveSSH" {
  key_name = var.chave
  public_key = file("${var.chave}.pub")
}

resource "aws_autoscaling_group" "grupo" {
  availability_zones = ["${var.regiao_aws}a" , "${var.regiao_aws}b"]
  name = var.nomeGrupo
  max_size = var.maximo
  min_size = var.minimo
   launch_template {
     id = aws_launch_template.maquina.id
     version = "$Latest"
   }
  
}
resource "aws_default_subnet" "subnet_1" {
  availability_zone = "${var.regiao_aws}a"
  
}
resource "aws_default_subnet" "subnet_2" {
  availability_zone = "${var.regiao_aws}b"
  
}