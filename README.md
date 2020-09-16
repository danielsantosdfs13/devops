## Será avaliado:

- Organização
- Qualidade da documentacão
- Uso de ferramentas de automatização
- Elegância na solução proposta
- Simplicidade e eficiência
- Técnicas e boas práticas de segurança

# Documentacão

Este projeto contem os arquivos que simulam uma pipeline CI/CD com intuíto de realizar provisionamento de um cluster Kubernetes (AWS EKS) utilizando terraform, provisionamento de duas aplicacões demo (backend e frontend).

## Requisitos:

- Ambiente Cloud (AWS)
- Infraestrutura básica de rede (firewall, subnets, etc)
- Load Balancer
- Aplicação Web: pode ser qualquer tipo de aplicação que demonstre a utilização de Docker e conteúdo estático
- Resolução de DNS para o Load Balancer
- Automatização do processo de build da Aplicação Web e implantação de todos os recursos no serviço cloud utilizado
- Documentação detalhada e instruções para execução em ambiente real (produção e desenvolvimento).

| Nome                 | Origem  | Opcional ? | Descrição                                                                                      |
| :-------------------  | :-----: | :--------: | --------------------------------------------------------------------------------------------- |
| EKS_CLUSTER_NAME      |  inputs/terraform.tfvars  |    NÃO     | Nome do cluster EKS a ser criado.                                           |
| REGION                |  inputs/terraform.tfvars  |    NÃO     | Região AWS a ser utilizada.                                                 |
| AWS_ACCESS_KEY_ID     |  Projeto (Secrets)        |    NÃO     | ID da chave de acesso para realizar acões na AWS                            |
| AWS_SECRET_ACCESS_KEY |  Projeto (Secrets)        |    NÃO     | Segredo da chave de acesso para realizar acões na AWS                       |
| BACKEND_REPO_NAME     |  Projeto (Secrets)        |    NÃO     | Nome do repositorio ECR a ser utilizado pela aplicaão backend-foo           |
| FRONTEND_REPO_NAME    |  Projeto (Secrets)        |    NÃO     | Nome do repositorio ECR a ser utilizado pela aplicaão frontend-foo          |

## Stage: Prepare

Responsável por realizar uma avaliacão do estado desejado pelo usuário e o que existe atualmente de infraestrutura, criando e alterando o que for necessário.

## Stage: Bake

Responsável por coletar os artefados gerado no estágio "Build" e construir a imagem docker para cada aplicacão

## Stage: Deploy

Responsável por implantar dentro do Kubernetes cada aplicacão atendendo seus requisitos