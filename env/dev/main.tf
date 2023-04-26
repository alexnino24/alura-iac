module "aws-dev" {
    source = "../../infra" 
    instancia = "t2.micro"
    regiao_aws = "us-east-2"
    chave = "iac-DEV"
    grupo_de_seguranca = "DEV"
    minino = 0
    maximo = 10
    nomeGrupo = "Dev"
}

output "IP" {
    value = module.aws-dev.ip_publico
}