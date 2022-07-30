# Terraform-poc

Este repo fue creado con algunos ejemplos para la charla de Python BOgotá del 30 de Julio acerca de cómo desplegar aplicaciones de Python con terraform.
Los ejemplos están hechos para que se puedan desplegar las aplicaciones en la nube de Google Cloud. Para esto, creé una cuenta en GCP con mi tarjeta de
credito con el fin de utilizar el free tier de Google.

Para poder ejecutar los comandos de terraform y de esta forma desplegar las aplicaciones en GCP necesitas:

1. [Una cuenta en GCP](https://cloud.google.com/billing/docs/how-to/manage-billing-account)
2. [Crear una service account para acceder a los permisos en GCP](https://gmusumeci.medium.com/how-to-create-a-service-account-for-terraform-in-gcp-google-cloud-platform-f75a0cf918d1)
3. Crear la variable de GOOGLE_APPLICATION_CREDENTIALS en tu computador. [En este caso la debes descargar desde el dashboard de GCP](https://cloud.google.com/docs/authentication/getting-started) 
  Yo uso este comando: ``` export GOOGLE_APPLICATION_CREDENTIALS='/path/de/la/llave.json' ```
4. Tener una cuenta en Docker Hub (sólo será necesario para desplegar nuestra app en Cloud Run)
5. Ah bueno... y por supuesto [instalar terraform en tu maquina](https://learn.hashicorp.com/tutorials/terraform/install-cli)... :sweat_smile:

Ya con estos pasos hechos nada más debes correr los comandos contenidos en los archivos ```run_terraform.sh``` que están dentro de las carpetas
