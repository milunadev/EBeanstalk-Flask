Este repositorio contiene el codigo de una aplicacion web Flask basica, scripts de bash y un pipeline de Github actions para automatizar el despliegue inicial y posteriores actualizaciones de una app Flask en AWS Elastic Beanstalk.

REQUISITOS PARA SU EJECUCION:
    - AccessKeyID y SecretAccessKeyID de un usuario con los permisos especificados en [GithubUserPolicies]()
- 



Beanstalk instance profile
https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/concepts-roles-instance.html

MEJORAS
- Implementar environments y environment variables y secrets para automatizar el despliegue en diferentes ambientes, aplicando asi la reutilizacion del pipeline.
- Se usa la VPC por defecto