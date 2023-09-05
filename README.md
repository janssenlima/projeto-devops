# projeto-devops
Repositório com o ambiente do Projeto DevOps

# Pré-requisitos para rodar o projeto
- Docker
- Kind
- Terraform
- Ansible
- Python
- Helm

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