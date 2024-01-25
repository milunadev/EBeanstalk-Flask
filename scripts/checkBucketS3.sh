#!/bin/bash

BUCKET_NAME=$1
REGION=$2

echo $BUCKET_NAME

if aws s3 ls "s3://$BUCKET_NAME" 2>&1 | grep -q 'NoSuchBucket'
then
  echo "El bucket no existe. Creando bucket: $BUCKET_NAME"
  aws s3 mb "s3://$BUCKET_NAME" --region "$REGION"
else
  echo "El bucket ya existe: $BUCKET_NAME"
fi
