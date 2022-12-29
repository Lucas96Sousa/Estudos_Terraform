# Docker commands

<b>Para iniciar o docker com um shell de terraform é necessário incluir os comandos:
docker run -it -v $PWD:/app -w /app --entrypoint "" hashicorp/terraform:light sh</b>

# Terraform plan methods

### Utilizar o terraform plan -out para determinar um plan separado, exemplo

<b>terraform plan -out anotherPlan</b>

# Uso de referências

### Exemplo de uso de referência

<p>
output "ip_address" {
  value = aws_instance.web.public_ip
}
</p>
Nesse caso estamos apontado para um recurso.

<h1> Uso do metodo data</h1>

O data ira buscar a informação dentro do provider, que esta descrito na função.

exemplo de uso:

```md
resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}
```

No método ami, passamos o data.aws para que gere um id dinâmico, o mesmo ocorre no output.tf com o value do ip_address

## Uso de variaveis

<p> Todo arquivo que termine com .auto.tfvars quando for executado o plan -out será usado os dados contidos no arquivo <span>.auto.tfvars</span> </p>

## Aula02 (Modules, Backend, state, Workspace)

### Modules

<p>Todos os arquivos .tf e similares dentro da pasta raiz é considerado como modulo raiz </p>
<p> Como boa prática é ideal que o main.tf(que tenha o provider e terraform) esteja sempre na raiz do projeto</p>

<p> Uma pasta com os arquivos .tf é um modulo </p>


### Chamando um modulo filho
<p> Para chamar o modulo que deseja utilizar é necessário colocar esse input</p>

```md
module "name" {
    source = "caminho do modulo que deseja utilizar"
    servers= 5(inputs)
  }

  exemplo: 

  module "servers" {
    source = "./server"
    servers = 2
}
```

<b>No arquivo de variables, criar uma variavél nova vazia com o nome do seu modulo </b>

### DynamoDB - Lock State

dynamodb.tf 

```
resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "terraform-state-lock-dynamo"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20

  attribute {
    name= "LockID"
    type = "S"
  }

  tags = {
    name = "DynamoDB Terraform State Lock"

  }
}
```

main.tf

backend {
dynamodb_table = "terraform-state-lock-dynamo"
}


### Terraform import
Não gera codigo, apenas importa para o state.


### Terraform workspace
Permite trabalhar com varias instancias com diferentes clouds.

Para listar os workspace diferentes o comando é terraform workspace list