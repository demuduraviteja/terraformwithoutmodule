output "ec2_public_ip" {
  value = aws_instance.myec2withoutmodule.public_ip
}