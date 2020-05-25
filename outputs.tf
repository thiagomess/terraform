
#Exibe a informação no console apos subir ou dar um terraform refresh
output "dev4" {
  value = "${aws_instance.dev4.public_ip}"
}
output "dev5" {
  value = "${aws_instance.dev5.public_ip}"
}

output "dev6" {
  value = "${aws_instance.dev6.public_ip}"
}
