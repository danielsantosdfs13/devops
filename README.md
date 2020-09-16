## Requisitos:

- Ambiente Cloud (AWS)
- Infraestrutura básica de rede (firewall, subnets, etc)
- Load Balancer
- Aplicação Web: pode ser qualquer tipo de aplicação que demonstre a utilização de Docker e conteúdo estático
- Resolução de DNS para o Load Balancer
- Automatização do processo de build da Aplicação Web e implantação de todos os recursos no serviço cloud utilizado
- Documentação detalhada e instruções para execução em ambiente real (produção e desenvolvimento).

## Tecnologias sugeridas:

Pode-se fazer uso das seguintes tecnologias:
*   Docker
*   Terraform
*   Ansible
*   Kubernetes

OBS: outras ferramentas/soluções também são bem vindas, desde que funcione de forma simples e eficiente.

## Será avaliado:

- Organização
- Qualidade da documentacão
- Uso de ferramentas de automatização
- Elegância na solução proposta
- Simplicidade e eficiência
- Técnicas e boas práticas de segurança

## Entrega:

O código deverá ser entregue em um repositório git hospedado na núvem (ex: GitHub).

# Documentacão

Este projeto contem os arquivos que simulam uma pipeline CI/CD com intuíto de realizar provisionamento de um cluster Kubernetes (AWS EKS) utilizando terraform, provisionamento de duas aplicacões demo (backend e frontend).

## Stage: Prepare

Responsável por realizar uma avaliacão do estado desejado pelo usuário e o que existe atualmente de infraestrutura, criando e alterando o que for necessário.

## Stage: Bake

Responsável por coletar os artefados gerado no estágio "Build" e construir a imagem docker para cada aplicacão

## Stage: Deploy

Responsável por implantar dentro do Kubernetes cada aplicacão atendendo seus requisitos