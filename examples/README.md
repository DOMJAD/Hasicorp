# Ejemplos de Terraform + AWS para Terraform Cloud

Dos ejemplos independientes, cada uno con su propio bloque `cloud {}` para que
puedas crear un workspace en Terraform Cloud (TFC) por ejemplo y probarlo.

- `01-s3-bucket/`: ejemplo mínimo — un bucket S3 con versionado, cifrado y
  bloqueo de acceso público. Ideal para la primera prueba de conexión con TFC.
- `02-vpc-ec2/`: ejemplo más completo — VPC, subred pública, internet gateway,
  tabla de rutas, security group e instancia EC2 con un servidor web básico.

## Antes de empezar

1. Edita en cada `main.tf` el bloque `cloud { organization = "YOUR_TFC_ORG" }`
   con el nombre real de tu organización en Terraform Cloud.
2. En TFC, crea un workspace por ejemplo con el mismo nombre que aparece en
   `workspaces { name = "..." }` (o cambia el valor para que coincida con uno
   que ya tengas). Tipo de workspace: **CLI-driven**.
3. En cada workspace de TFC, configura las variables de entorno con tus
   credenciales de AWS (marcadas como *sensitive*):
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
   - (opcional) `AWS_SESSION_TOKEN` si usas credenciales temporales

## Uso

```bash
cd examples/01-s3-bucket   # o 02-vpc-ec2
terraform login            # solo la primera vez, genera un token de TFC
terraform init
terraform plan
terraform apply
```

Como ambos usan `cloud {}`, el estado y la ejecución del plan/apply ocurren en
Terraform Cloud (remote execution), no en tu máquina — útil precisamente para
probar que la integración funciona.

Para destruir los recursos de prueba:

```bash
terraform destroy
```
