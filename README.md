# container-arch--aws-ecs-cluster

Provisiona o cluster ECS e o Load Balancer compartilhado via o módulo [`ecs_cluster`](https://github.com/therenanlira/container-arch--aws-modules/tree/main/ecs_cluster). Consome o state da VPC (`container-arch--aws-vpc`) via `terraform_remote_state`.

## Estrutura

Terraform em `terraform/`, com workspaces por ambiente (`terraform.tfvars`). Hoje só o workspace `dev` está configurado.

## Pipeline (`.github/workflows/`)

- **`cicd.yaml`** — orquestrador. Em PR `dev -> main` e em push/merge na `main`, aplica o workspace `dev`. Blocos de `prd` já existem, comentados.
- **`pipeline.yaml`** — reusable workflow (lint/validate → plan → apply), compartilhado entre os repos de infra.
- **`destroy.yaml`** — roda `terraform plan -destroy` diariamente às 09:20 UTC (06:20 BRT) e só destrói se houver recursos; também pode ser disparado manualmente. Roda **antes** da VPC e **depois** do app no ciclo diário (o cluster depende da VPC; o app depende do cluster).

## Uso local

```bash
cd terraform
terraform init
terraform workspace select dev
terraform plan
terraform apply
```
