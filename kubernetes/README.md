# Projeto IdWall Kubernetes

---

## Importante

Antes de subir a aplicação, insira o comando abaixo no terminal devido à necessidade de senha por determinados comandos:

```bash
sudo su
```

---

## Passos para fazer o deploy

1. Primeiro entre na pasta do projeto e rode o comando:

```bash
./build-image.sh
```

2. Em seguida, rode o comando:

```bash
./deploy.sh
```

---
## Processo de Resolução – Desafio Kubernetes

O desafio teve como objetivo empacotar e orquestrar uma aplicação Node.js com Express utilizando o Kubernetes de forma local, com suporte a variáveis de ambiente, múltiplas réplicas e acesso via Ingress Controller.

O processo teve início com a criação uma rota /health para fins de monitoramento, simulando estados de saúde da aplicação com base no tempo de uptime.

Em seguida, foi construído uma imagem usando o Dockerfile com base na imagem node:9-alpine. O build da imagem foi feito localmente no ambiente Docker do Minikube, utilizando o comando eval $(minikube docker-env) para direcionar o build diretamente ao cluster.

Na camada de orquestração, foram criados os manifestos YAML para todos os recursos do Kubernetes:

ConfigMap: armazenou a variável de ambiente NAME, usada pela aplicação para exibir uma saudação personalizada.

Pod e ReplicaSet: garantiram múltiplas instâncias da aplicação em execução, com replicação configurada para alta disponibilidade.

Deployment: controlou o gerenciamento das réplicas e permitiu atualizações com zero downtime.

Service: expôs a aplicação internamente no cluster via ClusterIP, permitindo que o Ingress redirecionasse o tráfego corretamente.

Ingress: permitiu o acesso externo à aplicação por meio do domínio local localhost.js-idwall, mapeado no /etc/hosts para o IP do Minikube.

O Ingress foi ativado no cluster por meio do comando minikube addons enable ingress e o tráfego foi roteado com suporte ao minikube tunnel, garantindo que serviços tipo ClusterIP pudessem ser acessados externamente.

Todo o processo foi automatizado em dois scripts Bash:

Um script para build da imagem Docker local (build-image.sh).

Um script completo de deploy (deploy.sh) que inicializa o Minikube, configura o ambiente, habilita o Ingress, ajusta o /etc/hosts, sobe o tunnel e aplica todos os recursos YAML do Kubernetes.