# Projeto IdWall Terraform
---
## Processo de Resolução
O projeto foi desenvolvido com o objetivo de provisionar automaticamente uma infraestrutura na GCP, utilizando o Terraform como ferramenta de infraestrutura como código.

---
### Processo de Resolução – Desafio Terraform
O desafio consistia em provisionar, por meio de código automatizado com Terraform, uma infraestrutura funcional na Google Cloud Platform (GCP), capaz de executar uma aplicação web de forma segura e acessível.

O processo teve início com a definição da versão do Terraform e do provedor da GCP, garantindo compatibilidade e estabilidade da ferramenta. Em seguida, foi configurado o acesso ao projeto da Google Cloud utilizando um arquivo de credenciais e o uso de variáveis para tornar o código mais flexível e reutilizável, como região e IP de acesso via SSH.

Para a criação da infraestrutura, foi definida uma rede virtual (VPC) personalizada e, dentro dela, uma sub-rede configurada com um intervalo específico de endereços IP. Essa estrutura de rede foi projetada para garantir organização e controle sobre os recursos.

O acesso externo à instância foi cuidadosamente controlado por meio de regras de firewall. Foram criadas duas regras principais: uma para liberar a porta 22 (SSH) apenas para um IP específico informado pelo usuário, e outra para liberar as portas 80 (HTTP) e 443 (HTTPS) para acesso público, permitindo que a aplicação fosse visualizada via navegador.

A instância de máquina virtual criada foi baseada no sistema Debian e configurada com recursos básicos. Um script de inicialização foi incluído para automatizar a instalação do Docker e o deploy de um container Apache com uma página HTML simples, permitindo que a aplicação fosse acessada imediatamente após o provisionamento.

Além disso, o código foi estruturado para detectar automaticamente a melhor zona de disponibilidade dentro da região selecionada, tornando o deploy mais resiliente. Por fim, foi adicionado um output que exibe o IP público da instância no terminal ao final da execução, facilitando o acesso direto à aplicação.

O tempo médio de provisionamento completo, incluindo o download de pacotes e inicialização dos serviços, foi de aproximadamente 3 a 7 minutos. Ao final do processo, a aplicação estava acessível pela internet, pronta para ser testada, validando assim o sucesso do desafio.