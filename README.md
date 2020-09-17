
# Descrição

Realizar criacão dos recursos base de infraestrutura para funcionamento da stack foo.

## Requisitos obrigatórios

Para funcionamento correto dessa stack, são necessários a criação / definição do recurso na AWS (EC2 KeyPair), após a execução da pipeline das branches:

-   FRONTEND-FOO-DEV
-   FRONTEND-FOO
-   BACKEND-FOO-DEV
-   BACKEND-FOO

Será retornado o endereço de DNS que você irá precisar configurar em sua zona de DNS.

```
Print loadbalancer endpoint
Run kubectl get svc devops-ingress-ingress-nginx-controller | awk 'NR>1 {print $4}'
abf2af26f0f784567b0643074d2613d4-1804244159.us-east-1.elb.amazonaws.com
```

## Variáveis obrigatórias

| Nome                    | Origem  | Opcional ? | Descrição                                                                                     |
| :-------------------    | :-----: | :--------: | --------------------------------------------------------------------------------------------- |
| AWS_ACCESS_KEY_ID       |  Projeto (Secrets)   |    NÃO     | ID da chave de acesso para realizar acões na AWS                                 |
| AWS_SECRET_ACCESS_KEY   |  Projeto (Secrets)   |    NÃO     | Segredo da chave de acesso para realizar acões na AWS                            |
| BACKEND_REPO_NAME       |  Projeto (Secrets)   |    NÃO     | Nome do repositorio ECR a ser utilizado pela aplicação backend-foo               |
| FRONTEND_REPO_NAME      |  Projeto (Secrets)   |    NÃO     | Nome do repositorio ECR a ser utilizado pela aplicação backend-foo               |
| URL_BASE_FRONTEND_HML   |  Projeto (Secrets)   |    NÃO     | Url base para ambiente não produtivo                                             |
| URL_BASE_FRONTEND_PRD   |  Projeto (Secrets)   |    NÃO     | Url base para ambiente produtivo                                                 |
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