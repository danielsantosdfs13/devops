![CI-FRONTEND](https://github.com/danielsantosdfs13/devops/workflows/CI-FRONTEND/badge.svg?branch=frontend-foo-dev)

# Premissas 

Para funcionamento correto da pipeline utilizado nessa branch é necessário que tenha realizado a inplantação da infraestrutura básica descrita na [branch IAC](https://github.com/danielsantosdfs13/devops/tree/iac).

## Requisitos obrigatórios

Será retornado o endereço de DNS que você irá precisar configurar em sua zona de DNS.

```
Print loadbalancer endpoint
Run kubectl get svc devops-ingress-ingress-nginx-controller | awk 'NR>1 {print $4}'
abf2af26f0f784567b0643074d2613d4-1804244159.us-east-1.elb.amazonaws.com
```
# Descrição branch FRONTEND-FOO e FRONTEND-FOO-DEV

Codigo fonte da aplicação frontend-foo. Para qualquer push realizado na branch FRONTEND-FOO-DEV será realizado CI/CD e entregue para o ambiente de HML.

Já para os push realizados na branch FRONTEND-FOO simulando a branch master de qualquer repositório, será entregue para o ambiente PRD.

## Variáveis obrigatórias

| Nome                    | Origem  | Opcional ? | Descrição                                                                                     |
| :-------------------    | :-----: | :--------: | --------------------------------------------------------------------------------------------- |
| AWS_ACCESS_KEY_ID       |  Projeto (Secrets)   |    NÃO     | ID da chave de acesso para realizar acões na AWS                                 |
| AWS_SECRET_ACCESS_KEY   |  Projeto (Secrets)   |    NÃO     | Segredo da chave de acesso para realizar acões na AWS                            |
| FRONTEND_REPO_NAME      |  Projeto (Secrets)   |    NÃO     | Nome do repositorio ECR a ser utilizado pela aplicação frontend-foo              |

## Pipeline de CI-FRONTEND

Etapas: 
- Criar imagem docker no repositório ECR com as tags (latest e commit_id) para ambiente produtivo e (latest) para ambiente não produtivo
- Realizar implantação da aplicação utilizando helm no kubernetes utilizando namespace (prd) para ambiente produtivo e (hml) para ambiente não produtivo
- Atualizar registro DNS na zona de dns utilizada pela stack

## Descrição das aplicações

### frontend-foo

| Item                  | Valor                                                 | Descrição ?                                                                                    |
| :-------------------  | :-----:                                               | :--------:                                                                                     |
| Engine                |  Node.js                                              |    N/A                                                                                         |
| Porta                 |  8080                                                 |    Porta tcp configurada na aplicação                                                          |
| Path (PRD)            |  http://**`<URL_BASE>`**/api                          |    Url para acesso ao frontend-foo                                                              |
| Path (HML)            |  http://**`<URL_BASE`**/api                           |    Url para acesso ao frontend-foo                                                              |
| Helm values (PRD)     |  src/kubernetes/prd-values.yaml                       |    Valores utilizado pela branch frontend-foo para aplicação do helm ambiente produtivo         |
| Helm values (HML)     |  src/kubernetes/values.yaml                           |    Valores utilizado pela branch frontend-foo-dev para aplicação do helm ambiente não produtivo |
| Dockerfile            |  src/dockerfile                                       |    Definição da imagem docker para aplicação frontend-foo                                       |

## Configurações importantes

### Definir url de acesso 

Para definir a url da aplicação basta alterar a propriedade ingress/host dentro do arquivo  `/src/kubernetes/prd-values.yaml` para ambiente produtivo:

```yaml
ingress:
  enabled: true
  host: amoremfigurinhasbh.com.br
  routes: 
    - paths:
        - path: /
```

E dentro do arquivo `/src/kubernetes/values.yaml` para ambiente não produtivo:

```yaml
ingress:
  enabled: true
  host: dev.amoremfigurinhasbh.com.br
  routes: 
    - paths:
        - path: /
```
**Lembrando que alterações na branch frontend-foo-dev sempre irão utilizar o arquivo values.yaml e alterações na branch frontend-foo sempre vão utilizar o arquivo prd-values.yaml**

### Configurar auto scale para a aplicação

Basta editar a propriedade hpa do arquivo values.yaml ou prd-yaml seguindo o mesmo padrão descrito acima.

```yaml
hpa:
  enabled: true
  minReplicas: 1
  maxReplicas: 1
  targetCPU: 80
```
