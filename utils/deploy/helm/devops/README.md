devops
=========

Devops é o chart responsável por criar os recursos para sistema demo, com api e frontend.

```
variables:
  PROJECT_TYPE: A definir
```
Template
helm template backend-foo /Users/bi002264/sourcecode/my/person/devops/pipelines/deploy/helm/devops -n default -f backend-foo.yaml

Deploy
helm upgrade v1-inter-cb-jcot-app-test-master /Users/bi002264/sourcecode/my/person/devops/pipelines/deploy/helm/devops -n hml -f app-values.yaml