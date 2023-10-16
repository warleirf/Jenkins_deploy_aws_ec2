#!/bin/bash

# Define as variáveis
REGIAO=$REGION 
NOME_INSTANCIA=$NOME_INSTANCIA
TIPO_INSTANCIA=$TYPEINSTANCE
AMI_ID=$AMI
ASSOCIAR_IP_PUBLICO=$4
TAMANHO_DISCO=$TAMANHO_DISCO
COUNT=$COUNT
SUBNET=$SUBNET
CHAVE=$KEYPAIR
GRUPO_SEGURANCA=$SECURITYGROUP

# configuracao inicial para deploy na aws e variavel da regiao escohida
aws ec2 run-instances --region $REGION \
# Escolha da imagem, tipo do sistema operacional
--image-id $AMI \
# Escolha do tipo de shape da maquina, relacionado com quantidade de memoria ou CPU
--instance-type $INSTANCETYPE \
# Escolha se a instancia tem IP publico vinculado ou nao
--block-device-mappings "[{ \"DeviceName\": \"/dev/sda1\", \"Ebs\": { \"VolumeSize\": $TAMANHO_DISCO, \"VolumeType\": \"$TIPO_DISCO\" } }]" \
# Escolhe do tamnho do disco e o tipo de disco
--$PUBLIC_IP \
# Quantidade de instancias do deploy
--count $COUNT \
# Escolha da subnet
--subnet-id $SUBNET \
# Qual grupo de seguranca escolhida
--security-group-ids $SECURITYGROUP \
# Par de chave de acesso da instancia
--key-name $KEYPAIR \
# Especificacao das tags escolhidas
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value='$NOME_INSTANCIA'},{Key=Ambiente,Value='$AMBIENTE'},{Key=Backup,Value='$BACKUP'}]' 'ResourceType=volume,Tags=[{Key=Name,Value='$NOME_INSTANCIA'}]' \
# Ativar a opcao de protecao contra desligamento
--disable-api-termination


