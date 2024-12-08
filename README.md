## Automação de exportação de logs do cloudWatch para o S3 com Lambda e EventBridge usando Terraform  

Este projeto implementa a automação da exportação de logs do **Amazon CloudWatch** para o **Amazon S3** utilizando **AWS Lambda** e **Amazon EventBridge**. A infraestrutura foi provisionada com **Terraform**, permitindo um processo repetível e versionado.  

### 📝 Descrição  

Ao gerenciar aplicações na AWS, os logs do CloudWatch fornecem informações valiosas para monitoramento e depuração. No entanto, armazenar grandes volumes de logs no CloudWatch pode gerar custos elevados, além de dificultar análises detalhadas.  

Este projeto resolve esse problema exportando logs automaticamente do CloudWatch para um bucket do S3. A exportação para o S3 não só reduz os custos, como também facilita a integração com ferramentas analíticas e de arquivamento.  

### 🎯 Caso de Uso  

Este projeto é ideal para:  
1. **Reduzir custos** com armazenamento no CloudWatch, movendo logs para S3.  
2. **Armazenar logs a longo prazo** em um formato econômico.  
3. **Habilitar análises avançadas** em logs exportados, utilizando ferramentas como AWS Athena ou outras soluções de Big Data.  
4. **Manter conformidade** com requisitos de auditoria e armazenamento de logs históricos.  

## 🛠️ Tecnologias utilizadas  

- **Terraform**: Infraestrutura como código para provisionamento e gerenciamento de recursos na AWS.  
- **Amazon CloudWatch**: Serviço para coleta e monitoramento de métricas e logs.  
- **Amazon S3**: Armazenamento escalável e econômico para logs exportados.  
- **AWS Lambda**: Função serverless para orquestrar a exportação dos logs.  
- **Amazon EventBridge**: Agendamento de eventos para disparar a execução da Lambda periodicamente.  

### 📂 Estrutura do projeto  

```plaintext
├── app/
│   └── lambda_function.py   # Código da função Lambda
├── infra/
│   ├── eventbridge.tf       # Configuração do EventBridge
│   ├── iam_roles.tf         # Configuração de roles do IAM
│   ├── lambda.tf            # Configuração da função Lambda
│   ├── main.tf              # Configuração principal do Terraform
│   ├── outputs.tf           # Outputs da configuração do Terraform
│   ├── s3.tf                # Configuração do bucket S3
│   └── variables.tf         # Variáveis para personalização da infraestrutura
├── .gitignore               # Arquivos e pastas ignorados pelo Git
└── README.md                # Documentação do projeto
```

## 📋 Funcionalidades  

### Provisionamento automático:  
- Criação de um bucket S3 com políticas configuradas para armazenar logs.  
- Configuração de grupos de log no CloudWatch.  
- Configuração de uma função Lambda para gerenciar a exportação.  

### Automação com EventBridge:  
- Um cron job (agendamento) é configurado no EventBridge para acionar a função Lambda periodicamente.  

### Infraestrutura Segura:  
- Policies do IAM definidas para garantir que a Lambda tenha acesso somente aos recursos necessários.  

## 🚀 Como executar  

### Pré-requisitos  
- Instale o Terraform (>= 1.5.0).  
- Configure suas credenciais da AWS localmente usando o AWS CLI.  
- Certifique-se de que você tem permissões para criar recursos como Lambda, EventBridge, S3 e CloudWatch Logs na conta AWS.  

### Passos  

1. Clone o repositório:  

```bash
   git clone <seu-repo-url>
   cd <nome-do-repo>
```

2. Inicialize o Terraform:

```bash
terraform init
```

3. Revise as variáveis no arquivo variables.tf e personalize conforme necessário.

```bash
terraform plan
```

4. Execute o plano

```bash
terraform plan
```

5. Aplique as mudanças

```bash
terraform apply
```

6. Confirme a aplicação dos recursos na AWS

## 📈 Resultados Esperados
- Um bucket S3 receberá logs exportados do CloudWatch.
- A função Lambda será acionada automaticamente conforme o cron configurado no EventBridge.
- Logs estarão disponíveis para análise ou arquivamento no S3.

## 📖 Referências  

- [Tutorial original no Dev.to](https://dev.to/rasankhalsa/automate-cloudwatch-logs-export-to-s3-using-lambda-and-event-bridge-2mdd)  
- [Documentação do Terraform](https://www.terraform.io/docs/index.html)  
- [Documentação do AWS CloudWatch](https://docs.aws.amazon.com/cloudwatch/index.html)  

