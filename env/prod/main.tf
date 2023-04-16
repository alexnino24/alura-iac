module "aws-prod" {
    source = "../../infra"
    instancia = "t2.micro"
    regiao_aws = "us-east-2"
    chave = "iac-PROD"
}

output "ip" {
    value = module.aws-prod.ip_publico
}