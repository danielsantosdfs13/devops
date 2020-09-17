# Descrição do projeto

Objetivo: Criar um ambiente utilizando o menor nível de ação interativa/manual possível.

Como a entrega deste desafio solicitou apenas um repositorio no github, realizei a separação dos codigos em branch separadas:

## Branches

| Nome                  |  Descrição                                                                                                                        | Workflow        |
| :-------------------  |  ---------------------------------------------------------------------------------------------                                    | --------        |
| IAC                   |  Responsável pela criação dos recursos como (VPC, EKS, ECR...) utilizando terraform                                               | ci-iac.yml      |
| FRONTEND-FOO          |  Responsável por armazenar o codigo fonte da aplicação frontend-foo e realizar o CI/CD da mesma                                   | ci-frontend.yml |
| FRONTEND-FOO-DEV      |  Simular uma branch qualquer do repositório frontend-foo, caso a estrutura desse desafio fosse separada em mais de um repositório | ci-frontend.yml |
| BACKEND-FOO           |  Responsável por armazenar o codigo fonte da aplicação backend-foo e realizar o CI/CD da mesma                                    | ci-backend.yml  |
| BACKEND-FOO-DEV       |  Simular uma branch qualquer do repositório backend-foo, caso a estrutura desse desafio fosse separada em mais de um repositório  | ci-backend.yml  |

## Requisitos obrigatórios

Para funcionamento correto dessa stack, são necessários a criação / definição dos recursos na AWS (Route 53, EC2 KeyPair)

# Descrição branch FRONTEND-FOO e FRONTEND-FOO-DEV

Codigo fonte da aplicação frontend-foo. Para qualquer push realizado na branch FRONTEND-FOO-DEV será realizado CI/CD e entregue para o ambiente de HML, já para os push realizados na branch FRONTEND-FOO simulando a branch master de qualquer repositório, será entregue para o ambiente PRD.

## Variáveis obrigatórias

| Nome                  | Origem  | Opcional ? | Descrição                                                                                     |
| :-------------------  | :-----: | :--------: | --------------------------------------------------------------------------------------------- |
| AWS_ACCESS_KEY_ID     |  Projeto (Secrets)   |    NÃO     | ID da chave de acesso para realizar acões na AWS                                 |
| AWS_SECRET_ACCESS_KEY |  Projeto (Secrets)   |    NÃO     | Segredo da chave de acesso para realizar acões na AWS                            |
| frontend_REPO_NAME    |  Projeto (Secrets)   |    NÃO     | Nome do repositorio ECR a ser utilizado pela aplicação frontend-foo              |
| FRONTEND_REPO_NAME    |  Projeto (Secrets)   |    NÃO     | Nome do repositorio ECR a ser utilizado pela aplicação frontend-foo              |
| URL_BASE_FRONTEND_HML |  Projeto (Secrets)   |    NÃO     | Url base para ambiente não produtivo                                             |
| URL_BASE_FRONTEND_PRD |  Projeto (Secrets)   |    NÃO     | Url base para ambiente produtivo                                                 |
| ROUTE_53_ZONE_ID      |  Projeto (Secrets)   |    NÃO     | ID da zona de dns a ser utilizada pela stack                                     |

## Pipeline de CI

Etapas: 
- Criar imagem docker no repositório ECR com as tags (latest e commit_id) para ambiente produtivo e (latest) para ambiente não produtivo
- Realizar implantação da aplicação utilizando helm no kubernetes utilizando namespace (prd) para ambiente produtivo e (hml) para ambiente não produtivo
- Atualizar registro DNS na zona de dns utilizada pela stack

## Descrição das aplicações

### frontend-foo

| Item                  | Valor                                                 | Descrição ? |
| :-------------------  | :-----:                                               | :--------:  |
| Engine                |  Node.js                                              |    N/A      |
| Porta                 |  8080                                                 |    Porta tcp configurada na aplicação      |
| Path (PRD)            |  http://`<URL_BASE_FRONTEND_PRD>`/                    |    NÃO      |
| Path (HML)            |  http://`<URL_BASE_FRONTEND_HML>`/                    |    NÃO      |
| Helm values (PRD)     |  src/kubernetes/prd-values.yaml                       |    NÃO      |
| Helm values (HML)     |  src/kubernetes/values.yaml                           |    NÃO      |
| Dockerfile            |  src/dockerfile                                       |    NÃO      |