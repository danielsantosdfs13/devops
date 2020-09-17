# Descrição

Realizar criacão dos recursos base de infraestrutura para funcionamento da stack foo.

## Variáveis

| Nome                 | Origem  | Opcional ? | Descrição                                                                                      |
| :-------------------  | :-----: | :--------: | --------------------------------------------------------------------------------------------- |
| EKS_CLUSTER_NAME      |  inputs/terraform.tfvars  |    NÃO     | Nome do cluster EKS a ser criado.                                           |
| REGION                |  inputs/terraform.tfvars  |    NÃO     | Região AWS a ser utilizada.                                                 |
| AWS_ACCESS_KEY_ID     |  Projeto (Secrets)        |    NÃO     | ID da chave de acesso para realizar acões na AWS                            |
| AWS_SECRET_ACCESS_KEY |  Projeto (Secrets)        |    NÃO     | Segredo da chave de acesso para realizar acões na AWS                       |
| BACKEND_REPO_NAME     |  Projeto (Secrets)        |    NÃO     | Nome do repositorio ECR a ser utilizado pela aplicação backend-foo           |
| FRONTEND_REPO_NAME    |  Projeto (Secrets)        |    NÃO     | Nome do repositorio ECR a ser utilizado pela aplicação frontend-foo          |

## Pipeline CI-IAC

Responsável por realizar uma avaliação do estado desejado pelo usuário e o que existe atualmente de infraestrutura, criando e alterando o que for necessário.

Será criado os seguintes componentes:

-   vpc
-   security group
-   nat gateway
-   iam roles
-   eks
-   eks managed node