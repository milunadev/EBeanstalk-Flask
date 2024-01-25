#!/bin/bash

# Declarando variables
APP_NAME=$1
ENV_NAME=$2
REGION=$3
SECURITY_GROUP_NAME="FlaskHTTPSecurityGroup"

# Verificar si el grupo de seguridad ya existe
GROUP_ID=$(aws ec2 describe-security-groups --filters Name=group-name,Values=$SECURITY_GROUP_NAME --query 'SecurityGroups[*].GroupId' --output text --region $REGION)

if [ -z "$GROUP_ID" ]; then
    echo "El grupo de seguridad no existe. Creando grupo: $SECURITY_GROUP_NAME"
    GROUP_ID=$(aws ec2 create-security-group --group-name $SECURITY_GROUP_NAME --description "Grupo de seguridad para permitir trafico en el puerto 80" --query 'GroupId' --output text --region $REGION)
    # Agregando regla inbound HTTP
    aws ec2 authorize-security-group-ingress --group-id $GROUP_ID --protocol tcp --port 80 --cidr 0.0.0.0/0 --region $REGION
else
    echo "El grupo de seguridad ya existe: $SECURITY_GROUP_NAME"
fi

## VALIDAR APP BEANSTALK ##
if ! aws elasticbeanstalk describe-applications --application-names $APP_NAME --region $REGION | grep -q $APP_NAME; 
then
  echo "Creando aplicación: $APP_NAME"
  aws elasticbeanstalk create-application --application-name $APP_NAME --region $REGION
fi

## VALIDAR ENVIRONMENT BEANSTALK ##
if ! aws elasticbeanstalk describe-environments --application-name $APP_NAME --environment-names $ENV_NAME --region $REGION | grep -q $ENV_NAME; 
then
    echo "Creando entorno: $ENV_NAME"
    aws elasticbeanstalk create-environment --application-name $APP_NAME --environment-name $ENV_NAME --solution-stack-name "64bit Amazon Linux 2 v3.5.10 running Python 3.8" --option-settings Namespace=aws:autoscaling:launchconfiguration,OptionName=SecurityGroups,Value=$SECURITY_GROUP_NAME --region $REGION
fi