# Projeto DevOps
Repositório do desafio para criar uma pipeline CI/CD que constrói, testa e implanta um aplicativo Python simples em um cluster Kubernetes.

# Pré-requisitos para rodar o projeto
- Docker
- Kind
- Terraform
- Ansible
- Python
- pip3
- Helm
- kubectl
- Make
- openssh-server

# Como rodar o Projeto DevOps:
Clone este repositório

`git clone https://github.com/janssenlima/projeto-devops.git`

## Preparação do ambiente
### Gerar a chave SSH
`ssh-keygen -t rsa`

`cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys`

Edite o arquivo ```dev``` dentro do diretório ```ansible``` e altere o parâmetro ```ansible_ssh_user``` para o usuário que você estiver logado no sistema.

Execute os comandos abaixos para instalar as collections para serem usadas no playbook do Ansible:

`ansible-galaxy collection install kubernetes.core`

`ansible-galaxy collection install community.kubernetes`

# Subir o cluster Kubernetes

`cd cluster`

Para facilitar o provisionamento do cluster, o comando make pode ser usado para verificar as opções.

`make`

Por exemplo, para provisionar o cluster, execute:

`make init`

`make plan`

`make up`

Você também pode utilizar os comandos do terraform, caso o pacote make não esteja instalado no seu sistema.

`terraform init`

`terraform plan`

`terraform apply`

Verifique se o cluster está pronto com o comando:

`kubectl get node`

Obs.: Por padrão, este laboratório está rodando apenas com o nó no cluster. Se você desejar incluir mais nós (workers node), altera o arquivo ```cluster/main.tf```. Neste arquivo eu deixei um exemplo comentado.

# Fazer o deploy das stacks no cluster com Ansible

Com o cluster em execução, podemos aplicar o deploy das stacks.

Para garantir o funcionamento do ansible para este laboratório, podemos executar os seguintes comandos:

`absible-inventory --list -y`

Este comando irá retornar com o host ```devops```, que está configurado no arquivo ```dev``` dentro do diretório ```ansible```.

```ansible all -m ping -u <seu_usuário>```

Este comando deverá retornar o status ```SUCCESS```

Com o sucesso na execução dos comandos acima, podemos prosseguir com o deploy da stack.

Para isso, na raiz do projeto entre no diretório ansible e execute o seguinte comando:

`ansible-playbook playbooks/kubernetes.yaml -e host=devops`

Este comando irá fazer o deploy das seguintes ferramentas:
- Prometheus
- Grafana
- Loki
- Promtail
- ArgoCD