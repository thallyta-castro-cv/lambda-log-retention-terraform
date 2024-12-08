import boto3
import os
import datetime

# Variáveis de ambiente
GROUP_NAME = os.getenv("GROUP_NAME", "default-log-group")
DESTINATION_BUCKET = os.getenv("DESTINATION_BUCKET", "default-bucket")
PREFIX = os.getenv("PREFIX", "logs-prefix")
NDAYS = int(os.getenv("NDAYS", 1))  # Quantidade de dias retroativos para exportação

# Calculando intervalo de datas
current_time = datetime.datetime.now()
start_date = current_time - datetime.timedelta(days=NDAYS)
end_date = current_time - datetime.timedelta(days=NDAYS - 1)

from_date = int(start_date.timestamp() * 1000)
to_date = int(end_date.timestamp() * 1000)

bucket_prefix = os.path.join(
    PREFIX, start_date.strftime('%Y/%m/%d')
)

def lambda_handler(event, context):
    client = boto3.client('logs')

    try:
        # Criar a tarefa de exportação
        response = client.create_export_task(
            logGroupName=GROUP_NAME,
            fromTime=from_date,
            to=to_date,
            destination=DESTINATION_BUCKET,
            destinationPrefix=bucket_prefix
        )
        print(f"Tarefa de exportação criada com sucesso: {response}")
        return {
            "statusCode": 200,
            "body": f"Exportação de logs iniciada para o bucket {DESTINATION_BUCKET} com prefixo {bucket_prefix}."
        }
    except Exception as e:
        print(f"Erro ao criar tarefa de exportação: {str(e)}")
        return {
            "statusCode": 500,
            "body": f"Erro ao criar tarefa de exportação: {str(e)}"
        }
