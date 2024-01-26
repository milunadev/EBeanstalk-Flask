# PREGUNTA 1
Diseñar la infraestructura de CI/CD de Github a un Elastic Beanstalk en AWS , Github a un Lambda y ApiGateway y de un proyecto en serverless (Framework) en Github con despliege automatico 

Este repositorio contiene tres ramas, cada una para los 3 escenarios propuestos en la pregunta 1. Cada escenario está aislado en su propia rama, utilizando entornos de GitHub para gestionar las configuraciones de despliegue de forma segura y específica.
![Alt text](static/image.png)

## USO DE AMBIENTES EN GITHUB ACTIONS
Los ambientes de GitHub Actions se utilizan para proporcionar configuraciones aisladas y seguras para cada escenario de despliegue. Esto incluye la gestión de secretos como las credenciales de AWS, variables de entorno específicas de cada entorno y controles de seguridad adicionales.
![Alt text](static/image-2.png)



## Escenarios de Despliegue
Cada rama representa un escenario único y está configurada con su propio conjunto de GitHub Actions y recursos AWS.
### 1. Elastic Beanstalk

- Rama: elastic-beanstalk
- Entorno: BeanstalkENV
- Descripción: Despliegue automático de una aplicación Flask en AWS Elastic Beanstalk.
- Ver rama [Elastic Beanstalk](https://github.com/milunadev/PruebaTecnica_p1/tree/beanstalkFlask)

### 2. Lambda y API Gateway
- Rama: lambda-api-gateway
- Entorno: LambdaENV
- Descripción: Implementación de una función Lambda accesible a través de API Gateway, configurada para despliegues automáticos.
- Ver rama [Lambda y API Gateway](https://github.com/milunadev/PruebaTecnica_p1/tree/lambdaApiGateway)

### 3. Serverless Framework
- Rama: serverless-framework
- Entorno: ServerlessENV
- Descripción: Despliegue automático de un servicio serverless utilizando el Serverless Framework para la gestión de infraestructura como código.
- Ver rama [Serverless Framework](https://github.com/milunadev/PruebaTecnica_p1/tree/serverlessframework)