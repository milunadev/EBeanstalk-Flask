Este repositorio contiene el codigo JS de un Lambda que será desplegado mediante el framework Serverless en conjunto con una API Gateway que permite su acceso desde Internet.
El gran beneficio de usar el framework Serverless es que podemos desplegar arquitecturas serverless simples o complejas a través de un solo archivo YML, además el framework ya maneja la idempotencia por lo que no se suelen presentan incompatibilidades ante la creacion o actualización de la arquitectura.
## ARQUITECTURA:

## TECNOLOGIAS USADAS:
- Serverless Framework
- GitHub Actions
- Node.js
- Lambda y API Gateway

## REQUISITOS PARA SU EJECUCION:

- Se hizo uso del ambiente de Github ServerlessENV, donde se declararon los siguientes secretos y variables de ambiente.
![Alt text](static/image.png)

- AccessKeyID y SecretAccessKeyID de un usuario con los permisos especificados a continuación. Ambas deben ser declarados como secretos de ambiente en GitHub.
    - AmazonAPIGatewayAdministrator
    - AmazonS3FullAccess
    - AWSCloudFormationFullAccess
    - AWSLambda_FullAccess
    - CloudWatchLogsFullAccess

## SERVERLESS TEMPLATE:
Optamos por una plantilla con un solo servicio llamado "ServerlessNodeApp", el cual usa el runtime Node.js v18.
El servicio permite crear una funcion Lambda llamada helloUser, que al ser llamada mediante el API HTTP devolverá el mensaje "Hola! Este es el resultado de la prueba tecnica -> 10/10 :D".


![Alt text](static/image-1.png)

Cuando se despliega este servicio, Serverless Framework crea automáticamente una función AWS Lambda con una API Gateway. Esto permite que la función helloUser ubicada en [handler.js](https://github.com/milunadev/PruebaTecnica_p1/blob/serverlessframework/aplicacion/handler.js) sea invocada a través de una solicitud HTTP GET en la ruta especificada.

## PIPELINE DE GITHUBACTIONS:
Este pipeline de GitHub Actions, nombrado deployServerlessFramework, automatiza el proceso de despliegue de una aplicación configurada con el Serverless Framework en AWS, incluyendo:
    - Inicia la ejecución cuando haya push a la rama serverlessframework, que es donde se encuentra el proyecto.
    - Configuracion del entorno de ejecución instalando el framework, NodeJS en la version 18.
    - Gestión de credenciales para creación de recursos.
    - Despliegue de la plantilla con flag verbose que permite ver el proceso y los resultados del pipeline.

![Alt text](static/image-2.png)

## EJECUCION
- Realizamos un cambio en el codigo de la app, seguido de un git push origin serverlessframework desde el local y se dispara el pipeline. Vemos que se completa la ejecución con exito.

![Alt text](static/pipeline.png)

- Verificamos tambien la ejecución del stack de Cloudformation la cual actualiza el artifact almacenado en S3 con el nuevo código de la app que se pasará a desplegar en Lambda.

![Alt text](static/cloudf.png)

- Al finalizar el pipeline de Github se muestran los logs de interes, que incluyen en endpoint HTTP que usaremos para consultar la aplicacion desplegada en Lambda.

![Alt text](static/url.png)
- Consultando la URL:  https://4jssc7693k.execute-api.us-east-2.amazonaws.com/dev/pruebatecnica

![Alt text](static/WEB.png)
## MEJORAS
- Evaluar a detalle que permisos son requeridos explicitamente por el framework de serverless para aplicar el principio de minimo privilegio, por ahora se abrieron permisos full a servicios involucrados como ApiGateway, S3 para almacenar el artifact, Lambda, Cloudwatch y CloudFormation.