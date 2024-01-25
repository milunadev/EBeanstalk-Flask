Este repositorio contiene el codigo de una aplicacion web Flask basica, scripts de bash y un pipeline de Github actions para automatizar el despliegue inicial y posteriores actualizaciones de una app Flask en AWS Elastic Beanstalk.

## REQUISITOS PARA SU EJECUCION:

- AccessKeyID y SecretAccessKeyID de un usuario con los permisos especificados en [GithubUserPolicies](https://github.com/milunadev/EBeanstalk-Flask/blob/main/permisos/githubuser_policies.json). Ambas deben ser declarados como secretos de repositorio en GitHub.
![Alt text](static/image.png)

- Definir el nombre 'EC2 Instance profile' como una variable de repositorio con el nombre de INSTANCE_PROFILE. En caso no se tenga un pperfil de instancia, puede crear un rol con la politica gestionada llamada 'AWSElasticBeanstalkWebTier' o usar el formato JSON de esta politica en [beanstalk_ec2_instanceprofile](https://github.com/milunadev/EBeanstalk-Flask/blob/main/permisos/beanstalk_ec2_instanceprofile.json).

- Definir las siguientes variables de repositorio con los valores correspondientes:
![Alt text](static/variables.png).



MEJORAS
- Implementar environments y environment variables y secrets para automatizar el despliegue en diferentes ambientes, aplicando asi la reutilizacion del pipeline.
- Se usa la VPC por defecto