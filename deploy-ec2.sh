aws ec2 run-instances --region $REGION \
--image-id $AMI \
--instance-type $INSTANCETYPE \
--$PUBLIC_IP \
--count $COUNT \
--subnet-id $SUBNET \
--security-group-ids $SECURITYGROUP \
--key-name $KEYPAIR \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value='$NOME_INSTANCIA'},{Key=Ambiente,Value='$AMBIENTE'},{Key=Backup,Value='$BACKUP'}]' 'ResourceType=volume,Tags=[{Key=Name,Value='$NOME_INSTANCIA'}]' \
--disable-api-termination


