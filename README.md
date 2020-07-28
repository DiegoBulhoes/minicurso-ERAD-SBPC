# Minicurso para o ERAD SBPC - UFMS

O minicurso tem como objetivo realizar um processo de deploy de um app simples. Através de exercícios propostos durante o minicurso, serão ensinados e exemplificados os conceitos das ferramentas **Ansible, Terraform e uma stack simples de monitoramento** (Prometheus, Node-export e Grafana).

## Terraform

O Terraform irá instanciar 3 maquinas, 2 subredes(**public** e **private**) e compartilhar a chave pública do host com as máquinas virtuais, **deverá ter o nome "id_rsa_gcp_erad.pub"**. Para passar as credenciais para o terraform basta popular a variável de ambiente **GOOGLE_APPLICATION_CREDENTIALS**.

```shell
  export GOOGLE_APPLICATION_CREDENTIALS=<path_json>
```

### Executando o Terraform

Para inicializar o Terraform, basta executar o seguinte comando:

```shell
  terraform init
```

Após ser inicializado, execute o seguinte comando para visualizar as alterações que o Terraform irá realizar:

```shell
  terraform plan
```

Para realizar as modificações:

```shell
  terraform apply
```

## Ansible

O Ansible irá configurar as 3 máquinas com as seguintes ferramentas:

- Grafana
- Cadvisor
- Prometheus
- Node-exporter

Para realizar a configuração será necessário popular a variável de ambiente **GCP_SERVICE_ACCOUNT_FILE**

```shell
  export GCP_SERVICE_ACCOUNT_FILE=<path_json>
```

### Executar o Ansible

Para isso, basta realizar o download do plugin **gce_compute**, executando o seguinte comando:

```shell
  pip install requests google-auth
```

Para inicializar o Ansible:

```shell
  ansible-playbook -i inventory.gcp.yml -u erad  playbook.yml
```
