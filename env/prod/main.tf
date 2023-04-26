module "aws-prod" {
    source = "../../infra"
    instancia = "t2.micro"
    regiao_aws = "us-east-2"
    chave = "iac-PROD"
    grupo_de_seguranca = "Producao"
    minimo = 1
    maximo = 10
    nomeGrupo = "Prod"
}

