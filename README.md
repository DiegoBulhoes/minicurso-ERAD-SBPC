# Minicurso para o ERAD SBPC - UFMS

O minicurso tem como objetivo de realizar um processo de deploy de um app simples, através dos exercícios propostos durante o minicurso, será ensinado e exemplificado os conceitos das ferramentas **Ansible, Terraform e uma stack simples de monitoramento** (Prometheus, Node-export e Grafana).

## Executando o Terraform

Para inicializar o Terraform, basta executar o seguinte comando:

```shell
   terraform init
```

Após de ter inicializado, execute o seguinte comando para visualizar as alterações que o Terraform irá realizar:

```shell
   terraform plan
```

Para realizar as modificações:

```shell
   terraform apply
```

## Execultar o Ansible

Basta realizar o dowload do plugin **gce_compute**, para isso execute o seguinte comando:

```shell
   pip install requests google-auth
```

Para inicializar o Ansible:

```shell
   ansible-playbook -i inventory.gcp.yml -u erad  playbook.yml
```
