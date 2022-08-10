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
<p> Todo arquivo que termine com .auto.tfvars quando for executado o plan -out será usado os dados contidos no arquivo .auto.tfvars </p>