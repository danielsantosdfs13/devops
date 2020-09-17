# Descrição

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
