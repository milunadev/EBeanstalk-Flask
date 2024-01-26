import json

# import requests


def lambda_handler(event, context):
    return {
        "statusCode": 200,
        "body": "HOLA! Este Lambda fue desplegado por Github Actions y SAM :D"
    }
