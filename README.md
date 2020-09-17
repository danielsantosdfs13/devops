# Descrição

Este projeto contem os arquivos que simulam uma pipeline CI/CD com intuíto de realizar provisionamento de um cluster Kubernetes (AWS EKS) utilizando terraform, provisionamento de duas aplicacões demo (backend e frontend).

## Variáveis

| Nome                 | Origem  | Opcional ? | Descrição                                                                                      |
| :-------------------  | :-----: | :--------: | --------------------------------------------------------------------------------------------- |
| EKS_CLUSTER_NAME      |  inputs/terraform.tfvars  |    NÃO     | Nome do cluster EKS a ser criado.                                           |
| REGION                |  inputs/terraform.tfvars  |    NÃO     | Região AWS a ser utilizada.                                                 |
| AWS_ACCESS_KEY_ID     |  Projeto (Secrets)        |    NÃO     | ID da chave de acesso para realizar acões na AWS                            |
| AWS_SECRET_ACCESS_KEY |  Projeto (Secrets)        |    NÃO     | Segredo da chave de acesso para realizar acões na AWS                       |
| BACKEND_REPO_NAME     |  Projeto (Secrets)        |    NÃO     | Nome do repositorio ECR a ser utilizado pela aplicação backend-foo           |
| FRONTEND_REPO_NAME    |  Projeto (Secrets)        |    NÃO     | Nome do repositorio ECR a ser utilizado pela aplicação frontend-foo          |

## Pipeline de CI

### Stage: Prepare

Responsável por realizar uma avaliação do estado desejado pelo usuário e o que existe atualmente de infraestrutura, criando e alterando o que for necessário.

### Stage: Build

Responsável realizar a imagem docker para as aplicações (backend-foo e frontend-foo) e inserir no repositorio ECR criado pelo estágio `Prepare`

### Stage: Deploy

Responsável por implantar dentro do Kubernetes: 

-   Ingress Controller
-   Aplicação frontend-foo e backend-foo

## Descrição das aplicações

### frontend-foo


| Item                  | Valor                                                 | Descrição ? |
| :-------------------  | :-----:                                               | :--------:  |
| Diretorio             |  application/frontend-foo                             |    Código fonte da aplicação      |
| Engine                |  Node.js                                              |    N/A      |
| Porta                 |  8080                                                 |    Porta tcp configurada na aplicação      |
| Path (PRD)            |  http://`<LoadBalancer>`/prd/                         |    NÃO      |
| Path (HML)            |  http://`<LoadBalancer>`/hml/                         |    NÃO      |
| Helm values (PRD)     |  application/frontend-foo/kubernetes/prd-values.yaml  |    NÃO      |
| Helm values (HML*)    |  application/frontend-foo/kubernetes/values.yaml      |    NÃO      |
| Dockerfile            |  application/frontend-foo/kubernetes/values.yaml      |    NÃO      |