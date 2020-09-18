# Premissas 

Para funcionamento correto da pipeline utilizado nessa branch configurar o remote state para o terraform persistir o estado do ambiente em um bucket s3, essa configuração é feita no arquivo `src/terraform/main.tf`

```
terraform {
  backend "s3" {
    bucket = "devops-tf-remote-state-aws"
    key    = "terraform/devops_state"
    region = "us-east-1"
  }
}
```

Além das variáveis obrigatórias descritas em sequência.


# Descrição

Realizar criação dos recursos base de infraestrutura para funcionamento da stack foo.

## Variáveis obrigatórias

| Nome                    |  Origem  | Opcional ? | Descrição                                                                                                  |
| :-------------------    | :----------: | :--------: | ---------------------------------------------------------------------------------------------              |
| AWS_ACCESS_KEY_ID       |  Projeto (Secrets)   |    NÃO     | ID da chave de acesso para realizar acões na AWS                                              |
| AWS_SECRET_ACCESS_KEY   |  Projeto (Secrets)   |    NÃO     | Segredo da chave de acesso para realizar acões na AWS                                         |
| EC2_KEY_PAIR_EKS_WORKER |  Projeto (Secrets)   |    NÃO     | Nome da key pair a ser utilizada para acesso remoto aos workers do eks                        |
| EKS_CLUSTER_NAME        |  Projeto (Secrets)   |    NÃO     | Nome do cluster AWS EKS a ser criado                                                          |
| REMOTE_ACCESS_SSH_CIDR  |  /src/terraform/variables.tf   |    SIM     | Lista de endereços permitido para acesso remoto via ssh aos workers do cluster eks  |
| VPC_NAME                |  /src/terraform/variables.tf   |    SIM     | Nome da VPC a ser utilizada pelo cluster EKS  |
| VPC_CIDR                |  /src/terraform/variables.tf   |    SIM     | Address space a ser utilizado na VPC  |
| VPC_PRIVATE_SUBNETS                |  /src/terraform/variables.tf   |    SIM     | Definição das subnetes privadas para VPC  |
| VPC_PUBLIC_SUBNETS                |  /src/terraform/variables.tf   |    SIM     | Definição das subnetes publicas para VPC  |
| VPC_ENABLE_NAT_GATEWAY                |  /src/terraform/variables.tf   |    SIM     | Habilitar criação de um nat gateway para a VPC  |
| VPC_SINGLE_NAT_GATEWAY                |  /src/terraform/variables.tf   |    SIM     | Utilizar único nat gateway para VPC  |
| VPC_ENABLE_DNS_HOSTNAMES                |  /src/terraform/variables.tf   |    SIM     | Utilizar único nat gateway para VPC  |

## Pipeline CI-IAC

Responsável por realizar uma avaliação do estado desejado pelo usuário e o que existe atualmente de infraestrutura, criando e alterando o que for necessário.

Será criado os seguintes componentes:

-   vpc
-   security group
-   nat gateway
-   iam roles
-   eks
-   eks managed node
