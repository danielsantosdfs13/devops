# Descrição

Realizar criacão dos recursos base de infraestrutura para funcionamento da stack foo.

## Variáveis obrigatórias

| Nome                    | Origem  | Opcional ? | Descrição                                                                                     |
| :-------------------    | :-----: | :--------: | --------------------------------------------------------------------------------------------- |
| AWS_ACCESS_KEY_ID       |  Projeto (Secrets)   |    NÃO     | ID da chave de acesso para realizar acões na AWS                                 |
| AWS_SECRET_ACCESS_KEY   |  Projeto (Secrets)   |    NÃO     | Segredo da chave de acesso para realizar acões na AWS                            |
| EC2_KEY_PAIR_EKS_WORKER |  Projeto (Secrets)   |    NÃO     | Nome da key pair a ser utilizada para acesso remoto aos workers do eks           |

## Pipeline CI-IAC

Responsável por realizar uma avaliação do estado desejado pelo usuário e o que existe atualmente de infraestrutura, criando e alterando o que for necessário.

Será criado os seguintes componentes:

-   vpc
-   security group
-   nat gateway
-   iam roles
-   eks
-   eks managed node
