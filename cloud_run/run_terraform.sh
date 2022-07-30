docker build . -t gcr.io/<project_id>/hello_terraform
docker push -t gcr.io/<project_id>/hello_terraform
terraform init
terraform plan
terraform apply
