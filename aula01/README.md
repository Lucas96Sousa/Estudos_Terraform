# Docker commands
<b>Para iniciar o docker com um shell de terraform é necessário incluir os comandos:
docker run -it -v $PWD:/app -w /app --entrypoint "" hashicorp/terraform:light sh</b>


# Terraform plan methods
Utilizar o terraform plan -out para determinar um plan separado